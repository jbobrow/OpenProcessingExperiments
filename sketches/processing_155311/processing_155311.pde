
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Claire Sheen (csheen)
//Copyright 7.18.14

float crosWd, crosHt, crosX, crosY, crosDx, crosDy;//croissant values
float chicWd, chicHt, chicX, chicY, chicDx, chicDy;//chicken values
float distance, easingCoefficient;//motion values
float backX, backY;
int score, hitCount, phase, startTime;
PImage croissant, chicken, rave;

Minim minim;
AudioPlayer hitPlayer, endPlayer, technoPlayer;

void setup()
{
  size (700, 500);
  frameRate(60);
  smooth();
  noStroke();
  easingCoefficient = 0.05;
  crosHt = 50;
  crosWd = 100;
  crosX = 0;
  crosY = 0;
  crosDx = 10;
  crosDy = 6;
  chicDx = 8;
  chicDy = 3;
  imageMode(CENTER);
  textAlign(CORNER);
  croissant = loadImage("transparentcroissant.png");
  
  chicWd = chicHt= 200;
  chicX = 400;
  chicY = 200;
  chicken = loadImage("chicken.png");
  score = 0;
  phase = 1;
  
  minim = new Minim(this);
  endPlayer = minim.loadFile("roostercrow.mp3");
  hitPlayer = minim.loadFile("chickensound.mp3");
  technoPlayer = minim.loadFile("techno.mp3");
  rave = loadImage("rave.jpg");
}

void draw()
{
  if(phase == 1)
  {
    startScreen();
  }
  else if (phase == 2)
  {
    if((millis() - startTime) > 30000)
    {
      endScreen();
    }
    else
    {
      technoPlayer.play();
      playScreen();
    }
  }
}

void startScreen()
{
  fill(152, 250, 5);
  rect(0, 0, 700, 500);
  textSize(100);
  fill(250, 250, 250);
  text("Welcome!", 120, 200);
  
  textSize(30);
  fill(250, 250, 250);
  text("Swipe the mouse to influence chicken's path\ntoward croissant.\nPress any key to begin.", 30, 300);
}

void playScreen()
{
  prepScreen(); 
  moveCroissant();
  drawCroissant();
  moveChicken();
  drawChicken();
  checkForCollision();
  showScore();
  showTime();
}

void prepScreen()
{
  distance = dist(crosX, crosY, chicX, chicY);//distance between croissant and chicken!
  backX = 0;
  backY = 0;
  pushMatrix();
  translate(backX, backY);
  rotate(radians(frameCount));
  image(rave, backX, backY, 4000, 2000);
  popMatrix();
}

void moveCroissant()
{
  crosX = crosX + crosDx;
  crosY = crosY + crosDy;
  if(crosX < 0 || crosX > 700)//if it hits the left or right wall
  {
    crosDx = -crosDx;//reverse horizontal speed
    crosX = crosX + crosDx;//restore motion so it doesn't shake
   }
   if(crosY < 0 || crosY > 500)//if it hits the top or bottom wall
   {
      crosDy = -crosDy;//reverse vertical speed
      crosY = crosY + crosDy;//restore motion so it doesn't shake
   }
}

void drawCroissant()
{
  image(croissant, crosX, crosY, crosWd, crosHt);
}
  
void moveChicken()
{
  chicX = chicX - chicDx;
  chicY = chicY - chicDy;
  if(chicX < -0.5*chicWd)
  {
    chicX = width+0.5*chicWd;
  }
  if(chicY < -0.5*chicHt)
  {
    chicY = height+0.5*chicHt;
  }
  if(chicX > width+0.5*chicWd)
  {
    chicX = -0.5*chicWd;
  }
  if(chicY > height+0.5*chicHt)
  {
    chicY = -0.5*chicHt;
  }
  
}
  
void drawChicken()
{
  pushMatrix();
  translate(chicX, chicY);
  rotate(radians(frameCount));
  image(chicken, 0, 0, chicWd, chicHt);
  popMatrix();
}
  
void checkForCollision()
{
  if(distance<100)
  {
    hitCount++;
    if(hitCount == 1)
    {
      fill(250, 217, 5);
      rect(0, 0, 700, 500);
      score++;
      //bounce
      chicDx = -chicDx;
      chicDy = -chicDy;
      //sound
      hitPlayer.rewind();
      hitPlayer.play();
    }
  }
  else
  {
    hitCount = 0;
  }
}

void mouseMoved()
{
  if (mouseX > pmouseX)
  //move right
  {
    chicX = mouseX - mouseX*easingCoefficient;
  }
  else if (mouseX < pmouseX)
  //move left
  {
    chicX = mouseX + mouseX*easingCoefficient;
    //change chicken direction
    chicDx = -chicDx;
    chicDy = -chicDy;
  }
  //does nothing if mouse moves vertically
}

void keyPressed()
{
  if(phase == 1)
 {
  phase = 2;
  startTime = millis();
 } 
}

void showScore()
{
  textSize(32);
  text("Score: "+score, 10, 30);
}

void showTime()
{
  textSize(32);
  text("Time: "+int((30-(millis()-startTime)/1000)), 10, 80);
}

void endScreen()
{
  fill(152, 250, 5);
  rect(0, 0, 700, 500);
  textSize(60);
  fill(250, 250, 250);
  text("Game Over!", 150, 80);
  
  textSize(60);
  fill(250, 250, 250);
  text("Your score was: "+score, 50, 400);
  
  endPlayer.play();
}


