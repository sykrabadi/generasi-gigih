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
1. What is inheritance in OOP?
2. 

The following is some questions that might help participants to even deeper understand this module: 

### Why did we not make `elemental_attack` a separate class?

That's because at this point we can't really see any behaviors that we can tie to an `ElementalAttack` class. Therefore, at least for the time being, it makes more sense to make it as a slightly complex state of `FireMonster` or `IceMonster` class. This is a callback to what we have learned in "Abstraction and Encapsulation" module.

### Why did we not just make conditionals in `Monster#attack` method?

Actually we can make something like the following:

```ruby
class Monster
   def initialize(name, hitpoint, attack_point, elemental_type)
    # other lines of code removed for simplicity
    @elemental_type = elemental_type
    @elemental_attack = set_elemental_attack
  end

  def set_elemental_attack
    if @elemental_type == 'fire'
      return {
        initial_damage: 0,
        effect: 'burnt',
        turn: 3,
        over_time_damage: 0.4 * @attack_point
      }
    elsif @elemental_type == 'ice'
      return {
        initial_damage: 0.8 * @attack_point,
        effect: 'frozen',
        turn: 1,
        over_time_damage: 0
      }
    end
  end

  def attack(monster)
    if @elemental_type == 'fire' || @elemental_type == 'ice'
      monster.take_spell(@elemental_attack)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{@elemental_attack[:initial_damage]} damage, takes #{0.5 * monster.attack_point} damage, inflict #{@elemental_attack[:effect]} status for #{@elemental_attack[:turn]} turns with #{@elemental_attack[:over_time_damage]} damage each turn"
    else
      monster.take_damage(@attack_point)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
    end
  end
end
```

But, as we can see from the sample code above, the more types of elemental monster we add, the more complicated our `set_elemental_attack` will become. Rather than exhaustively list all the possible elemental attack there, we can use OOP inheritance feature to make specific classes (like `FireMonster` and `IceMonster`) out of a generic one (like `Monster`).

### In real world problem statements, how do we know when to create a new class?

One heuristic that we can use is "the rule of three". For instance, take a look at the following snippet, slightly modified from the previous code sample:

```ruby
def set_elemental_attack
  if @elemental_type == 'fire'
    return {
      initial_damage: 0,
      effect: 'burnt',
      turn: 3,
      over_time_damage: 0.4 * @attack_point
    }
  elsif @elemental_type == 'ice'
    return {
      initial_damage: 0.8 * @attack_point,
      effect: 'frozen',
      turn: 1,
      over_time_damage: 0
    }
  elsif @elemental_type == 'lightning'
    return {
      initial_damage: 0,
      effect: 'stunned',
      turn: 2,
      over_time_damage: 0.4 * @attack_point 
    }
  end
end
```

While in our homework we immediately create `FireMonster` and `IceMonster` classes, in real world problem statements, we actually can wait until the code constructs to differentiate between different types of elemental monster reach a critical mass. The first time we see a the need to make a new code construct (in this case a new class for specific elemental type monster), we should not immediately jump to implement that code construct. The second time, we flag it. The third time, we refactor our code to make the required code construct. This heuristic can greatly help us in preventing over-engineering our solution.
