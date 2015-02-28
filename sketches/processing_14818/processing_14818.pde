
/*

 Crazy Mandal-move the mouse to control the picture
    Copyright (C) 2010  Koby Kayden

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
  rectMode(CENTER);
}

void draw() { 
  background(25, 41, 17);
  noStroke();
  fill(0);





  polygon(width/2, height/2, 100, 100);  
  noFill();
  stroke(250, 80, 40);
  polygon(width/2, height/2, 200, 200);
  noFill();
  stroke(0, 0, 255);
  polygon(width/2, height/2, 300, 300);
  noFill();
  stroke(0, 255, 0);
  polygon(width/2, height/2, 250, 250);
  
  
  
  strokeWeight(8);
  stroke(255, 0, 0);
  
  
  rect(mouseX, mouseY, width/2, height/2);
  
  line(600, 1, mouseX, mouseY);
  line(1, 600, mouseX, mouseY);
  line(300, 600, mouseX, mouseY);
  line(600, 300, mouseX, mouseY);
  strokeWeight(5);

  translate(width/2, height/2);
  
 
  
  
  
  
  }  



void polygon(int _x, int _y, int sides, float radius) {

  if (sides <= 0)
    sides = 1;

  beginShape();
  for ( int i = 0; i < 360; i += (360 / sides) ) {
    float x = _x + sin(radians(i-mouseX)) * radius;
    float y = _y + cos(radians(i-mouseY)) * radius;
    vertex(x, y);
    //    ellipse(x, y, 2, 2);
  }
  endShape();
}



