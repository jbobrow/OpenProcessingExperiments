
/*

Copyright (C) 2010  Omar Zouai

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

int bubbling_Density = 50; // Change This 
void setup() { 
  size(600, 600); 
  smooth(); 
  frameRate(1);
} 

void draw() { 
PlaygonP();
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

  endShape(); 
}
void PlaygonP() {
    background(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  noStroke(); 
  fill(255); 
  translate(width/2, height/2); 
  rotate(radians(random(50)));
  fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, int(random(25)), int(random(100))); 
  rotate(radians(random(50))); 
  fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, 5, int(random(250))); 
  rotate(radians(random(50))); 
  fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, 8, int(random(250))); 
  rotate(radians(random(50))); 
  fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, 7, int(random(250))); 
  rotate(radians(random(50))); 
  fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, 3, int(random(250))); 
 rotate(radians(random(50))); 
 fill(int(random(255)), int(random(255)) , int(random(255)) , 125); 
  polygon(0, 0, 8, int(random(250)));
  
}
void keyPressed() {
  if(key == 'f') {
    frameRate(1);
  }
  if(key == 's') {
    frameRate(9999999);
  }
}

