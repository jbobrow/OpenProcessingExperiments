
//Copyright (C) 2013
//D. John Kirby
/*
    This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.*/
/* This program contains code that was written by Shanfan Huang and
   modified by D. John Kirby.
   Released under the GPL Copyright (C) 2010, Source code here:
   <http://www.openprocessing.org/sketch/8617>*/

float[] CoM;
int nClicks = 5;
int nStepsDefault = 250;
int nSteps =  250; //number of steps between frames.
ArrayList ballList = new ArrayList();
boolean projection = false;
boolean trails = false;
boolean dynamicColoring = true;
boolean hasSelectedColor = false;
boolean CoMtargetting = true;
float X = 0, Y = 0, Vex = 0, Vey = 0; //For making new balls.
int ballSize = 20;//For making new balls
color ballColor = color(0, 0, 255);//Color for new balls
Ball thisBall; //Holds new balls

boolean[] clicks = new boolean[nClicks];
boolean startSim = false; //To be set to true when the user is ready
int thisClick = 0;
float scaleFactor = 1.0;
float textX, textY; //These variables keep track of where to print the instruction menu.
float buttonWidth, buttonSpace, buttonsStart;

float upButtonX, upButtonY, upButtonWidth, upButtonHeight;

float downButtonX, downButtonY, downButtonWidth, downButtonHeight;

float startX, startY, startRad;

void mousePressed()
{
  color clicked = get(mouseX, mouseY);
  if(!dynamicColoring && clicks[0] && !clicks[1])
    ballColor = clicked;
  //If user clicks the red ball, time to play
  if ( clicks[0] && dist(mouseX, mouseY, width, height) < 150 )
  {
    startSim = true;
    nSteps = nStepsDefault;
    return;
  }
  /*Handle reset of game here*/
  if ((clicks[0] || startSim) && dist(mouseX, mouseY, 0, height) < 75)
  {
    ballList = new ArrayList();
    startSim = false;
    for ( int i = 0; i < clicks.length; i++)
      clicks[i] = false;
    thisClick = 0;
    noStroke();
    colorMode(RGB,255);
    return;
  }
  
  /*Handle pressing start button*/
  if(!clicks[0] && dist(mouseX,mouseY,startX,startY) < startRad)
  {
    clicks[0] = true;
    thisClick++;
    return;
  }
  /*This handles the interactive clickybits*/
  /*Look for premades here*/
  if (!startSim && !clicks[0])
  {
    if ((textY+410 <= mouseY) &&  mouseY <= textY + 510 && !clicks[0])
    {
      if (buttonsStart <= mouseX && mouseX <= buttonsStart+buttonWidth)
      {
        loadPremade(1);
        return;
      }
      if (buttonsStart+1*buttonWidth+1*buttonSpace <= mouseX 
        && mouseX <= buttonsStart+2*buttonWidth+1*buttonSpace)
      {
        loadPremade(2);
        return;
      }
      if (buttonsStart+2*buttonWidth+2*buttonSpace <= mouseX 
        && mouseX <= buttonsStart+3*buttonWidth+3*buttonSpace)
      {
        loadPremade(3);
        return;
      }
      if (buttonsStart+3*buttonWidth+3*buttonSpace <= mouseX 
        && mouseX <= buttonsStart+4*buttonWidth+4*buttonSpace)
      {
        loadPremade(4);
        return;
      }
      if (buttonsStart+4*buttonWidth+4*buttonSpace <= mouseX 
        && mouseX <= buttonsStart+5*buttonWidth+5*buttonSpace)
      {
        loadPremade(5);
        return;
      }
    }

    //Handle toggling the trails on and off.
    if (mouseX >= textX+260 && mouseX <= textX+260+120 &&
      mouseY >= textY+640 && mouseY <= textY+640+50)
    {
      //Happy
      trails = !trails;
      return;
    }

    //Handle toggling the projection on and off
    if (mouseX >= textX+260+130 && mouseX <= textX+260+130+155 &&
      mouseY >= textY+640 && mouseY <= textY+640+50)
    {
      projection = !projection;
      return;
    }
    
    //Handle toggling the dynamic coloring
   if (mouseX >= textX+260+130+165 && mouseX <= textX+260+130+165+175 &&
      mouseY >= textY+640 && mouseY <= textY+640+50)
   {
    dynamicColoring = !dynamicColoring;
    return; 
   }
   
     if (mouseX >= textX+100 && mouseX <= textX+100+150 &&
         mouseY >= textY+640 && mouseY <= textY+640+50)
     {
        CoMtargetting = !CoMtargetting;
        return; 
     }
   }
   /*Ensure that the user can resize the object at will*/
   if(clicks[1] && clicks[2] && !clicks[3])
   {
    if (mouseX >= upButtonX && mouseX <= upButtonX+upButtonWidth
     && mouseY >= upButtonY && mouseY <= upButtonY+upButtonHeight)
     {
       return;
     }
     
    if (mouseX >= downButtonX && mouseX <= downButtonX+downButtonWidth
     && mouseY >= downButtonY && mouseY <= downButtonY+downButtonHeight)
    {
     return;
    }
   }
   
   if ( thisClick < nClicks && clicks[0])
   {
      clicks[thisClick] = true;
      thisClick++;
   }
}

void setup()
{
  size(800, 800);
  textX = 5;
  textY = 55;
  smooth();
  buttonWidth = 100;
  buttonSpace = 30;
  buttonsStart = textX +75;

  /* Set all the click variables to be false */
  for (thisClick = 0; thisClick < nClicks; thisClick++)
    clicks[thisClick] = false;
  thisClick = 0;
  upButtonX = width-100;
  upButtonY = height/2-50;
  upButtonWidth = 50;
  upButtonHeight = 50;

  downButtonX = upButtonX;
  downButtonY = height/2;
  downButtonWidth = upButtonWidth;
  downButtonHeight = upButtonHeight;
  
  startX = width-80;
  startY = 80;
  startRad = 120;
}

void loadPremade(int which)
{
  if (which == 1)
  {
    //Basic solar system
    ballList.add(new Ball(width/2, height/2, 0, 0, color(255, 255, 0), 50, 10000));
    ballList.add(new Ball(width/2, 0.6*height, 11.1, 0, color(0, 0, 255), 30, 10)); 
    ballList.add(new Ball(width/2, 0.75*height, 3, 0, color(255, 0, 0), 25, 10));
  }
  else if (which ==2)
  {
    //That's no Moon!
    ballList.add(new Ball(width/2, height/2, 0, 0, color(255, 255, 0), 75, 10000));
    ballList.add(new Ball(0.9*width, height/2, 0, -5.6, color(205, 183, 158), 25, 500));
    ballList.add(new Ball(0.9*width-30, height/2, 0, -5.6+4, color(255, 255, 255), 5, 1));
    ballList.add(new Ball(width/2, 0.75*height, 5, 0, color(255, 0, 0), 25, 10));
  }
  else if (which == 3)
  {
    //Binary Star System
    ballList.add(new Ball(width/2-100, height/2, 0, 1.5, color(255, 255, 0), 75, 2*10^1000));
    ballList.add(new Ball(width/2+100, height/2, 0, -1.5, color(255, 255, 0), 75, 2*10^1000));
  }
  else if (which ==4)
  {
    //It's a space station!
    ballList.add(new Ball(width/2-100, height/2, 0, 5.5, color(255, 255, 0), 30, 10000));
    ballList.add(new Ball(width/2+100, height/2, 0, -5.5, color(255, 255, 0), 30, 10000));
    ballList.add(new Ball(width/2-150, height/2, 0, 5.5+14, color(0, 0, 255), 15, 1));
    ballList.add(new Ball(width/2+150, height/2, 0, -5.5+14, color(255, 0, 0), 15, 1));
  }
  else if (which == 5)
  {

    //Orbit they Barry Center
    ballList.add(new Ball(width/2-50, height/2, 0, 1.5, color(255, 255, 0), 35, 2*10^1000));
    ballList.add(new Ball(width/2+50, height/2, 0, -1.5, color(255, 255, 0), 35, 2*10^1000));
    ballList.add(new Ball(width/2-350, height/2, 0, 2.2, color(0, 0, 255), 15, 1));
  }

  startSim = true;
}

void draw()
{
  /*Display menu here*/
  if (!startSim)
  {
    background(0);
    if (!clicks[0])
    {
      textSize(40);
      fill(255);

      text("Greetings and welcome", textX, textY);
      text("to the gravity simulator!", textX, textY + 45);
      text("Click the start button to start", textX, textY+90);
      text("placing your planets and stars!", textX, textY + 135);
      text("Try to make your own solar system!", textX, textY + 250);
      text("Alternately, try one of these fun", textX, textY+330);
      text("premade sims:", textX, textY+365);
      fill(0, 0, 255);
      rect(buttonsStart, textY+390, 100, 50, 7);
      fill(255);
      text("1", buttonsStart+37, textY+430);

      fill(255, 255, 0);
      rect(buttonsStart+1*buttonWidth+1*buttonSpace, textY+390, 100, 50, 7);
      fill(255);
      text("2", buttonsStart+1*buttonWidth+1*buttonSpace+37, textY+430);

      fill(255, 0, 255);
      rect(buttonsStart+2*buttonWidth+2*buttonSpace, textY+390, 100, 50, 7);
      fill(255);
      text("3", buttonsStart+2*buttonWidth+2*buttonSpace+37, textY+430);

      fill(0, 255, 255);
      rect(buttonsStart+3*buttonWidth+3*buttonSpace, textY+390, 100, 50, 7);
      fill(255);
      text("4", buttonsStart+3*buttonWidth+3*buttonSpace+37, textY+430);

      fill(255, 0, 0);
      rect(buttonsStart+4*buttonWidth+4*buttonSpace, textY+390, 100, 50, 7);
      fill(255);
      text("5", buttonsStart+4*buttonWidth+4*buttonSpace+37, textY+430);

      fill(0, 0, 255);

      textSize(20);
      fill(255);
      text("1: A solar system with two planets.", textX, textY+460+10);
      text("2: A solar system with two planets and a moon (no space station).", textX, textY+527-35);
      text("3: A simple binary star system.", textX, textY+552-35);
      text("3: A binary system", textX, textY+577-35);
      text("4: A binary system with two planets.", textX, textY+603-35);
      text("5: A binary system with a planet orbiting the whole binary", textX, textY+627-35);

      if (trails)
        fill(0, 255, 0);
      else
        fill(255, 0, 0);
      rect(textX+260, textY+640, 120, 50, 7);
      fill(255);
      text("Object Paths", textX+260+2, textY+670);

      if (projection)
        fill(0, 255, 0);
      else
        fill(255, 0, 0);
      rect(textX+260+130, textY+640, 155, 50, 7);
      fill(255);
      text("Orbit Prediction", textX+260+130+3, textY+670);
      
      if(!dynamicColoring)
        fill(0,255,0);
      else
        fill(255,0,0);
        
      rect(textX+260+130+165, textY+640, 175, 50, 7);
      fill(255);
      text("Manual Coloring", textX+260+130+165+5,textY+670);
      
      if(CoMtargetting)
        fill(0,255,0);
      else
        fill(255,0,0);
        
     rect(textX+100,textY+640,150,50,7);
     fill(255);
     text("CoM Centering",textX+100+5,textY+670);
     text("Click here to reset to main menu at any time.",textX+10,height-20);
     stroke(255);
     line(textX+9,height-19,0,height);
    
     textSize(25);
     String s = "Toggle options";
     text(s,width/2-textWidth(s)/2,textY+625);
     line(width/2-textWidth(s),textY+630,width/2+textWidth(s),textY+630);
     noStroke();
     fill(0,222,0);
     ellipse(startX,startY,startRad,startRad);
     fill(255);
     text("Start!",startX-startRad/4,startY+10);
    }
    //Philosophy is:
    //0 clicks = menu
    //1 click = choose color
    //2 click = place ball
    //3 clicks = size ball
    //4 clicks = give ball velocity
    //5 clicks = done
    if (clicks[0])
    {
      stroke(255);
      fill(0);
      setBallColor();
      fill(ballColor);
      ellipse(X, Y, ballSize, ballSize);
      fill(255, 0, 0);
      ellipse(width, height, 300, 300);
      fill(255);
      textSize(23);
      text("Start Sim", width-100, height-50);
      fill(0, 0, 255);
      ellipse(0, height, 150, 150);
      fill(255);
      textSize(20);
      text("Reset", 0, height-20);
      displayAllBalls(ballList);
    }
    if(!dynamicColoring && clicks[0] && !clicks[1])
    {
      fill(0);
      rect(0,0,width/2,height);
      fill(255);
      rect(width/2,0,width/2,height);
      fill(255, 0, 0);
      ellipse(width, height, 300, 300);
      fill(255);
      textSize(23);
      text("Start Sim", width-100, height-50);
      fill(0, 0, 255);
      ellipse(0, height, 150, 150);
      fill(255);
      textSize(20);
      text("Reset", 0, height-20);
      text("Select Object Color",textX,textY);
      drawColorWheel();
      colorMode(RGB,255);
    }
    if(dynamicColoring && clicks[0] && !clicks[1])
    {
      clicks[1] = true;
      thisClick = 2;
    }
    if (clicks[1] && !clicks[2])
    {
      colorMode(RGB,255);
      fill(255);
      text("Click where you would like the object to start the simulation.", textX, textY);
      X = mouseX;
      Y = mouseY;
    }
    if (clicks[1] && clicks[2] && !clicks[3])
    {
      fill(255);
      text("Click the up and down buttons to set this object's size/mass", textX, textY);
      fill(0,255,0);
      rect(upButtonX,upButtonY,upButtonWidth,upButtonHeight);
      fill(255,0,0);
      rect(downButtonX,downButtonY,downButtonWidth,downButtonHeight);
      if (mousePressed)
      {
        if (mouseX >= upButtonX && mouseX <= upButtonX+upButtonWidth
         && mouseY >= upButtonY && mouseY <= upButtonY+upButtonHeight)
         {
           ballSize += 1;
         }
         
        if (mouseX >= downButtonX && mouseX <= downButtonX+downButtonWidth
         && mouseY >= downButtonY && mouseY <= downButtonY+downButtonHeight)
        {
         if(ballSize > 1)
           ballSize-= 1;
        }
      }
      setBallColor();
    } 
    if (clicks[1] && clicks[2] && clicks[3])
    {
      fill(255);
      text("Click to determine the velocity this object will start with", textX, textY);
      text("This click will complete the placement of this object in the simulation.", textX, textY+45);
      stroke(255);
      line(mouseX, mouseY, X, Y);
      Vex = (mouseX - X)/10;
      Vey = (mouseY - Y)/10;
      if (projection)
      {
        nSteps = 25;
        ArrayList temp = new ArrayList();
        for (int k = 0; k < ballList.size(); k++)
        {
          thisBall = (Ball)(ballList.get(k));
          temp.add(new Ball(thisBall.xpos, thisBall.ypos, thisBall.xvel, thisBall.yvel, thisBall.col, thisBall.rad, thisBall.mass));
        }
        thisBall = new Ball(X, Y, Vex, Vey, ballColor, ballSize, ballSize*ballSize);
        temp.add(thisBall);
          
        for ( int i = 0; i < 100; i ++)
        {
          for ( int j = 0; j < temp.size(); j ++ )
          {
            thisBall = (Ball)(temp.get(j));
            thisBall.xs[i] = thisBall.xpos;
            thisBall.ys[i] = thisBall.ypos;
            if ( i !=0 )
              line(thisBall.xs[i], thisBall.ys[i], thisBall.xs[i-1], thisBall.ys[i-1]);
          }
          moveAllBalls(temp);
        }

      }
    }
    if (clicks[nClicks-1])
    {
      //User is done placing this ball, move to next one 
      thisBall = new Ball(X, Y, Vex, Vey, ballColor, ballSize, ballSize*ballSize);
      ballList.add(thisBall);
      for ( thisClick = 1; thisClick < nClicks; thisClick ++)
        clicks[thisClick] = false;
      ballColor = color(0,0,255);
      ballSize = 20;
      thisClick = 1;
    }
  }
  else
  {
    background(0);
    if(CoMtargetting)
    {
      CoM = findCoM(ballList);
      pushMatrix();
      translate(width/2-CoM[0], height/2-CoM[1]);
      scale(scaleFactor);
      //   print(CoM[0]+", "+CoM[1]+"\n");
      displayAllBalls(ballList);
  
      popMatrix();
    }
    else
      displayAllBalls(ballList);
    if (dist(mouseX, mouseY, 0, height) < 75)
    {
      //Display quit button.
      noStroke();
      fill(0, 0, 255);
      ellipse(0, height, 150, 150);
      fill(255);
      textSize(20);
      text("Reset", 0, height-20);
    }
    // scale(scaleFactor);
    /*Meat and potatoes really happens here*/
    moveAllBalls(ballList);
  }
}

void setBallColor()
{
 if(!dynamicColoring)
  return;
 if (ballSize <= 20)
    {
      //Small things are white -> red
      ballColor = color(255, 255-(int)map(ballSize*1.0,0.0,20.0,0.0,255.0), 255-(int)map(1.0*ballSize,0.0,20.0,0.0,255.0));
    }
    else if (ballSize > 20 && ballSize<=30)
    {
      //Then red -> blue
      ballColor = color(255-(int)map(ballSize,20,30,0,255),0,(int)map(ballSize,20,30,0,255));
    }
    else if (ballSize > 30 && ballSize <= 45)
    {
      //Then blue -> peach puff
      ballColor = color((int)map(ballSize,30.0,45.0,0.0,255.0),(int)map(ballSize,30.0,45.0,0.0,222.0),255-(int)map(ballSize,30.0,45.0,0.0,82.0));
    }
    else if(ballSize > 45 && ballSize <= 65)
    {
      //then Peach Puff (close to Jupiter Color, 255, 222, 173) -> yellow (255,255,0)
     ballColor = color(255,(int)map(ballSize,35.0,65.0,222.0,255.0),255-(int)map(ballSize,35.0,65.0,173.0,255.0));
    }
    else
      ballColor = color(255,255,0); 
}

//void mouseWheel(MouseEvent e)
//{
//  if (clicks[0] && clicks[1] && clicks[2] && !clicks[3])
//  {
//    if (e.getAmount() > 0)
//    {
//      ballSize += 1;
//    }
//    else
//    {
//      if (ballSize >= 1)
//        ballSize -= 1;
//    }
//    if(!dynamicColoring)
//      return;
//    if (ballSize <= 20)
//    {
//      //Small things are white -> red
//      ballColor = color(255, 255-(int)map(ballSize*1.0,0.0,20.0,0.0,255.0), 255-(int)map(1.0*ballSize,0.0,20.0,0.0,255.0));
//    }
//    else if (ballSize > 20 && ballSize<=30)
//    {
//      //Then red -> blue
//      ballColor = color(255-(int)map(ballSize,20,30,0,255),0,(int)map(ballSize,20,30,0,255));
//    }
//    else if (ballSize > 30 && ballSize <= 45)
//    {
//      //Then blue -> peach puff
//      ballColor = color((int)map(ballSize,30.0,45.0,0.0,255.0),(int)map(ballSize,30.0,45.0,0.0,222.0),255-(int)map(ballSize,30.0,45.0,0.0,82.0));
//    }
//    else if(ballSize > 45 && ballSize <= 65)
//    {
//      //then Peach Puff (close to Jupiter Color, 255, 222, 173) -> yellow (255,255,0)
//     ballColor = color(255,(int)map(ballSize,35.0,65.0,222.0,255.0),255-(int)map(ballSize,35.0,65.0,173.0,255.0));
//    }
//    else
//      ballColor = color(255,255,0);
//  }
//}

void displayAllBalls(ArrayList ballList)
{
  for ( int j =0; j < ballList.size(); j= j + 1 )
    ((Ball)(ballList.get(j))).display();
}

void moveAllBalls(ArrayList ballList)
{
  for ( int j =0; j < ballList.size(); j= j + 1 )
  {
    thisBall = (Ball)(ballList.get(j));
    thisBall.move(ballList);
  }
}

float[] findCoM(ArrayList ballList)
{
  float[] CoM = {
    0, 0
  };
  float mass = 0;
  Ball thisBall;
  for ( int i=0; i< ballList.size(); i++)
  {
    thisBall = (Ball)(ballList.get(i));

    CoM[0] = CoM[0] + thisBall.xpos*thisBall.mass;
    CoM[1] = CoM[1] + thisBall.ypos*thisBall.mass;
    mass = mass + thisBall.mass;
  } 
  CoM[0] = CoM[0]/mass;
  CoM[1] = CoM[1]/mass;

  return CoM;
}

class Ball
{
  float xpos, ypos, xvel, yvel, rad, fric, mass;
  color col;
  float[] xs, ys;
  int x = 0;

  Ball(float xin, float yin, float xvin, float yvin, color col, float rad, float mass)
  {
    xpos = xin;
    ypos = yin;
    xvel = xvin;
    yvel = yvin; 
    this.rad = rad;
    this.col = col;
    this.mass = mass;
    xs = new float[100];
    ys = new float[100];
    for ( x = 0; x < xs.length; x++ )
    {
      //This number is arbitrarily large, so I assume this is an arbitrage.
      xs[x] = -1000000000;
      ys[x] = -1000000000;
    }
    x = 0;
  }

  void display()
  {
    fill(col);
    stroke(0);
    ellipse(xpos, ypos, rad, rad); 
    if (trails)
    {
      stroke(col);
      for (int i = 0; i < 99; i++)
      {
        if (xs[i+1] > -1000000000 && ys[i+1] > -1000000000)
          line(xs[i], ys[i], xs[i+1], ys[i+1]);
      }
    }
  }

  void move(ArrayList ballList)
  {
    Ball otherBall;
    float otherDist, rho, mass;
    float gravityFeltX = 0;//Actually has units of accelleration
    float gravityFeltY = 0;//Actually has units of accelleration
    float gravityFelt = 0;  
    /* if (simNum == 0)
     {
     if ( (xpos > width)|| (xpos <0))
     xvel = -xvel;
     if (ypos > height || (ypos < 0))
     yvel = -yvel;
     }*/

    for ( int i = 0; i < nSteps; i ++ )
    {
      gravityFeltX = 0;//Actually has units of accelleration
      gravityFeltY = 0;//Actually has units of accelleration
      gravityFelt = 0; 

      for ( int j = 0; j < ballList.size(); j++)
      {

        otherBall = (Ball)(ballList.get(j));
        mass = otherBall.mass;
        otherDist = dist(otherBall.xpos, otherBall.ypos, xpos, ypos);
        //If I'm looking at myself just hop to the next one.
        if (otherDist < 0.1)
          continue;

        //Handle balls inside other balls.
        if ( otherDist < otherBall.rad )
          gravityFelt = otherBall.mass/pow(otherBall.rad, 3);
        else
          gravityFelt = otherBall.mass/pow(otherDist, 3);

        gravityFeltX = gravityFeltX +  gravityFelt*(xpos-otherBall.xpos);
        gravityFeltY = gravityFeltY + gravityFelt*(ypos-otherBall.ypos);
      }
      xvel = xvel - gravityFeltX/nSteps;
      yvel = yvel - gravityFeltY/nSteps;
      xpos = xpos + xvel/nSteps;
      ypos = ypos + yvel/nSteps;
    }
    if (trails)
    {
      if (x < 100)
      {
        xs[x] = xpos;
        ys[x] = ypos;
        x++;
      }
      else
      {
        for (int i = 0; i < 99; i ++)
        {
          xs[i] = xs[i+1];
          ys[i] = ys[i+1];
        } 
        xs[99] = xpos;
        ys[99] = ypos;
      }
    }
  }
}

/*This routine is a modified version of code by Lambert Wang*/
void drawColorWheel()
{
  float startFill;
  float startAngle;
  int step;
  float stepLength;
  
  float centerX;
  float centerY;
  
  float pSize;
  float bValue;

  colorMode(HSB, 2*PI, 100, 100);
  ellipseMode(CENTER);
  noStroke();
  
  step = 20;
  centerX = width/2;
  centerY = height/2;
  startFill = 0;
  startAngle = 0;
  stepLength = PI/step;
  
  pSize = 200;
  bValue = 100;
  
  // draw arcs
  for(int i=0; i< 2*step; i++){
  
    fill(startFill, 100, 85);
    arc(centerX, centerY, width-100, width-100, startAngle, startAngle+stepLength);
    
    
   //for(int j=0; j< step; j++){
        fill(startFill, bValue, 100,80);
        stroke(0,0,95,20);
        arc(centerX, centerY, pSize, pSize, startAngle, startAngle+stepLength);
       
       bValue = bValue - 50/step;
       pSize = pSize - 50/step;
 
    //}    
    
    startFill =  startFill + stepLength;
    startAngle = startAngle + stepLength;
    
  }
}


