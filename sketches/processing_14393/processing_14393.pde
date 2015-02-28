
/*
    Program Name: High
    Version: 1.0

    Copyright (C) < 2010 >  < Odgerel >

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



float t = 0.0;

 void setup() 
{
  size(600, 800); 
  frameRate(-100);
  smooth();
  strokeWeight(2.5);
}

 void draw()
{
  float xoff = t;

  background(19, 6, 211);

  for (int i = 0; i < width; i++) {
    stroke(237, 64, 55);
    strokeWeight(2);
    float y1 = noise(xoff)*height;
    float y2 = noise(xoff+0.01)*height;
    line(i,y1,i+1,y2);

    xoff += 0.01;
  }
  t+= 0.01;

  face( width/2, height/2, 160 );
  body(width/2, height/2 + 100);
  leg(width/2, height/2 + 200);
  arm(width/2, height/2 + 100);
}

 void face( float x, float y, float size )

{
  fill(211, 177, 81);
  stroke(0);
  ellipse(x, y, size, size);
  eye(x - 50,  y, 20 );
  eye(x + 40,  y, 60 );
  for (int i = 0; i < 18; i+=2) 
  {
    hair( x + i * 3 - 30, y - 50, 50, i * 0.8 );
  }

  nose(x, y, 25);
  mouth(x, y + 40, 20);
}

 void nose( float x, float y, float size )
{
  fill(0);
  stroke(0); 
  rect(x - 15, y + 8, size/3, size/5);
}

 void mouth(float x, float y, float size)
{
  if(mousePressed)
  {
    stroke(0);
  }
  else
  {
    stroke(247,55,45);
  }
  rect(x - 15,y, size, size/2);
}

 void hair(float x, float y, float len, float craziness )
{
  fill(255);
  stroke(44, 14, 12);
  beginShape();
  vertex(x, y);
  vertex(x + craziness + 20, y - len);
  endShape();
}



 
 void eye(float x, float y, float size) {


  float angle = atan2(mouseY-y, mouseX-x);


  pushMatrix();
  translate(x, y);   
  if(mousePressed)
  {
    fill(255, 5, 5);
    ellipse(0, 0, size, 5);
    scale(1,0.2);
    rotate(angle);
    fill(0);
    ellipse(8, 0, 4, 4);
  }
  else
  {

    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(0);
    ellipse(size/4, 0, 4, 4);
  }
  popMatrix();
}





 void body(float x, float y)

{
  pushMatrix();
  translate(x, y);
  stroke(0);
  fill(146, 183, 79);
  rectMode(CENTER);
  rect(0.5,31.9,50,100);
  popMatrix();
}

 void arm(float x, float y)
{
  fill(255, 255, 255);
  line(x+20, y, x+50, y+100);
  line(x-20, y, x-50, y+100);  
}


 void leg(float x, float y)
{
  pushMatrix();
  translate(x, y);
  fill(0);
  stroke(10, 9, 8);
  line(20, -23, 65, 80);
  line(-20, -23, -65, 80);
  popMatrix();
}
void mousePressed() {
   println("Hyphy!");
}




