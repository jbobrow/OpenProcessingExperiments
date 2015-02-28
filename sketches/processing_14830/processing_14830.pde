

/*  Program Verison: 1.0
    Copyright (C) 2010  Andrew Hayes Montoya
 
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

void setup() {
  size(850, 850);
  smooth();
  frameRate(10);
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  fill(41,78,255);
  strokeWeight(0);
  translate(width/2,height/2);
  
  
  fill(127,234,85); 
  shapeRevolver(0,0,8,100); 
  fill(221,11,222);
  shapeRevolver(0,0,18,10);
  noFill();
  polygon(0,0, 100, 100);
  polygon(0,0,5,120);
  polygon(0,0,15,150);
  polygon(0,0,65,220);
  polygon(0,0,5,100);
  polygon(0,0,25,200); 
  polygon(0,0,8,35); 
  fill(235,250,10);
  shapeRevolver(0,0,8,120);
  
  if(mousePressed) {
    background(255);
  }
}



void shapeRevolver(int _x, int _y, int sides, float radius) {
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i+mouseX)) * radius;
    float y = _y + cos(radians(i+mouseY)) * radius;
    pushMatrix();
    translate(x, y);
    rotate(atan2(y-_y, x-_x));
    polygon(0,0,10,15);
    rect(0,0,6,225);

    popMatrix();
  }
 }

void polygon(int _x, int _y, int sides, float radius) {

  if (sides <= 0)
    sides = 1;

  beginShape();
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    vertex(x, y);
  }
  endShape(CLOSE);


  beginShape();
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    vertex(x, y);
  }
  endShape();



  beginShape();
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    vertex(x, y);
  }
  endShape();
}





