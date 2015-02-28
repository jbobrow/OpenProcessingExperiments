
//Homework 7
//Miranda Jacoby Copyright 2014, All Rights Reserved

//Instructions: Use the WASD keys to get your ship to the moon with the fewest keystrokes
//while avoiding the colorful space circles! 
//Press R to kill yourself and return to the starting position.
//Press SPACE to reset your time and attempts.

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; 

AudioPlayer s1, s2, s3, s4, s5; 
// s1 = WASD pressed, s2 = SPACE bar pressed, s3 = Collision, s4 = Lose, s5 = Win.

//Player character parameters
float py, px, pd, pDeltaX, pDeltaY;
//Enemy object parameters
float e1y, e1x, e1d, e2y, e2x, e2d, e2v, e3y, e3x, e3d, e3v;
//Goal parameters
float gy, gx, gd;
//Win/lose parameters
int win, lose;
//Time parameters
int startTime, currentTime, timeLapsed, endTime;
//tries to beat the game
int attempt;
//player's score as determined by algorithm
//float score;
int scoreOutput;
//Variables for test guy
float sX1, sX2, sY, testDiam, boundDiam;
//Variable for button pressed
int bPress;

boolean showstartScreen, showwinScreen, showloseScreen, showStats; 




void setup()
{
  size(700, 800);
  px = width/3;
  py = height - height/12;
  textSize( 24 );
  
  showstartScreen = true;
  showwinScreen = false;
  showloseScreen = false;
  showStats = false;

  //starting number of attempts
  attempt = 5;
  
  //starting variables for movement for enemy 3
  e3x = width/3;
  e3y = height/5;
  e3d = width/3;
  e3v = 1;
  
   minim = new Minim(this);
  s1 = minim.loadFile("Elec-crystal-03.wav");
  s2 = minim.loadFile("Crystal-rev-01.wav");
  s3 = minim.loadFile("Glass-tap-02.wav");
  s4 = minim.loadFile ("Crystal-01Bell.wav");
  s5 = minim.loadFile("Elec-crystal-01.wav");
}

void draw ()
{
  prepareWindow();
  player();
  enemy1();
  enemy2();
  enemy3();
  goal();
  attemptsLeft();
  if (showStats) stats();
  if (showstartScreen) startScreen();
  if (showloseScreen) loseScreen();
  if (showwinScreen) winScreen();
  checkKeys();
  boundry();
  test();
}

void prepareWindow( ) {
  fill(0);
  rect(0, 0, width, height);
  noStroke();
}


void player() 
{
  px = px + pDeltaX;
  py = py + pDeltaY;
  pd = height/100;
  fill(255);
  ellipse(px, py, pd, pd); 
  
 //player mouse control
 // if (mousePressed == true)
  //    {
  //      px = mouseX;
  //      py = mouseY;
  //    }
  //    else
  //    {
  //      px = width/3;
  //     py = height - height/12;
  //    }
}

void enemy1 ()
{
  e1x = width/3;
  e1y = height - height/3.5;
  e1d = width/6;
  fill(0, 255, 255);
  ellipseMode(CENTER);
  ellipse(e1x, e1y, e1d, e1d);
  
  if ((pd/2 + e1d/2) >= dist(px, py, e1x, e1y))
  {
    println((pd/2 + e1d/2));
   println(dist(px, py, e1x, e1y));
   miss(); 
  }
}

void enemy2 ()
{
  e2x = -width/12;
  e2y = height/2;
  e2d = width/12;
  e2v = frameCount% ((width + width/6) - width/3);
  e2x = e2x + e2v;
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(e2x, e2y, e2d, e2d);
  
  if ((pd/2 + e2d/2) >= dist(px, py, e2x, e2y))
  {
   println((pd/2 + e2d/2));
   println(dist(px, py, e2x, e2y));
   miss(); 
  }
}

void enemy3 ()
{

  e3x = e3x + e3v;
  fill( 0, 255, 0 );
  //fill(random(255), random(255), random(255));
  ellipseMode(CENTER);
  ellipse(e3x, e3y, e3d, e3d);
  
//   if(e3x >= ((width - width/3) - width/3))
//  {
//    e3v = frameCount% ((width/6) + 5);
//  }
//      else if (e3x <= width/6)
//      {
//        e3v = frameCount% ((width/6) + 5);
//      }
  
//nonfunctional, needs height and width changed
  if(e3x >= (width - width/3) - width/6)
  {
    e3v = -e3v;
  }
      else if (e3x <= width/6)
      {
        e3v = -e3v;
      }
  
  if ((pd/2 + e3d/2) >= dist(px, py, e3x, e3y))
  {
    println((pd/2 + e3d/2));
   println(dist(px, py, e3x, e3y));
   miss(); 
  }
}

void goal()
{
 gx = width/3;
 gy = height/35;
 gd = width/25;
 fill(255);
 ellipse(gx, gy, gd, gd); 
 
 if ((pd/2 + gd/2) >= dist(px, py, gx, gy))
  {
   println((pd/2 + gd/2));
   println(dist(px, py, gx, gy));
   win();
  }
}

void stats()
{
 
 fill(255);
 rect(width- width/3, 0, width- width/3, height );
 //text to display: ellapsed time since "go!"
 //Wins
 //Loses
 //Current Rank?
 //fill(200, 75 , 75);
  
  //Time count and display
  fill(0);
  timeLapsed = (millis() - startTime)/1000;
  textAlign(CORNER);
  textSize(30);
  text( "Time: " + (timeLapsed), width - width/3.5, height/18 );
  //Attempt count and display
  text( "Attempts: " + (attempt), width - width/3.5, height/18 + height/18 );
  //Button pressed count
  textSize(16);
  text( "Button Presses: " + (bPress), width - width/3.5, height/18 + 2*height/18 );
  //Control Reminders
  textSize(18);
  text("W = Move Up", width - width/3.8, 4* (height/18));
  text("A = Move Left", width - width/3.8, 5* (height/18));
  text("S = Move Down", width - width/3.8, 6* (height/18));
  text("D = Move Right", width - width/3.8, 7* (height/18));
  text("SPACE BAR = Reset", width - width/3.8, 9* (height/18));
  text("R = Suicide", width - width/3.8, 10* (height/18));
  textSize(14);
  text("This little guy is the", width - width/3.7, height - height/3.2);
  text("passenger on your ship.", width - width/3.5, height - height/3.5);
  text("Take good care of him!", width - width/3.5, height - height/25);
  
  
}


void checkKeys( )
{
   if (keyPressed)
      println( frameCount );
}

//player key control
void keyPressed()
{
   if (key == 'w' || key == 'W')
   {
     py-= 5;
     pDeltaY-=1;
     bPress+=1;
     s1.play();
     s1.rewind();
   }
   if (key == 'a' || key ==  'A')
   {
     px-= 5;
     pDeltaX-=1;
     bPress+=1;
     s1.play();
     s1.rewind();
   }
   if (key == 's' || key ==  'S')
   {
     py+= 5;
     pDeltaY+=1;
     bPress+=1;
     s1.play();
     s1.rewind();
   }
   if (key == 'd' || key ==  'D') 
   {
     px+= 5;
     pDeltaX+=1;
     bPress+=1;
     s1.play();
     s1.rewind();
   }
   if (key == 'r' || key ==  'R') 
   {
     bPress+=1;
     miss();
   }
   if (key == ' ' ) 
   {
     s2.play();
     s2.rewind();
     showstartScreen = false;
     showwinScreen = false;
     showloseScreen = false;
     showStats = true;
     bPress= 0;
     px = width/3;
     py = height - height/12;
     pDeltaX = 0;
     pDeltaY = 0;
     startTime = millis( );
     attempt = 5;
   }
}

void boundry ()
{
  if (px > width - width/3 || px < 0 || py > height || py < 0)
   {
    miss();
   }
}

void miss ()
  {
    fill(255, 0, 0);
    rect(0, 0, 700, 800);
    px = width/3;
    py = height - height/12;
    pDeltaX = 0;
    pDeltaY = 0;
    attempt-=1; 
    s3.play();
    s3.rewind();
  }

//I was unable to figure out how to record the exact time at which the player won the game,
//So the code for getTime is unused
void getTime()
{
    timeLapsed = endTime;
    
}
  
 void attemptsLeft ()
 {
   if (attempt <= 0)
   {
     scoreCompute();
     showloseScreen = true;
   }
 }
  
void win ()
{
    scoreCompute();
    fill(0, 255, 0);
    rect(0, 0, 700, 800);
    px = width/3;
    py = height - height/12;
    pDeltaX = 0;
    pDeltaY = 0;
    bPress= 0;
    attempt = 5;
    showwinScreen = true;
    s5.play();
    s5.rewind();
}

void winScreen ()
{
  fill(0);
  rect(0, 0 , width, height);
  textAlign(CENTER);
  fill(255);
  textSize(48);
  text("YOU WON!", width/2, height/2);
  textSize(26);
  text("Press SPACE to try again.", width/2, height/2 + height/15);
  //text("Rank: " + (scoreOutput),  width/2, height/6);  
  //text("Time: " + endTime, width/2, height/4); 
  getRank();

}

void loseScreen ()
{
  //s4.play();
  fill(0);
  rect(0, 0 , width, height);
  textAlign(CENTER);
  fill(255);
  textSize(32);
  text("YOU DIED!", width/2, height/2);
  textSize(26);
  text("Press SPACE to try again.", width/2, height/2 + height/15);
  textSize(20);
  //scoreOutput = "place of holding";
  //text("Rank: " + (scoreOutput),  width/2, height/6);  
  //text("Time: " + endTime, width/2, height/4);
  getRank();

  
    if (showloseScreen = true)
  {
        s4.play();

  }
  
}

void startScreen ()
{
  fill(0);
  rect(0, 0 , width, height);
  textAlign(CENTER);
  fill(255);
  textSize(32);
  text("Avoid the colorful plantets and", width/2, height/3);
  text("get to the small white moon to win!", width/2, height/3 + height/20);
  textSize(18);
  text("Less Keystrokes = Higher Score.", width/2, height/3 + height/7);
  text("Use the W, S, A, and D keys to navigate.", width/2, height/2);
  textSize(26); 
  text("Press SPACE to begin.", width/2, height/2 + height/15);

//Decided to play s2 soud when SPACd is pressed, instead of playing upon start-up.  
//    if (showstartScreen = true)
//  {
//        s2.play();
//
//  }
}

//I decided to play with contrain, and then this hapened....
void test()

  {
    fill(0);
    ellipse(width - width/6, height - height/6, width/5, width/5);
    fill(255);
    //eyeballs
    ellipse((width - width/6) - width/23, height - height/6, width/16, width/16);
    ellipse((width - width/6) + width/23, height - height/6, width/16, width/16);
    //pupils
    fill(0);
    testDiam = width/30;
    boundDiam = width/32;
    //sX1 = constrain( mouseX, ((width - width/6) - width/23)+boundDiam/2, ((width - width/6) - width/23)-boundDiam/2);
    //sX2 = constrain( mouseX, ((width - width/6) + width/23)+boundDiam/2, ((width - width/6) + width/23)-boundDiam/2);
    //sY = constrain( mouseY, (height - height/6)+boundDiam/2, (height - height/6)-boundDiam/2);
    
    sX1 = constrain( mouseX, ((width - width/6) - width/23)-boundDiam/2, ((width - width/6) - width/23)+boundDiam/2 );
    sX2 = constrain( mouseX, ((width - width/6) + width/23)-boundDiam/2, ((width - width/6) + width/23)+boundDiam/2 );
    sY = constrain( mouseY, (height - height/6)-boundDiam/2, (height - height/6)+boundDiam/2 );
    ellipse(sX1, sY, testDiam, testDiam);
    ellipse(sX2, sY, testDiam, testDiam);
  }
  
//Since I was not able to figure out how to record the player's "win time," 
//I used button presses to help determine ranking instead. 
//
//The lower the score, the better you did. 
//Attempts works as a multiplier (more attempts taken = larger overall number).
void scoreCompute ()
{
    scoreOutput = (6 - attempt) * bPress;
    println(scoreOutput);
}

void getRank ()
{
    textSize(28);
    if (scoreOutput == 0)
    {
        text("Rank: Impossible, " + "("+(scoreOutput)+")", width/2, height/6);
    }
      
    if (scoreOutput <= 10 && scoreOutput > 0)
    {
        text("Rank: Amazing " + "("+(scoreOutput)+")", width/2, height/6);
    }
      
    if (scoreOutput <= 20 && scoreOutput > 10)
    {
        text("Rank: Admirable " + "("+(scoreOutput)+")", width/2, height/6);
    }
      
    if (scoreOutput <= 40 && scoreOutput > 20)
    {
        text("Rank: Alright " + "("+(scoreOutput)+")", width/2, height/6);
    }
    
    if (scoreOutput <= 80 && scoreOutput > 40)
    {
        text("Rank: Acceptable " + "("+(scoreOutput)+")", width/2, height/6);
    }
    if (scoreOutput > 80)  
    {
        text("Rank: Atrocious " + "("+(scoreOutput)+")", width/2, height/6);
    } 
  
}


