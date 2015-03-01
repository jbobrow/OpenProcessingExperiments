
/*

1) First thing you do when you start a program is set up your "development environment"
Our "development environment" is our void setup() and void draw() functions.

These two functions are used to initialize, and run our program.

We take our time to make sure everything is set up because if we don't have our environment
set up, we don't have anywhere to start from, and build off of.
-------------------------------------------------------------------------------------------------

void setup(){

}

void draw(){

}

-------------------------------------------------------------------------------------------------
2) The next thing you must do is ask yourself "What the hell am I doing here?".
Usually we can answer this question by reading over our Project Handouts.

3) So now let me lay out a basic project that we will have to complete.
-Make 2 balls
-Have them moving around on the screen at random directions.
-Have them bounce off the walls
-Program this with OOP in mind. ( ie. use a Class )
-------------------------------------------------------------------------------------------------
4a) So now I will take you thought the thought processes that it takes to do what is called
"Classing out an Object"
So we want to create this ball, what are a few things about the ball that will help us
Accomplish out task?

Well we have to move it around, so it needs to have a position.
So we can expect a X position variable, Y position variable inside of our class.
-------------------------------------------------------------------------------------------------

float xpos;
float ypos;

-------------------------------------------------------------------------------------------------
And it needs to move around at a random direction.
So we can expect aa X direction variable, and a Y direction variable inside of our class.
-------------------------------------------------------------------------------------------------

float xdir;
float ydir;

-------------------------------------------------------------------------------------------------
5)Now that we have all of the variable, lets put them inside of our class.
-------------------------------------------------------------------------------------------------

class Ball{
  float xpos;
  float ypos;
  float xdir;
  float ydir;
}

-------------------------------------------------------------------------------------------------
6)So now, the constructor... What we do with the constructor, is give our classes variables some 
meat. We need to give our variables some numbers, because to do things to our object, we need to use
math, and to do math, we need numbers. Inside of the parentheses, we create temporary
placeholders to hold values our "user" will input into the "instantiation statement" as seen in
step #7. These temp values get set to our actual values that we will be playing with inside of
our methods.

*Remember that our constructor has the same name as our class.*
-------------------------------------------------------------------------------------------------

class Ball{
  float xpos;
  float ypos;
  float xdir;
  float ydir;
  Ball(float tempXpos, float tempYpos, float tempXdir, float tempYdir){
    xpos = tempXpos;
    ypos = tempYpos;
    xdir = tempXdir;
    ydir = tempYdir;
  }
}

-------------------------------------------------------------------------------------------------
7)Let's look at how our "user" inputs values into our "instantiation statement" and we will also
add some basic init stuff. ( pro tip: init stands for initialize )
-------------------------------------------------------------------------------------------------

void setup(){
  size(500, 500);
  Ball b1 = new Ball(width/2, height/2, random(-8, 8), random(-8, 8));
}

-------------------------------------------------------------------------------------------------
8)Now we are going to start making our method functions. We write our methods right below our 
constructor We first need a method that will draw our ball. We will call this method, drawBall().
_________________________________________________________________________________________________

class Ball{
  float xpos;
  float ypos;
  float xdir;
  float ydir;
  Ball(float tempXpos, float tempYpos, float tempXdir, float tempYdir){
    xpos = tempXpos;
    ypos = tempYpos;
    xdir = tempXdir;
    ydir = tempYdir;
  }
  void drawBall(){
    fill(0);
    ellipse(xpos, ypos, 30, 30);
  }
}

_________________________________________________________________________________________________
9)To utilize our method, we use the dot operator to append that method to the object in our 
draw function.
_________________________________________________________________________________________________

void draw(){
  background(255);
  b1.drawBall();
}

_________________________________________________________________________________________________
10)I am going to create a bunch of new methods that should look very familiar, I'll explain all
within comments inside the actual code.
_________________________________________________________________________________________________

  void drawBall(){
    fill(0);
    ellipse(xpos, ypos, 30, 30);
  }
  
  void moveBall(){
    xpos = xpos + xdir;
    ypos = ypos + ydir;
  }
  
  void bounceBall(){
    if(xpos < 15 || xpos > width-15){
          xdir = xdir * -1;
    }
    if(ypos < 15 || ypos > height-15){
          ydir = ydir * -1;
    }
  }
  
_________________________________________________________________________________________________
11)Remember to use the new methods on the object you wish to effect inside our draw function.
_________________________________________________________________________________________________

  b1.drawBall();
  b1.moveBall();
  b1.bounceBall();
  
_________________________________________________________________________________________________
12)To make two of the balls, we just need to double up on calling the class into the program.

*/
Ball b1;
Ball b2;
void setup(){
  size(500, 500);
  b1 = new Ball(width/2, height/2, random(-8, 8), random(-8, 8));
  b2 = new Ball(width/2, height/2, random(-8, 8), random(-8, 8));
  noStroke();
}

void draw(){
  background(255);
  b1.drawBall();
  b1.moveBall();
  b1.bounceBall();
  
  b2.drawBall();
  b2.moveBall();
  b2.bounceBall();
}

class Ball{
  float xpos;
  float ypos;
  float xdir;
  float ydir;
  Ball(float tempXpos, float tempYpos, float tempXdir, float tempYdir){
    xpos = tempXpos;
    ypos = tempYpos;
    xdir = tempXdir;
    ydir = tempYdir;
  }
  void drawBall(){
    fill(0);
    ellipse(xpos, ypos, 30, 30);
  }
  void moveBall(){
    xpos = xpos + xdir;
    ypos = ypos + ydir;
  }
  void bounceBall(){
    if(xpos < 15 || xpos > width-15){
          xdir = xdir * -1;
    }
    if(ypos < 15 || ypos > height-15){
          ydir = ydir * -1;
    }
  }
}


