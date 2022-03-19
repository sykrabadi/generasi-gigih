# Lesson plan

## Classroom Structure

We will structure our classroom as follows:
- 17.00 - 17.10: Opening
- 17.10 - 18.10: Homework Showcase
- 18.10 - 18.30: Break
- 18.30 - 19.30: Discussion
- 19.30 - 20.00: Closing

## Homework Showcase

In this iteration of Generasi Gigih, we are experimenting with a method called "flipped learning". In this method, we emphasize learning based on the experience of our participants. Therefore, we explicitly tell them that all of our modules and their corresponding homework should be conducted by participants before the classroom session is started.

During our classroom session, the very first thing we do is a homework showcase. As classroom instructors, we should try our best to get as many people as possible to showcase their homework. As a heuristic, for each participant, allocate around 5-6 minutes for one showcase so that we cover 10-12 people in a one hour showcase session.

Things particpants should do during the showcase:
- Run their solution
- Quick walkthrough of the code
- Ask questions, if any

Things class instructors should do during the showcase:
- Ask decisions around the solution
- Answer questions, if any

## Discussion

After homework showcase, we continue with an hour discussion session. In this session, we encourage participants to ask questions based on their own progress with the homework. We only re-read the module materials if we deem necessary. Otherwise, we should proceed with the discussion.

If participants don't appear to be much invovled in the discussion, as instructors, we can ask some questions to ignite a discussion.

The following is some questions that might help to gauge participants' understanding of this module:
- What is composition in OOP?
- What is the difference between inheritance and polymorphism?
- In what situatitions do we prefer to use inheritance over polymorphism?
- In what situatitions do we prefer to use polymorphism over inheritance?
- What is the difference between static and dynamic type language?
- What is duck typing?

### Why don't we create a `Card` class as a superclass for both `Monster` and `Spell` classes?

In a statically typed language, we might need to create an 'interface' class that we can pass around as cards to objects from `Player` class. However, since Ruby is a dynamically typed language, this is not necessary as we can just pass around any objects, as long as they respond to `attack` method.

In fact, this is why we implement this in polymorphism, because a `Spell` card is not a specialized kind of `Monster` card. It has its different sets of states and behaviors. But, we can pass it along as a card to `player1` and `player2` objects as long as it has `attack` method.

## Closing

For closing, recall all the materials that we have learned together this week:
- Abstraction and encapsulation
- Inheritance
- Polymorphism

We can briefly re-explain the materials above, but more importantly ask if they still have any confusion in any of these materials. Let's try our best to clear any doubts and confusions in the closing section.
