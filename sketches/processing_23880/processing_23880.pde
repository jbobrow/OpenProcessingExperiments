
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

//globalize all the possible images
PImage adventure;
PImage neutralBirdr, neutralBirdl;
PImage flyingBird;

//for walking, arrays so that we can store all the walking possiblities
PImage[] walkR = new PImage[2];
PImage[] walkL = new PImage[2];

int currentFrame = 0;
int gravityA, birdA, birdV;
int x = 1000;
int deltaX = -1120;
int standingX = 170;
int standingY = 290;
boolean leftorright, moving;

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("07 Valentine.mp3");
  //size of the frame (The viewable area)
  size(340, 340);
  //overall framerate
  frameRate(10);
  leftorright = true;
  moving = false;
  //loads image for the background adventure
  adventure = loadImage("background.png");
  //loads neutral bird image (the standing one)
  neutralBirdr = loadImage("tweetyr0.gif");
  neutralBirdl = loadImage("tweetyl0.gif");
  gravityA = -2;

  player.play();
  //loads all the walking images left and right
  for (int i = 0;i<walkL.length;i++)
  {
    walkL[i] = loadImage("tweetyl" + i +".gif");
  }
  for (int i = 0;i<walkR.length;i++)
  {
    walkR[i] = loadImage("tweetyr" + i +".gif");
  }
}

void draw() {

  //Tells comp where to start drawing images
  imageMode(CENTER);
  //background image (obviously really large. The x changes to give the appearance of movement
  image(adventure, x, 170);

  //if the character moves too the right and they aren't all the way over at the left. 
  //moves the background image towards the left to give appearance of movement

  //fly mechanic
  if (keyPressed&&keyCode ==UP)
  {
    birdA = birdA + gravityA;

    if(birdA <= 0)
    {
      birdA = 4;
    }

    else
    {
      birdV = birdV + birdA;
      standingY-= birdV;
    }

  }

  else if (standingY<290)
  {
    birdV = birdV + gravityA;
    standingY = standingY - birdV;
  }
  if (standingY>290)
  {
    standingY = 290;
  }

  if (standingY<0)
  {
    standingY = 0;
  }

  else
  {
  }
  //possibly have music start here

    //movement animation RIGHT
  if (keyPressed&&keyCode==RIGHT)
  { 
    //if the current movement is less the the total images in a walk cycle
    //i.e. if the bird hasn't finished walking yet keep moving the bird
    if(currentFrame<walkR.length-1)
    {
      currentFrame++;
    }
    //else reset the cycle which will allow you to start again
    else
    {
      currentFrame=1;
    }  

    //if the character moves too the right and they aren't all the way over at the left. 
    //moves the background image towards the left to give appearance of movement

    if (x<=-625&&standingX<315)
    {
      standingX+=5;
    }

    else if (x>=1000&&standingX<170)
    {
      standingX+=5;
    }

    else if (standingX == 170)
    {
      x-=5;
    }

    //shows the movement
    pushMatrix();
    image(walkR[currentFrame],standingX,standingY);
    popMatrix();

    //if they stop walking leaves them with the standing image
    image(walkR[1],0,400);

    leftorright = true;
    moving = true;
  } 

  //same as right movement
  else if (keyPressed&&keyCode==LEFT)
  {
    if(currentFrame<walkL.length-1)
    {
      currentFrame++;
    }
    else
    {
      currentFrame = 1;
    }



    if (x>=1000&&standingX>=25)
    {

      standingX-=5;
    }

    else if (x<=-625&&standingX>170)
    {

      standingX-=5;
    }

    else if (standingX == 170)
    {
      x+=5;
    }

    pushMatrix();
    image(walkL[currentFrame],standingX,standingY);
    popMatrix();

    image(walkL[1],0,400);

    leftorright = false;
    moving = true;
  } 
  
  else {
    moving = false;
  }
  
  //image of the standing bird, and its location at the center of the screen
  if (moving == false)
  {
    if (leftorright == true)
    {
      image(neutralBirdr, standingX, standingY);
    }
    else if (leftorright == false)
    {
      image(neutralBirdl, standingX, standingY);
    }
  }

}








