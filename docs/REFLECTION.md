Reflection
Student: SHEMA Mfizi Cedrick | ID: 29740
Course: INSY 8311 - Database Development with PL/SQL
Assignment: Individual Assignment III - PL/SQL GOTO Statements and Functions
1. Why is GOTO discouraged, and what did I use instead in A4?
GOTO is discouraged because it makes code confusing and difficult to maintain.
Jumping from one place to another makes the program flow hard to follow, and
PL/SQL even restricts where a GOTO may jump (A3 showed an illegal GOTO and how
to fix it). In A4, I used IF...ELSE statements instead because they provide a
clear and structured way to control the program flow.
2. What was the hardest part, and how did I fix it?
The hardest part was getting the function to compile because of errors in the
PL/SQL code. I fixed it by checking the syntax carefully, correcting the errors,
and compiling it again until it worked successfully.
3. What is the benefit of calling functions inside a SELECT?
Calling functions inside a SELECT allows us to calculate and display useful
information for many employees in one query. In B5, one SELECT statement showed
the annual salary, years of service, tax, and department name for each
employee, making the work faster and easier.
What I learned
GOTO can be replaced by structured control flow such as IF...ELSE.
Stored functions make logic reusable: B1 to B4 are reused in B5 and in the
C1 payroll validator.
Exception handling (for example NO_DATA_FOUND) lets a function return a
clear message instead of failing.
