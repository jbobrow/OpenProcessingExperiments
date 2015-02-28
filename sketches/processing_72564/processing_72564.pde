
// Homeworcherryk #6, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com

// Credits
// 1. Some code borrowed from class notes cc08 - GameDemo

// See how many cherries you can help Pacman eat in 60 seconds!
// Hold down the left mouse key and drag right, left, up, and down to move
// Everytime Pacman eats a cherry he grows!
// If you lose control of Pacman and he travels off screen, you will lose all your cherries
// In addition, Pacman will shrink in size... if you go off the screen too much he'll even disappear!
// Good luck!

//----------------------------------------------------//
// global variables
// cherry variables
float cherryX; // cherry's x position
float cherryY; // cherry's y position
float cherryW; // cherry's width
float cherryH; // cherry's height
float cherrySpeedX; // speed of cherry's movement in X direction
float cherrySpeedY; // speed of cherry's movement in Y direction

// pacman variables
float circleX; // pacman's x position
float circleY; // pacman's y position
float circleW; // pacman's width
float circleH; // pacman's height
float pmouthA; // pacman's upper lip
float pmouthB; // pacman's lower lip
float pacmanSpeedX; // pacman's speed in X
float pacmanSpeedY; // pacman's speed in Y

// general game variables
int scoreCount;
int gameTime;
int startTime;
int gamePhase;

// fluff, no seriously...
float dottySize;
color dottyColor;
//----------------------------------------------------//


//----------------------------------------------------//
void setup()
{
background(255);
size(800,400);
smooth();

// global variable values
// cherry variale values
cherryX=random(width);
cherryY=random(height);
cherryW=20;
cherryH=20;
cherrySpeedX=2;
cherrySpeedY=1.5;

// all pacman's variables!
circleX=width/2;
circleY=height/2;
circleW=75;
circleH=circleW;
pmouthA=radians(-30);
pmouthB=radians(30);
pacmanSpeedX=0;
pacmanSpeedY=0;

// general game variables
scoreCount=0;
startTime=0;
gameTime=60000;
gamePhase=0;

// fluff variables
dottySize=10;
dottyColor=color(240);
}
//----------------------------------------------------//


//----------------------------------------------------//
void draw()
{
  // game phases
  // jim, you said this would be OK in class
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
     playGame( );
  }
  else 
  {
    score( );
  }
  
}
//----------------------------------------------------//


//----------------------------------------------------//
void playGame()
{
transparentStage(); // make the background semi-transparent
myCursor(mouseX,mouseY); // replace the default cursor
backgroundNoise();

cherry(cherryX,cherryY,cherryW,cherryH); // spawn the cherry
pacman(circleX,circleY,circleW,circleH,pmouthA,pmouthB); // spawn pacman

pacmanMove(); // move pacman
cherryBounce(); // move cherry

myScore(); // score counter
checkCollisons(); // collisons between cherry and pacman
checkOffscreen(); // check to see if pacman is off screen

myTimer(); // show time that has ellasped
}
//----------------------------------------------------//


//----------------------------------------------------//
void backgroundNoise()
{
  
  for (int i=20; i<width; i=i+50)
  {
    for (int j=20; j<height; j=j+50)
    {
      strokeWeight(random(5,10));
      stroke(random(255));
      point(i,j);      
    }
  }
  
  for (int k=20; k<width; k=k+50)
  {
    for (int g=20; g<height; g=g+50)
    {
      strokeWeight(dottySize);
      stroke(dottyColor);
      point(k,g);
    }
  }
  
}
//----------------------------------------------------//


//----------------------------------------------------//
void showInstructions()
{
transparentStage(); // make the background semi-transparent
  
// draw pacman, nom nom nom
pacman(frameCount%width,height*.2,circleW,circleH,pmouthA,pmouthB);

// tasty cherry!
cherry((frameCount*1.1+70)%width,height*.25,cherryW,cherryH);

fill(0);
text("See how many cherries you can help Pacman eat in 60 seconds!", width*.3, height*.4);
text("Hold down the left mouse key and drag right, left, up, and down to move.", width*.3,height*.45);
text("Everytime Pacman eats a cherry he grows!", width*.3,height*.5);
text("If you lose control of Pacman and he travels off screen, you will lose all your cherries.",width*.3,height*.55);
text("In addition, Pacman will shrink in size... if you go off the screen too much he'll even disappear!",width*.3,height*.6);
text("Press any key to start the game. Good luck!",width*.3,height*.65);

if (keyPressed==true)
{
  gamePhase=1;
  startTime=millis();
}

}
//----------------------------------------------------//


//----------------------------------------------------//
void score()
{
transparentStage(); // make the background semi-transparent

fill(255,0,0);
text("TIMES UP. GAME OVER!", width*.3, height*.4);
text("You ate " + scoreCount + " cherries!", width*.3,height*.45);

fill(0);
if (scoreCount < 1)
{
text("Wow, you really suck :P Press any key to try again!", width*.3,height*.5);
}

else if (scoreCount < 3)
{
text("You did decent... Press any key to try again!", width*.3,height*.5);
}

else if (scoreCount < 6)
{
text("Okay, you're pretty good :) Press any key to play again!", width*.3,height*.5);
}

else if (scoreCount < 10)
{
text("Wow wow wow! You're REALLY good! Press any key to play again!", width*.3,height*.5);
}

else
{
text("WOW! You're GODLY there :o", width*.3,height*.5);
text("I don't think you need to play anymore...", width*.3,height*.55);
text("...But if you still want to play again press any key!", width*.3,height*.6);
}


if (keyPressed==true)
{
  gamePhase=1;
  startTime=millis();
  circleW=75;
  circleH=75;
  circleX=width/2;
  circleY=height/2;
  pacmanSpeedX=0;
  pacmanSpeedY=0;
}
}
//----------------------------------------------------//


//----------------------------------------------------//
void myTimer()
{
  fill(0);
  text("Time Remaining: " + (gameTime/1000 - ((millis()-startTime))/1000) + " Seconds",width*.01,height*.09);  
  if ((millis()-startTime) > gameTime)
  {
    gamePhase=2;
  }
  
}
//----------------------------------------------------//


//----------------------------------------------------//
// check to see if pacman is off screen
void checkOffscreen()
{
  
  if (circleX+circleW/2 > width || circleX-circleW/2 < 0)
  {
    scoreCount=0;
    circleW=circleW*.999;
    circleH=circleH*.999;
    
  // insert flashy cool graphics here
  fill(255,0,0);
  text("...SHRINKING!",random(width),random(height));
  }
  
  if (circleY+circleH/2 > height || circleY-circleH/2 < 0)
  {
    scoreCount=0;
    circleW=circleW*.999;
    circleH=circleH*.999;
    
  // insert flashy cool graphics here
  fill(255,0,0);
  text("...SHRINKING!",random(width),random(height));
  }
  
  else
{
  scoreCount=scoreCount;
  circleW=circleW;
  circleH=circleH;
}
  
}
//----------------------------------------------------//


//----------------------------------------------------//
void myScore()
{
  fill(255);
  noStroke();
  rect(0,0,200,60);
  
  fill(255,0,0);
  text("Cherries Eaten: " + scoreCount, width*.01,height*.05);
}
//----------------------------------------------------//


//----------------------------------------------------//
// if collison is detected this is what happens
void collison()
{
  // insert flashy cool graphics here
  dottySize=random(5,10);
  dottyColor=color(random(255),random(255),random(255));
  circleW=circleW*1.1;
  circleH=circleH*1.1;
  
  // relocate the cherry
  cherryX=random(width);
  cherryY=random(height);
  cherrySpeedX=random(0,5);
  cherrySpeedY=random(0,5);
  
  // add one point to the score
  scoreCount=scoreCount+1;
}
//----------------------------------------------------//


//----------------------------------------------------//
// checking for collisons between the cherry and pacman
void checkCollisons()
{
  
  float d = dist(cherryX,cherryY,circleX,circleY);
  if (d < cherryW || d < cherryH*2)
  {
    collison();
  }
  
}
//----------------------------------------------------//


//----------------------------------------------------//
// change the cursor to something more informative
void myCursor(float cursorX, float cursorY)
{
  
  noCursor();
  fill(255);
  stroke(198, 229, 245);
  line(circleX,circleY,cursorX,cursorY);
  ellipse(cursorX,cursorY,20,20);
  
}
//----------------------------------------------------//


//----------------------------------------------------//
// make pacman move using mouse dragged
void pacmanMove()
{
  
circleX=circleX+pacmanSpeedX;
if (circleX > width)
{
  circleX=0;
}
else if (circleX < 0)
{
  circleX=width;
}

circleY=circleY+pacmanSpeedY;
if (circleY > height)
{
  circleY=0;
}

else if (circleY < 0)
{
  circleY=height;
}

}
//----------------------------------------------------//


//----------------------------------------------------//
// make pacman move using mouse dragged
void mouseDragged()
{
  
  if (mouseX > circleX)
  {
    pacmanSpeedX = pacmanSpeedX+.1;
  }
  
  else if (mouseX < circleX)
  {
    pacmanSpeedX = pacmanSpeedX-.1;
  }
  
  
   if (mouseY > circleY)
  {
    pacmanSpeedY= pacmanSpeedY+.1;
  }
  
  else if (mouseY < circleY)
  {
    pacmanSpeedY = pacmanSpeedY-.1;
  }
  

}
//----------------------------------------------------//


//----------------------------------------------------//
// make the cherry bounce off the walls
void cherryBounce()
{
  
  cherryX=cherryX+cherrySpeedX;
  if (cherryX-cherryW < 0 || cherryX+cherryW > width)
  {
    cherrySpeedX=cherrySpeedX*-1;
  }

  cherryY=cherryY+cherrySpeedY;
  if (cherryY-cherryH < 0 || cherryY+cherryH > height)
  {
    cherrySpeedY=cherrySpeedY*-1;
  }
  
}
//----------------------------------------------------//


//----------------------------------------------------//
void transparentStage()
{
  noStroke();
  fill(255,150);
  rect(0,0,width,height);
}
//----------------------------------------------------//


//----------------------------------------------------//
// drawing the cherry
void cherry(
float cherryX,
float cherryY,
float cherryW,
float cherryH)
{

  // cherry base
  ellipseMode(CENTER);
  fill(209,105,105);
  noStroke();
  ellipse(cherryX,cherryY,cherryW,cherryH);
  
  // cherry shadow
  fill(157,59,59);
  ellipse(cherryX,cherryY-cherryH/5,cherryW/2,cherryH/3);
  
  // cherry stem
  noFill();
  stroke(72,183,73);
  strokeWeight(2);
  arc(cherryX-cherryW/3.5,cherryY-cherryH/.9,cherryW,cherryH*2,radians(-50),radians(60));
}
//----------------------------------------------------//


//----------------------------------------------------//
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
//----------------------------------------------------//


