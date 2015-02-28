
// smarter way, a for loop

// FOR LOOP
// for is just the syntax/key word
// for(statmenet1; statement2; statement3)
// statement1, is called the definition.  here we define a variable int i
//    and set it to 0
// statement2, is called the comparison.  it's like an if statement, and it lets
//    the loop know when to stop. the for loop will loop as long as this statement
//    is true
// statement3 is called the incriment.  This allows the loop to move forward or
//    progress

// i = i + 1;
// i++;           these are the same

// i = i + 1;     the computer first figures out the right hand side
//                and then assigns it to the left hand side.  Side is defined
//                by the = equal sign.

/*
int x = 1;
 x = x * 52;    = 52
 
 int x = 3;      
 x = x - 3;    = 0
 */


float distBetweenCircles; 
int numBalls;
int ballWidth;
int ballRadius;


void setup() {
  size(900, 400);
  smooth();
  numBalls = 5;
  distBetweenCircles = width/(numBalls+1);
  ballWidth = 80;
  ballRadius = ballWidth/2;

//  println(distBetweenCircles);
}

void draw() {
  for (int i=2; i<=100; i = i + 2) {
    // println(i);
  }

  for (int i=5; i<=100; i = i + 5) {
    //  println(i);
  }


  for (int i= 0; i < 5; i++) {

    ellipse((i+1)*distBetweenCircles, height-ballRadius, ballWidth, ballWidth);
  }
}


