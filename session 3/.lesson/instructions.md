# Polymorphism and Composition

## Polymorphism

**Poly** means many, **morph** means form. In OOP, polymorphism is the provision of a single interface to entities of different types.

### Statically Typed vs Dynamically Typed Languages

In any programming language, there is a concept called "type". Consider the following snippet:

```ruby
hello = "hello, world!"
puts hello
```

The variable `hello` in the snippet above is of string type. Most programming languages have basic data types such as string, integer, or float. With these basic data types, we can create more complex ones called abstract data types. Data structure such as stack, queue, or list are example of abstract data types. In object-oriented programming, when we create a class, our class can also be categorized as an abstract data type.

When it comes to managing data types, programming languages can be categorized into two kinds, statically typed languages and dynamically typed languages. In a statically typed language, for instance Java, once we define a variable is of a certain data type, we can't change it to a different data type. In a dynamically typed, we can change a data type of a variable. To better understand this, compare the following snippets:

In a statically typed language such as Java, the following code will not even compile as we can't change the type of `hello` variable:

```java
class Main {
  public static void main(String[] args) {
    String hello = "hello, world!";
    System.out.println(hello);

    hello = 1234;
    System.out.println(hello);
  }
}
```

In a dynamically typed language such as Ruby, the following code works just fine:

```ruby
hello = "hello, world!"
puts hello

hello = 1234
puts hello
```

### Polymorphism in Its "Purest" Form

Now, suppose we have a class that is responsible to export reports. What if at any given time, we can either export a report in pdf or xls format? This is where polymorphism comes in. Let's take a look at the following snippet (of course, to simplify the code sample, we remove irrelevant states and behaviors, and focus only on the relevant ones):

```ruby
class GenericExporter
  def export
    raise NotImplementedError, 'You must implement the export method'
  end
end

class PdfExporter < GenericExporter
  def export
    puts 'Export to .pdf format'
  end
end

class XlsExporter < GenericExporter
  def export
    puts 'Export to .xls format'
  end
end

class Report
  def initialize(exporter)
    @exporter = exporter
  end

  def generate_monthly_report
    puts "Generating monthly report"
    @exporter.export
  end
end

puts "Give me PDF report!"
pdf_report = Report.new(PdfExporter.new)
pdf_report.generate_monthly_report

puts "Give me XLS report!"
xls_report = Report.new(XlsExporter.new)
xls_report.generate_monthly_report
```

In a statically typed language, the only way to allow such implementation is by using polymorphism. In the sample above, we created a generic exporter class (aptly named `GenericExporter`) and two classes (`PdfExporter` and `XlsExporter`) that implement the generic class. This way, Report class can rely on a generic exporter that can be subtituted by either PdfExporter or XlsExporter when it is instantiated. In its "purest" form, the generic class that is implemented by other classes should not be able to be instantiated.

Please note that a strict implementation like this is not actually necessary in Ruby. Also please note that the implementation above is specific to Ruby. In languages such as Java, to implement polymorphism, we use an interface class that is implemented (instead of inherited like Ruby) by other classes.

### Polymorphism on Basic Data Types in Ruby

Before we learn polymorphism with abstract data types, let's see how polymorphism with basic data types works in dynamically typed languages like Ruby. Take a look at the following snippet:

```ruby
class Calculator
  def add(number1, number2)
    number1 + number2
  end
end

calculator = Calculator.new
integer = calculator.add(1, 2) # passing integer as parameter
puts integer

double =  calculator.add(1.23, 5.44) # passing double as parameter
puts double

string =  calculator.add("1.23", "5.44") # passing string as parameter
puts string
```

As you can see from the snippet above, we can pass any data types to `add` method as long as they respond to `+` method. Of course, you will notice that adding string `"1.23"` and `"5.44"` will return a funny result (`"1.235.44"`) because for string data type, `+` is a concatenation operation instead of an addition operation.

### Polymorphism with Duck Typing in Ruby

Now that you have understood how polymorphism on basic data types work in Ruby, let's continue with abstract data types. Take a look at the following code snippet:

```ruby
class PdfExporter
  def export
    puts 'Export to .pdf format'
  end
end

class XlsExporter
  def export
    puts 'Export to .xls format'
  end
end

class Report
  def initialize(exporter)
    @exporter = exporter
  end

  def generate_monthly_report
    puts "Generating monthly report"
    @exporter.export
  end
end

puts "Give me PDF report!"
pdf_report = Report.new(PdfExporter.new)
pdf_report.generate_monthly_report

puts "Give me XLS report!"
xls_report = Report.new(XlsExporter.new)
xls_report.generate_monthly_report
```

Because Ruby is a dynamically typed language, we don't necessarily have to implement polymorphism in its "purest" form. Instead we can utilize a feature of dynamically typed language called "duck typing". The saying goes, "if it quacks like a duck, it is a duck". It means, if an object respond to certain methods, we can assume that it is the object that we want. In the example above, all we want for the object that we pass to `Report#new(exporter)` method is that it responds to `.export` method. Therefore, any object that responds to `.export` method can be assumed as an exporter object. Coming back to our duck typing saying, "ff it responds to `.export` method like an exporter, it is an exporter".

## Composition

In object oriented programming, there are two ways to build classes from other classes. We have learned the first one, inheritance, in the previous module. Earlier in this module, we have just learned the second one: composition. With composition, we build classes by embedding classes in other classes.

In our polymorphism examples, we build Report class by embedding any instance of Exporter class into it. Now, what if we want to make a default exporter to our Report class?

### Composition with Dependency Injection

To make a default exporter embedded to our Report class, we can inject a default class to it.
In the code sample below, we make PdfExporter as the default exporter for our Report class.
When instantiated with no additional parameter, objects of Report class will always default to PdfExporter.

```ruby
class PdfExporter
  def export
    puts 'Export to .pdf format'
  end
end

class XlsExporter
  def export
    puts 'Export to .xls format'
  end
end

class Report
  def initialize(exporter=PdfExporter)
    @exporter = exporter.new
  end

  def generate_monthly_report
    puts "Generating monthly report"
    @exporter.export
  end
end

pdf_report = Report.new
pdf_report.generate_monthly_report
xls_report = Report.new(XlsExporter)
xls_report.generate_monthly_report
```

Dependency injection is a programming technique that makes a class independent of its dependencies. It achieves that by decoupling the usage of an object from its creation. In its “pure form”, we inject Report report not with PdfExporter, but with an abstract class like GenericExporter (not implemented in our snippet) for instance. However, as we mentioned before, in a dynamic type language like Ruby, we don’t have to create an abstract class as we can rely on duck typing instead.

## Summary

In inheritance, a class that inherits from another class will always inherit all of its states and behaviors. This makes inheritance suitable when we want to build a specific class from a more generic one. In composition, a class that composes one or more classes can pick what behaviors it wants to implement and what behaviors it wants to delegate to the classes embedded in it.

In inheritance, relationship is often described as an “is-a” relationship. If class A inherits from class B, we can say that class A is a kind of class B. For example, a labrador is a kind of a dog. In composition, relationship is often described as a “has-a” relationship. If class A embeds class B, we can say that class A has a class B. For example, a desktop has a keyboard.

## Homework

To complete this module, let's revisit our Consolémon game again. So far, we have only known one type of a card: a monster card. There are actually other types of card, but for now we will only work with one more type, a spell card.

A spell card consists of name and elemental type. A spell card can only be applied to monsters that have matching state. For instance, a spell card with `fire` elemental type can only be applied to a monster in a `burnt` state. If applied to an enemy's monster with the correct elemental state, spell cards will prolong the effect of an elemental attack by one turn.

By now you should already have `Monster`, `Player`, `IceMonster`, and `FireMonster` classes. Create one more class to model spell cards and modify your Player card to accommodate having different kind of cards (monster cards and spell cards). Then, complete the following skeleton for your `main.rb`.

*Hint: you might want to look up `respond_to?` in Ruby documentation to help you in this homework.*

```ruby
require_relative 'fire_monster'
require_relative 'ice_monster'
# require_relative 'your_class_name'

phpkachu = Monster.new('Phpkachu', 120, 50)
sqlrtle = IceMonster.new('Sqlrtle', 180, 20)
cppmander = FireMonster.new('Cppmander', 100, 80)
bashtoise = IceMonster.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

# flamethrower = YourClassName.new('Flamethrower', 'fire')

player1 = Player.new('Player 1')
# player1.your_method_name(sqlrtle)
# player1.your_method_name(cppmander)
# player1.your_method_name(flamethrower)

player2 = Player.new('Player 2')
# player2.your_method_name(phpkachu)
# player2.your_method_name(cppmander)
# player2.your_method_name(bashtoise)

puts '=======================Turn 1======================='
puts ''

puts player1
puts ''

puts player2
puts ''

player1.play_turn(2, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

player2.play_turn(2, 1, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 2======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

player1.play_turn(3, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

# We skip Player 2's turn to demonstrate that 
# because Player 1 attacks Player 2's Bashtoise with flamethrower in this turn,
# Player 2's Bashtoise burnt status will continue to turn 4
# While Player 1's Sqlrtle burnt status will stop in turn 3

puts '=======================Turn 3======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 4======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 5======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''
```
