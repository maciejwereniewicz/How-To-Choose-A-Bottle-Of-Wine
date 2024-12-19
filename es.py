import clips

class ExpertSystem:
    def __init__(self, file):
        self.env = clips.Environment()
        self.env.load(file)

    def run(self):
        self.env.run()

    def get_facts(self):
        return self.env.facts()

    def string_assertion(self, string):
        self.env.assert_string(string)
    def user_answer(self, answer):
        self.string_assertion(f'(answer "{answer}")')

    def retract_last_question(self, question):
        self.string_assertion(f'(question {question})')
        for fact in self.get_facts():
            fact.retract()
        
