
/*
Problem #1_1
int x = 75;
if (x > 50) { 
  println(x + " is greater than 50!"); 
} else if (x > 25) {
  println(x + " is greater than 25!");
} else { println(x + " is 25 or less!");
}

Output: "75 is greater than 50!"


Problem #1_2
int x = 75;
if(x > 25) { 
  println(x + " is greater than 25!");
  } else if (x > 50) {
  println(x + " is greater than 50!");
} else {
  println(x + " is 25 or less!");
}

Output: "75 is greater than 25!"

Anything larger than 50 is also large than 25. The output
could be either, "75 is greater than 25!" or "75 is greater than 50!"
but Processing will only ever execute println "75 is greater than 25!"
because of the order of the conditional statement.
*/

