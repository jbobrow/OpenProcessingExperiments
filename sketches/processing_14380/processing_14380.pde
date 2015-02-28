
/*
Program  Name: weird clock dude
Version: 1.0

Copyright (C) 2010, Oscar Bao

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


void setup()
{
  size(480, 480);
  smooth();
}
float handY= 0;

void draw()
{
  background(0);
  face( width/2, height/2 );
}

void face( float l, float r)
{
  
  
  strokeWeight(20);
  stroke(0, 0, 255);
  fill(255);  
  ellipse( l, r, 300, 300);

  strokeWeight(0);
  stroke(0);
  ellipse( l - 55, r - 50, 40, 40);
  ellipse( l + 55, r - 50, 40, 40);
  fill(0);
  lefteye( l - 55, r - 50 );
  righteye( l + 55, r - 50);



fill(255);
strokeWeight(5);
  smile(width/2 - 30, height/2 + 50, width/2 + 30, height/2 + 50);
 strokeWeight(10);
  shorthand( width/2, height/2);
  longhand(width/2, height/2);

}

void lefteye( float x, float y)
{
if(mousePressed)
  {
line( x-18, y, x+18, y);
    }
    else
    {
      ellipse( x, y, 20, 20);
    }
}

void righteye( float x, float y)
{
  ellipse( x, y, 20, 20);
  
}

void shorthand( float x, float y)
{

  pushMatrix();
  translate(width/2, height/2);
  rotate(mouseX/40);
  if ( mouseX > 0)
  {
    line (0, 0, 5,  - 55);
  }
  else
  {
     line (0, 0, - 50,+ 10);
  }
  popMatrix();
}


void longhand( float x, float y)
{
  pushMatrix();
  translate(width/2, height/2);
  rotate(mouseX/10);
  if( mouseX > width/2)
  {
    line(0, 0,  + 120,  - 10);
  }
  else
  {
    line(0, 0, - 10, - 100);
  }
  popMatrix();
}


void smile(float a, float b, float c, float d)
{


   if(mouseX> width/2)
   {
   bezier(width/2 - 65, height/2 + 75, a, b, c, d, width/2 + 65, height/2 + 75);
  line(width/2 - 40, height/2 - 60, width/2 - 80, height/2 - 85);  
  line(width/2 + 40, height/2 - 60, width/2 + 80, height/2 - 85);
 }
   else
   {
    bezier(width/2 - 65, height/2 + 20, a, b, c, d, width/2 + 65, height/2 + 20); 
    line(width/2 - 40, height/2 - 75, width/2 - 80, height/2 - 65);
    line(width/2 + 40, height/2 - 75, width/2 + 80, height/2 - 65);
   }
} 




