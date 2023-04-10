# critical-systems--CW2

- Grade : 68%

# Question 1
The goal of this question is to develop a small example of a safety critical system.
Choose a simplified example of a critical system (e.g. a simple control of a rocket or of a nuclear
power station, the control of an extremely simple railway system, very simple control of air traffic).
You are not expected to understand the technical details of such system apart from what is common
sense, and you can make some reasonable assumptions about its behaviour. For instance, when
controlling a rocket, you might demand that the temperature and pressure inside must be between
certain values (which you can choose using common sense), that the propulsion is sufficiently strong,
etc.

The interface should be simple console input/output. For instance the program might ask for
the current temperature, pressure, and then determine an action (like opening of some valve, self-
destruction of the rocket etc.). Your program should consist of one loop in which the user is asked
for suitable parameters and the results calculated by the system are presented.
The emphasis in this project is not on writing a complicated program with an interesting user
interface (restrict yourself to console input and output and a rather simple behaviour, but in
demonstrate that you understand how to verify such a program using SPARK Ada.
However some marks are reserved in the last subquestion for really clever solutions. Such solutions
need not be long, but have some more interesting aspects to it.

1.  Specify your program taking into account that it is a safety critical system. About 1 - 2
pages are sufficient. [14 marks]

2.  Carry out a hazard analysis of your system using one of the techniques taught in the lecture
[16 marks]

3.  Write your program so that it compiles with the compiler supplied as part of the SPARK
Ada package. In your printouts include examples of runs of your system, which demonstrates
the main features specified in your system. [4 marks]

4.  Add depends clauses so that your program passes SPARK Ada’s data and information flow
analysis. [6 marks]

5.  Add suitable pre- and post-conditions and verify using SPARK Ada that your program is
correct w.r.t. these conditions (you might not need any pre-condition). [20 marks]

6.  The marks in this subquestion are reserved for really good and deep solutions which go
beyond. Such solutions need not be very long, but they should have some interesting aspects
in it.
[30 marks]
