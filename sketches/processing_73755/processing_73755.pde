
//#Blood Flower sketch
//#Copyright, 2012, Arcc.cc

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//This program is distributed in the hope that it will be useful or entertaining,
//but WITHOUT ANY WARRANTY FOR EITHER; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//For a copy of the GPLv3 see <http://www.gnu.org/licenses/gpl.txt>.

void setup(){
   colorMode(HSB,100,100,100) ; 
   size(300, 300);  
   background(0);
}

boolean started = false;
float r = 40;
float speed = 0.04;
float angle;
int aVal = 35;
int xVal = 40;
int yVal = 80;
int zVal = 100;
float mA;
float mY;
float mX;


void draw()
{
  frameRate=50;
  if(started == true)
    {
     translate(150,150);
     smooth();
      angle += speed;
      float sinval = sin(angle);
      mA = sinval * r + aVal; 
      mX = sinval * r + xVal;
      mY = sinval * r + yVal;
      float mZ = sinval * r + zVal;

    for(int i=1; i<1080; i++)
    {
     flowerFunc(i,pow(mX, 1.3),pow(mY, 1.3),mZ,pow(mZ, 0.9),pow(i, 0.9)); 
     rotate(aVal);
     fill(0);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) 
      {
        zVal++;
        background(0);
      } 
      else if (keyCode == DOWN) 
      {
        zVal--;
        background(0);
      }
      else if (keyCode == LEFT)
      {
        aVal--;
        background(0);
      }
      else if (keyCode == RIGHT)
      {
        aVal++;
        background(0);
      }
    }
  }


void mousePressed() {
    if (started==true)
      {
        started=false;
        background(0);
      }
    else
      {started=true;}
    
}

void flowerFunc(float x1, float y1, float x2, float y2, float x3, float y3){
  beginShape();
  stroke(0);
  strokeWeight(0.1);
  vertex(x1,y1);
  vertex(x2,y2);
  vertex(x3,y3);
  fill(0,100,100,10);
  endShape();
}


