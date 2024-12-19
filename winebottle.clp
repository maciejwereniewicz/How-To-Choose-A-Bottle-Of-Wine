(defrule run
   (and (not (exists
                  (result ? $?)))
        (not (exists
                  (question ? $?)))
        (not (exists
                  (answer ?))))
   =>
   (assert (question "Who's drinking it?" "Someone else" "Personal use"))
)

(defrule personal-use
   ?currentAnswer <- (answer "Personal use")
   ?currentQuestion <- (question "Who's drinking it?" "Someone else" "Personal use")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are you at home?" "Yes" "No"))
)

(defrule yes-at-home
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Are you at home?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Alone" "Yes" "No"))
)

(defrule no-at-home
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are you at home?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions"))
)

(defrule yes-alone
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Alone" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Recovering from work?" "Yes" "No"))
)

(defrule no-alone
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Alone" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Dinner" "Yes"))
)

(defrule yes-recovering
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Recovering from work?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Pinot Noir"))
)

(defrule no-recovering
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Recovering from work?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Getting drunk?" "Yes" "No"))
)

(defrule yes-getting-drunk
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Getting drunk?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Zinfandel or Shiraz"))
)

(defrule no-getting-drunk
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Getting drunk?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Feeling fancy?" "Oui." "No"))
)

(defrule oui-fancy-feeling
   ?currentAnswer <- (answer "Oui.")
   ?currentQuestion <- (question "Feeling fancy?" "Oui." "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Sangiovese or Grenache"))
)

(defrule no-fancy-feeling
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Feeling fancy?" "Oui." "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Daily drinking wine" "Yes" "No"))
)

(defrule yes-daily
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Daily drinking wine" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Kool-aid man?" "Yes" "No"))
)

(defrule no-daily
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Daily drinking wine" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "New vs. old world" "What?" "Old!" "New"))
)

(defrule yes-kool
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Kool-aid man?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Argentinian Malbec"))
)

(defrule no-kool
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Kool-aid man?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Eat dirt as a child?" "Yum" "No"))
)

(defrule yum-dirt
   ?currentAnswer <- (answer "Yum")
   ?currentQuestion <- (question "Eat dirt as a child?" "Yum" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Chinon or Bourgueil"))
)

(defrule no-dirt
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Eat dirt as a child?" "Yum" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Spray butter in your mouth" "Yep" "No!"))
)

(defrule yep-butter
   ?currentAnswer <- (answer "Yep")
   ?currentQuestion <- (question "Spray butter in your mouth" "Yep" "No!")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Buttery Chardonnay"))
)

(defrule no-butter
   ?currentAnswer <- (answer "No!")
   ?currentQuestion <- (question "Spray butter in your mouth" "Yep" "No!")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Thx for playin' now get out of my flowchart"))
)

(defrule what-world
   ?currentAnswer <- (answer "What?")
   ?currentQuestion <- (question "New vs. old world" "What?" "Old!" "New")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Thx for playin' now get out of my flowchart"))
)

(defrule old-world
   ?currentAnswer <- (answer "Old!")
   ?currentQuestion <- (question "New vs. old world" "What?" "Old!" "New")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Bordeaux or Burgundy"))
)

(defrule new-world
   ?currentAnswer <- (answer "New")
   ?currentQuestion <- (question "New vs. old world" "What?" "Old!" "New")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are you into cults?" "Yes" "No"))
)

(defrule yes-cults
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Are you into cults?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Sine Qua Non or Cayuse"))
)

(defrule no-cults
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are you into cults?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Calififornia Cabernet"))
)

(defrule yes-dinner
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Dinner" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Is wine the main course?" "Yes" "No"))
)

(defrule yes-main
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Is wine the main course?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Sangiovese or Grenache"))
)

(defrule no-main
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Is wine the main course?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Dinner from a microwave?" "Yes" "No"))
)

(defrule yes-microwave
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Dinner from a microwave?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "3 Liter box wine"))
)

(defrule no-microwave
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Dinner from a microwave?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Cooking w/ your wine?" "Yes" "No"))
)

(defrule yes-cooking
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Cooking w/ your wine?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Sauvignon Blanc"))
)

(defrule no-cooking
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Cooking w/ your wine?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Kool-aid man?" "Yes" "No"))
)

(defrule on-the-go-dinner
   ?currentAnswer <- (answer "Dinner")
   ?currentQuestion <- (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Dinner" "Yes"))
)

(defrule on-the-go-restaurant
   ?currentAnswer <- (answer "Restaurant")
   ?currentQuestion <- (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Fancy?" "Yes" "No"))
)

(defrule yes-fancy
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Fancy?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Can you pronounce the menu?" "Yes" "No"))
)

(defrule no-fancy
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Fancy?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Order from a window?" "Yes...?" "No"))
)

(defrule yes-from-window
   ?currentAnswer <- (answer "Yes...?")
   ?currentQuestion <- (question "Order from a window?" "Yes...?" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "3 Liter box wine"))
)

(defrule no-from-window
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Order from a window?" "Yes...?" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Calififornia Cabernet"))
)

(defrule yes-can-pronounce
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Can you pronounce the menu?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "New vs. old world" "What?" "Old!" "New"))
)

(defrule no-can-pronounce
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Can you pronounce the menu?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Cotes du rhone"))
)

(defrule on-the-go-camping
   ?currentAnswer <- (answer "Camping")
   ?currentQuestion <- (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Single serve box wine"))
)

(defrule on-the-go-public
   ?currentAnswer <- (answer "Drinking in public")
   ?currentQuestion <- (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Single serve box wine"))
)

(defrule on-the-go-special
   ?currentAnswer <- (answer "Special occasions")
   ?currentQuestion <- (question "On the go" "Dinner" "Restaurant" "Camping" "Drinking in public" "Special occasions")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years"))
)

(defrule anniversary
   ?currentAnswer <- (answer "Anniversary")
   ?currentQuestion <- (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "1st or 2+?" "1st" "2+"))
)

(defrule 1st-anniversary
   ?currentAnswer <- (answer "1st")
   ?currentQuestion <- (question "1st or 2+?" "1st" "2+")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "California pinot noir"))
)

(defrule 2+-anniversary
   ?currentAnswer <- (answer "2+")
   ?currentQuestion <- (question "1st or 2+?" "1st" "2+")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Merlot"))
)

(defrule eloping
   ?currentAnswer <- (answer "Eloping")
   ?currentQuestion <- (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Riesling or chenin blanc"))
)

(defrule birthday
   ?currentAnswer <- (answer "Birthday")
   ?currentQuestion <- (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Old?" "Yes" "No"))
)

(defrule old-birthday
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Old?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "California pinot noir"))
)

(defrule young-birthday
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Old?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Riesling or chenin blanc"))
)

(defrule blind-date
   ?currentAnswer <- (answer "Blind date")
   ?currentQuestion <- (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Riesling or chenin blanc"))
)

(defrule new-years
   ?currentAnswer <- (answer "New Years")
   ?currentQuestion <- (question "Pick occasion" "Anniversary" "Eloping" "Birthday" "Blind date" "New Years")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Alone?" "Yes" "No"))
)

(defrule alone-new-years
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Alone?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Sangiovese or Grenache"))
)

(defrule no-alone-new-years
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Alone?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Spanish cava"))
)

(defrule someone-else
   ?currentAnswer <- (answer "Someone else")
   ?currentQuestion <- (question "Who's drinking it?" "Someone else" "Personal use")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are you at a social gathering?" "Yes" "No"))
)


(defrule yes-gathering
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Are you at a social gathering?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq"))
)

(defrule no-gathering
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are you at a social gathering?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Gift?" "Yes"))
)

(defrule gift
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Gift?" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are they a wine lover?" "Yes" "No"))
)

(defrule wine-lover
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Are they a wine lover?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Do you really know them?" "Yes" "No"))
)

(defrule not-wine-lover
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are they a wine lover?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "They don't deserve wine"))
)

(defrule know-them
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Do you really know them?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are they your favorite people in the world?" "Be honest." "No"))
)

(defrule not-know-them
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Do you really know them?" "Yes" "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "They don't deserve wine"))
)

(defrule be-honest
   ?currentAnswer <- (answer "Be honest.")
   ?currentQuestion <- (question "Are they your favorite people in the world?" "Be honest." "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Be honest" "Yes"))
)

(defrule no-favorite
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are they your favorite people in the world?" "Be honest." "No")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "They don't deserve wine"))
)

(defrule be-honest-yes
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Be honest" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "California pinot noir"))
)

(defrule get-together
   ?currentAnswer <- (answer "Get together")
   ?currentQuestion <- (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Do you know them" "No" "Yes"))
)

(defrule get-together-no-know
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Do you know them" "No" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Bring a boring bottle and hope no one opens it"))
)

(defrule get-together-know
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Do you know them" "No" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are they wine lovers" "No" "Yes"))
)

(defrule get-together-wine-lover
   ?currentAnswer <- (answer "Yes")
   ?currentQuestion <- (question "Are they wine lovers" "No" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Are they your favorite people in the world?" "Be honest." "No"))
)

(defrule get-together-no-wine-lover
   ?currentAnswer <- (answer "No")
   ?currentQuestion <- (question "Are they wine lovers" "No" "Yes")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "They don't deserve wine"))
)

(defrule bachelor-party
   ?currentAnswer <- (answer "Bachelor party")
   ?currentQuestion <- (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Bring whisky or vodka"))
)

(defrule dinner-party
   ?currentAnswer <- (answer "Dinner Party")
   ?currentQuestion <- (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (question "Who is cooking?" "Me" "Them"))
)

(defrule me-cooking
   ?currentAnswer <- (answer "Me")
   ?currentQuestion <- (question "Who is cooking?" "Me" "Them")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "They don't deserve wine"))
)

(defrule them-cooking
   ?currentAnswer <- (answer "Them")
   ?currentQuestion <- (question "Who is cooking?" "Me" "Them")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Buy the biggest bottle with the words -Red Blend-"))
)

(defrule beach-bbq
   ?currentAnswer <- (answer "Beach bbq")
   ?currentQuestion <- (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "Bought a nice bottle but it was confiscated. No glass on the beach"))
)

(defrule art-opening
   ?currentAnswer <- (answer "Art opening")
   ?currentQuestion <- (question "Pick one" "Bachelor party" "Dinner Party" "Art opening" "Get together" "Beach bbq")
   =>
   (retract ?currentAnswer)
   (retract ?currentQuestion)
   (assert (result "2-buck chuck"))
)