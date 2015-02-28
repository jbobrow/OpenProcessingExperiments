
//#Fading Crosses sketch
//#Copyright, 2012, Arcc.cc

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//For a copy of the GPLv3 see <http://www.gnu.org/licenses/gpl.txt>.

//#setting height 
float halfWidth;
float halfHeight;
void setup()
{
  size(300,300);
  halfWidth = width/2;
  halfHeight = height/2;
}


void draw()
{
  //#define variables for and randomise the frame rate
  float fr;
  fr = random(6,50);
  frameRate(fr);
  
  //#translate to the centre and turn on smoothing
  translate(halfWidth,halfHeight);
  smooth();
  
  //#define and randomise variables
  float st1 = random(30);
  float st2 = random(30);
  float st3 = random(30);
  float x1 = random(-halfWidth/1.2,halfWidth/1.2);
  float y1 = random(-halfHeight/1.2,halfHeight/1.2);
  float x2 = random(-halfWidth/1.2,halfWidth/1.2);
  float y2 = random(-halfHeight/1.2,halfHeight/1.2);
  
  //#Draw a semi-opaque rectangle thats edges are just out of bounds so that the crosses fade
  for (int p=0; p<1; p++)
  {
    rect(-halfWidth-25,-halfHeight-25,width+50,height+50);
    fill(0,50);
  }
  
  //#Follow the mouse...
  //translate(mouseX-halfWidth,mouseY-halfHeight);
    
  //#probability code for first cross
  if(random(100)>70)
  {
    cross(x1,y1,st1 ,st1/3);
  }
      
  //#probability code for second cross
  if(random(100)<30)
  {
    cross(x2,y2,st2 ,st2/3);    
  }
}

//#function for drawing crosses
void cross(float crossX, float crossY, float crossSize, float crossWidth)
{
  translate(crossX, crossY);
  strokeWeight(crossWidth);
  stroke(255);
  line(crossSize,crossSize,crossSize,crossSize-crossSize);
  line(crossSize/2,crossSize/2,crossSize*1.5,crossSize/2);
}

