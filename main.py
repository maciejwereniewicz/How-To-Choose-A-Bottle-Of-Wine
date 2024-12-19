import tkinter
import customtkinter
from es import ExpertSystem

questions_history = []
selected_answer = None
finished = False
system = None


def setup_ui(root):
    global question_label, answers_frame, confirm_button, retract_button, selected_answer

    root.minsize(600, 400)
    root.grid_rowconfigure(0, weight=1)
    root.grid_columnconfigure(1, weight=1)
    root.title("How to Choose A Bottle of Wine")
    root.iconbitmap("wine.ico")

    setup_banner(root)

    selected_answer = tkinter.IntVar()

    question_label = customtkinter.CTkLabel(root, font=("Arial", 18), fg_color="green", corner_radius=10)
    question_label.grid(row=1, column=0, columnspan=3, padx=20, pady=20, sticky="ew")

    answers_frame = customtkinter.CTkFrame(root)
    answers_frame.grid(row=2, column=0, columnspan=3, padx=20, pady=20, sticky="ew")

    confirm_button = customtkinter.CTkButton(root, text="Next", fg_color="green", command=on_confirm, state="disabled")
    confirm_button.grid(row=3, column=2, padx=20, pady=20, sticky="ew")

    retract_button = customtkinter.CTkButton(root, text="Back", fg_color="green", command=on_retract, state="disabled")
    retract_button.grid(row=3, column=0, padx=20, pady=20, sticky="ew")


def setup_banner(root):
    banner = customtkinter.CTkFrame(root, fg_color="green", height=100)
    banner.grid(row=0, column=0, columnspan=3, padx=20, pady=20, sticky="ew")
    label = customtkinter.CTkLabel(banner, text="How to Choose a Bottle of Wine", font=("Arial", 30), text_color="white")
    label.pack(padx=20, pady=20)


def load_clips():
    global finished
    system.run()

    for fact in system.get_facts():
        if fact.template.name == "question":
            display_question(fact[0], fact[1:])
            break
        elif fact.template.name == "result":
            display_result(fact[0])

    retract_button.configure(state="normal" if questions_history else "disabled")


def display_question(question, answers):
    global finished
    finished = False
    question_label.configure(text=question)

    for widget in answers_frame.winfo_children():
        widget.destroy()

    selected_answer.set(-1)
    for idx, answer in enumerate(answers):
        rb = customtkinter.CTkRadioButton(
            answers_frame, text=answer, value=idx,
            variable=selected_answer, command=enable_confirm
        )
        rb.grid(row=idx, column=0, pady=(0, 10), padx=10, sticky="w")

    confirm_button.configure(state="disabled")


def display_result(result):
    global finished
    finished = True
    question_label.configure(text=f'The perfect wine for you is "{result}"')

    for widget in answers_frame.winfo_children():
        widget.destroy()

    confirm_button.configure(text="Exit", command=root.quit)


def enable_confirm():
    confirm_button.configure(text="Next", state="normal")


def on_confirm():
    global finished

    if finished:
        root.quit()
    else:
        selected_idx = selected_answer.get()
        answers_list = [answers_frame.winfo_children()[i].cget("text") for i in range(len(answers_frame.winfo_children()))]
        answers = ' '.join([f'"{x}"' for x in answers_list])
        questions_history.append(f'"{question_label.cget("text")}" {answers}')
        system.user_answer(answers_frame.winfo_children()[selected_idx].cget("text"))
        load_clips()


def on_retract():
    global finished

    if finished:
        finished = False
        enable_confirm()

    if questions_history:
        system.retract_last_question(questions_history[-1])
        questions_history.pop()
        load_clips()

root = customtkinter.CTk()
system = ExpertSystem('winebottle.clp')

setup_ui(root)
load_clips()

root.mainloop()
