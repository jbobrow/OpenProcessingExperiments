
/*
Program  Name: My Colorful Mandala
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
 



void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  strokeWeight(2);
  stroke(255);
  fill(0);

fill(mouseX, mouseY, mouseX);
  ellipse(width/2, height/2, 350, 350);
fill(mouseX);
  polygon(width/2, height/2, mouseX/100 + 3, mouseX/8 + 100);
fill(mouseX, mouseX, mouseY);
  polygon(width/2, height/2, mouseX/70 + 3, mouseX/8 + 80); 
fill(0);
  polygon(width/2,height/2, mouseY/100 + 3, mouseY/8 + 80);
  
  if(mousePressed)
  {
   background(pmouseX, pmouseY, pmouseX); 
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
    //    ellipse(x, y, 2, 2);
  }
  endShape(CLOSE);
}


