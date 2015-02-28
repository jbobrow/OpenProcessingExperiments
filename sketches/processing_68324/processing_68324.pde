
/*
Five Levels of Inception - an example of recursion for fun.
 
 Level 0 - Reality
 Level 1 - Van Chase
 Level 2 - The Hotel
 Level 3 - Snow Fortress
 Level 4 - Limbo
 
 */
String[] dreamLevel = {"Reality", "Van Chase", "The Hotel", "Snow Fortress", "Limbo"};

void setup() {
  inception(4);
}

void inception(int n) {
  int level = 4 - constrain(n, 0, 4);

  println("You are in Level " + level + ": " + dreamLevel[level]);

  if (level < 4) {
    inception(n - 1);
    println("You are back to " + dreamLevel[level]);
  }
}


