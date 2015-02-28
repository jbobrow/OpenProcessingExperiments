
/*
    Program Name: Polygon's with shaperevolver
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






void setup() {
  size(600, 600);
  smooth();
  frameRate(100);
}


void draw() {
  background(0);
  noFill();
  stroke(255);

  translate(height/2, width/2);
  polygon(0, 0, 10, 200);
  fill(13, 255, 253);
  polygon(0, 0, 9, 200);

  shapeRevolver(0, 0, 12, 200);

  rotate(radians(180));
  strokeWeight(8);
  noFill();
  stroke(249, 250, 33);
  polygon(0, 0, 6, mouseY);

  rotate(radians(360));
  strokeWeight(2);
  noFill();
  stroke(3, 255, 0);
  polygon(mouseX, 0, 2, 200);
 
   rotate(radians(360));
  strokeWeight(9);
  noFill();
  stroke(255,0,0);
  polygon(0, 0, 8, mouseX);
}




void shapeRevolver(int _x, int _y, int sides, float radius) {

  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    pushMatrix();
    translate(x, y);
    rotate(atan2(y - _y, x - _x));
    // draw your shape here
    fill(255, 0, 0);
    rect(0,0,20,20);
    //
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
    line(x, y, _x, _y);
    //    ellipse(x, y, 2, 2);
  }

  endShape(CLOSE);
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i)) * radius;
    float y = _y + cos(radians(i)) * radius;
    vertex(x, y);
  }
}


