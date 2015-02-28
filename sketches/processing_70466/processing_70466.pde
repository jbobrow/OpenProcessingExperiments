
// Homework #6, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com

// Another simple game!
// Use arrow keys UP, DOWN, RIGHT, and LEFT to move pacman around the screen.
// You are immune to ghosts for 100 frames, but during this time you cannot eat the fruit.
// After the first 100 frames if the ghosts hit you, you lose.
// If 2000 frames passes by, you lose.
// Use the SHIFT key to respawn the random ghosts. Useful if you're about to get hit!
// Eat the forbidden fruit and you win!
// Click your left mouse button to restart the game.


//=======================================================
// Stating the variables
color col; // general variable

float circleX; // pacman's x position
float circleY; // pacman's y position
float circleW; // pacman's width
float circleH; // pacman's height
float pmouthA; // pacman's upper lip
float pmouthB; // pacman's lower lip

// the fruit that spawns randomly
float fruitX; // fruit's x position
float fruitY; // fruit's y position
float fruitW; // fruit's width
float fruitH; // fruit's height

// the width and height of all ghosts
float ghostW; // all of the ghosts' width
float ghostH; // all of the ghosts' height

// ghost1 bounces back and forth horizontally
// random ghost
float ghostX; // ghost1's x position
float ghostY; // ghost1's y position
float speed; // speed of ghost

// ghost2 wraps around the screen
// fixed ghost
float ghostX2; // ghost2's x position
float ghostY2; // ghost2's y position
float speed2; // speed of ghost2 
int state; // ghost2's state (top,right,bottom,left)

// ghost3 bounces like a ball vertically
// fixed ghost
float ghostX3; // ghost3's x position
float ghostY3; // ghost3's y position
float speed3; // speed of ghost3
float gravity; // acceleration for ghost3

// ghost4 bounces diagonally
// random ghost
float ghostX4; // ghost4's x position
float ghostY4; // ghost4's y position
float speed4; // speed of ghost4

// ghost5 starts at A and goes to B and repeats
// random ghost
float ghostX5; // ghost5's x position
float ghostY5; // ghost5's y position
float speed5; // speed of ghost5
//=======================================================


//=======================================================
void setup()
{
  // things that don't change
  size(800, 400);
  smooth();

  // variable values
  // other stuff
  col=color(random(255), random(255), random(255));

  // all pacman's variables!
  circleX=width/2;
  circleY=height/2;
  circleW=75;
  circleH=circleW;
  pmouthA=radians(-30);
  pmouthB=radians(30);
  
  // fruit respawns at random locations
  fruitX=random(width); // fruit's x position
  fruitY=random(height); // fruit's y position
  fruitW=20; // fruit's width
  fruitH=20; // fruit's height
  
  // ghost W and H are constants for ghosts' width and height
  ghostW=60;
  ghostH=60;

  // ghost1 bounces back and forth horizontally
  // random ghost
  ghostX=random(width); // starting position of ghost1
  ghostY=random(height); // starting position of ghost1
  speed=random(5); // speed of ghost2

  // ghost2 wraps around the screen
  // fixed ghost
  ghostX2=ghostW/2; // starting postion of ghost2
  ghostY2=ghostH/2; // starting postion of ghost2
  speed2=random(5); // speed of ghost2
  state=0; // starting state for ghost2

  // ghost3 bounces like a ball vertically
  // fixed ghost
  ghostX3=width/3; // starting postion of ghost3
  ghostY3=ghostH/2; // starting postion of ghost3
  speed3=0; // speed of ghost3
  gravity=0.1; // acceleration for ghost3

  // ghost4 bounces diagonally
  // random ghost
  ghostX4=random(width); // starting position of ghost4
  ghostY4=random(height); // starting position of ghost4
  speed4=5; // speed of ghost4
  
  // ghost5 starts at A and goes to B and repeats
  // random ghost
  ghostX5=random(width); // starting postion of ghost5
  ghostY5=random(height); // starting postion of ghost5
  speed5=5; // speed of ghost5
}
//=======================================================


//=======================================================
// a table of contents!
void draw()
{
  // background
  background(255);
  
  // putting pacman on the stage
  pacman(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
  
  // putting the fruit on the stage
  fruit(fruitX,fruitY,fruitW,fruitH);

  // putting ghosts on stage
  ghost(ghostX, ghostY, ghostW, ghostH); // ghost1 bounces back and forth horizontally
  ghost(ghostX2, ghostY2, ghostW, ghostH); // ghost2 wraps around the screen
  ghost(ghostX3, ghostY3, ghostW, ghostH); // ghost3 bounces like a ball vertically
  ghost(ghostX4, ghostY4, ghostW, ghostH); // ghost4 bounces diagonally
  ghost(ghostX5, ghostY5, ghostW, ghostH); // ghost5 starts at A and goes to B and repeats

  // move the ghosts
  ghostMove();
  ghostMove2();
  ghostMove3();
  ghostMove4();
  ghostMove5();
  
  // fruit moves randomly every few frames
  fruitMove();
  
  // show frame counter on bottom right
  showFrames();
  
  // if pacman eats fruit, you win!
  eatFruit();
  
  // if pacman hits ghost, you lose...
  pacmanDie();
  
  // if 2000 frames pass, you lose...
  timeOut();
 
}
//=======================================================


//=======================================================
// you lose if pacman and ghost have the same X and Y
// you are immune for 50 frames
void pacmanDie()
{
 
  if (frameCount > 100 && circleX>ghostX-ghostW && circleX<ghostX+ghostW && circleY>ghostY-ghostH && circleY<ghostY+ghostH)
  {
    lose();
  }
 
  else if (frameCount > 100 && circleX>ghostX2-ghostW && circleX<ghostX2+ghostW && circleY>ghostY2-ghostH && circleY<ghostY2+ghostH)
  {
    lose();
  }
   
  else if (frameCount > 100 && circleX>ghostX3-ghostW && circleX<ghostX3+ghostW && circleY>ghostY3-ghostH && circleY<ghostY3+ghostH)
  {
    lose();
  }
   
  else if (frameCount > 100 && circleX>ghostX4-ghostW && circleX<ghostX4+ghostW && circleY>ghostY4-ghostH && circleY<ghostY4+ghostH)
  {
    lose();
  }
   
   else if (frameCount > 100 && circleX>ghostX5-ghostW && circleX<ghostX5+ghostW && circleY>ghostY5-ghostH && circleY<ghostY5+ghostH)
  {
    lose();
  }

}
//=======================================================


//=======================================================
void timeOut()
{
  if (frameCount > 2000)
  {
    lose();
  }
  
  if (frameCount > 100 && frameCount < 200)
  {
  textSize(20);
  fill(255,0,0);
  text("Your immunity is gone...", width/3, height/3);
  text("Ghosts can kill you now...",width/3,height/2.5);
  }
  
}
//=======================================================


//=======================================================
//frame count on top
void showFrames()
{
  textSize(10);
  fill(0);
  text("Frames: "+frameCount+"/2000 until you LOSE", width*.78, height*.98);
}
//=======================================================


//=======================================================
void fruitMove()
{
  
  if (
  frameCount == 100 ||
  frameCount == 200 ||
  frameCount == 300 ||
  frameCount == 400 ||
  frameCount == 500 ||
  frameCount == 600 ||
  frameCount == 700 ||
  frameCount == 800 ||
  frameCount == 900 ||
  frameCount == 1000 ||
  frameCount == 1100 ||
  frameCount == 1200 ||
  frameCount == 1300 ||
  frameCount == 1400 ||
  frameCount == 1500 ||
  frameCount == 1600 ||
  frameCount == 1700 ||
  frameCount == 1800 ||
  frameCount == 1900 ||
  frameCount == 2000
  )
  {
    fruitX=circleW+random(700);
    fruitY=circleH+random(200);
  }
  
}
//=======================================================


//=======================================================
// if you eat the fruit you win!
void eatFruit()
{
  
  if (
  frameCount > 100 &&
  fruitX > circleX-circleW/2 && fruitX < circleX+circleW/2
  && fruitY > circleY-circleH/2 && fruitY < circleY+circleH/2
  )
  
  {
   win();
  }
  
}
//=======================================================


//=======================================================
// restart the game
void mousePressed(){
  loop();
  fruitX=random(width);
  fruitY=random(height);
  
  ghostX=random(width);
  ghostX4=random(width);
  ghostX5=random(width);
      
  ghostY=random(height);
  ghostY4=random(height);
  ghostY5=random(height);
      
  speed=random(10);
  speed4=random(10);
  speed5=random(10);
  
  if (frameCount > 1)
  {
    frameCount=0;
  }
  
}
//=======================================================


//=======================================================
// what happens if you lose
void lose()
{
  textSize(20);
  fill(0);
  text("...YOU LOSE! :(",width/3,height/2);
  text("Press your left mouse key to try again.",width/3,height/1.8);
  noLoop();
}
//=======================================================


//=======================================================
// what happens if you win
void win()
{
  
 textSize(20);
 fill(0);
 text("...YOU WIN! Congrats!",width/3,height/2);
 text("Press your left mouse key to play again.",width/3,height/1.8);
 noLoop();
  
}
//=======================================================


//=======================================================
// drawing the fruit
void fruit(
float fruitX,
float fruitY,
float fruitW,
float fruitH)
{
  // fruit base
  ellipseMode(CENTER);
  fill(209,105,105);
  noStroke();
  ellipse(fruitX,fruitY,fruitW,fruitH);
  
  // fruit shadow
  fill(157,59,59);
  ellipse(fruitX,fruitY-fruitH/5,fruitW/2,fruitH/3);
  
  // fruit stem
  noFill();
  stroke(72,183,73);
  strokeWeight(2);
  arc(fruitX-fruitW/3.5,fruitY-fruitH/.9,fruitW,fruitH*2,radians(-50),radians(60));
}
//=======================================================


//=======================================================
// ghost5 starts at A goes to B and then starts at A again
void ghostMove5()
{
  ghostX5=(ghostX5+speed5)%width;
  ghostY5=(ghostY5+speed5)%height;
}
//=======================================================


//=======================================================
// ghost4 is a diagonal bouncer
void ghostMove4()
{

  ghostX4=ghostX4+speed4;
  if (ghostX4-ghostW/2 < 0 || ghostX4+ghostW/2 > width)
  {
    speed4=speed4*-1;
  }

  ghostY4=ghostY4+speed4;
    if (ghostY4-ghostH/2 < 0 || ghostY4+ghostH/2 > height)
  {
    speed4=speed4*-1;
  }
  
}
//=======================================================


//=======================================================
// ghost3 bounces like a ball
void ghostMove3()
{

  ghostY3=ghostY3+speed3;
  speed3=speed3+gravity;

  if (ghostY3 > height) {
    speed3=speed3*-0.95;
  }
}
//=======================================================


//=======================================================
// ghost2 wraps around the edge of the screen
void ghostMove2()
{

  if (state==0)
  {
    ghostX2=ghostX2+speed2;
    if (ghostX2>width-ghostW/2)
    {
      ghostX2=width-ghostW/2;
      state=1;
    }
  }
  else if (state==1)
  {
    ghostY2=ghostY2+speed2;
    if (ghostY2>height-ghostH/2)
    {
      ghostY2=height-ghostH/2;
      state=2;
    }
  }
  else if (state==2)
  {
    ghostX2=ghostX2-speed2;
    if (ghostX2-ghostW/2<0)
    {
      ghostX2=ghostW/2;
      state=3;
    }
  }
  else if (state==3)
  {
    ghostY2=ghostY2-speed2;
    if (ghostY2-ghostH/2<0)
    {
      ghostY2=ghostH/2;
      state=0;
    }
  }
}
//=======================================================


//=======================================================
// ghost1 bounces back and forth
void ghostMove()
{

  ghostX=ghostX+speed;
  if (ghostX-ghostW/2 < 0 || ghostX+ghostW/2 > width)
  {
    speed=speed*-1;
  }
}
//=======================================================


//=======================================================
// pushing SHIFT changes the x,y, and speed of all random ghosts
// moving pacman with arrow keys
void keyPressed() {
  if (key == CODED) {
    
    if (keyCode == SHIFT) {
      ghostX=random(width);
      ghostX4=random(width);
      ghostX5=random(width);
      
      ghostY=random(height);
      ghostY4=random(height);
      ghostY5=random(height);
      
      speed=random(10);
      speed4=random(10);
      speed5=random(10);
    } 

    if (keyCode == UP) {
      pacman(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
      circleY=circleY-50;
      circleY=constrain(circleY, 0, height);
    } 
    else if (keyCode == DOWN) {
      pacman(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
      circleY=circleY+50;
      circleY=constrain(circleY, 0, height);
    }
    else if (keyCode == LEFT) {
      pacman(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
      circleX=circleX-50;
      circleX=constrain(circleX, 0, width);
    }
    else if (keyCode == RIGHT) {
      pacman(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
      circleX=circleX+50;
      circleX=constrain(circleX, 0, width);
    }
    else {
      circleY = circleY;
      circleX = circleX;
    }
  }
}
//=======================================================


//=======================================================
// drawing scary ghosts
void ghost(
float ghostX, 
float ghostY, 
float ghostW, 
float ghostH)
{
  //ghost body
  fill(col);
  noStroke();
  rectMode(CENTER);
  rect(ghostX, ghostY, ghostW, ghostH);

  //ghost eyes
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(ghostX-ghostW/3, ghostY-ghostH/4, 10, 20);
  ellipse(ghostX+ghostW/3, ghostY-ghostH/4, 10, 20);
}
//=======================================================


//=======================================================
// lets draw pacman!
void pacman(
float circleX, 
float circleY, 
float circleW, 
float circleH, 
float pmouthA, 
float pmouthB)
{

  pmouthA=radians(frameCount%30*-1);
  pmouthB=radians(frameCount%30);

  // pacman's head
  ellipseMode(CENTER);
  fill(137, 172, 191);
  noStroke();
  ellipse(circleX, circleY, circleW, circleH);

  // pacman's mouth
  fill(54, 62, 79);
  stroke(255);
  strokeWeight(circleW/210*10);
  arc(circleX, circleY, circleW, circleH, pmouthA, pmouthB);

  // pacman's eyes
  float eyeY, eyeX;
  eyeY = circleY-circleH/4;
  eyeX = circleX+circleW/8;
  noStroke();
  fill(255);
  ellipse(eyeX, eyeY, circleW*.15, circleH*.15);

  // intials start here
  // y - first leg
  float changeStroke;
  changeStroke = circleW/160;
  stroke(255);
  strokeWeight(4*changeStroke);
  noFill();
  beginShape();
  curveTightness(6);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/4, circleY+circleH/16);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  endShape();
  // y - second leg curve
  beginShape();
  curveTightness(6);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/8, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  endShape();

  // h - first leg
  stroke(198, 229, 245);
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/10.66666667, circleY+circleH/6.4);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  endShape();
  // h - second leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/4.571428571, circleY+circleH/5.333333333);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  endShape();
  // h - middle leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/2.666666667, circleY+circleH/4);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  endShape();
}
//=======================================================

