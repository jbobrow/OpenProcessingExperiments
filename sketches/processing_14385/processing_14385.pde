
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


void setup ()
{
  size(400,400);
  smooth();
  frameRate(100);
  noCursor();
  strokeWeight(55);
  stroke(100,75);
  
}

void draw()
{
  background(0);
  
  rubie(mouseX,mouseY);
}

void rubie(int x_pos, int y_pos) {
 
 
  pushMatrix();
  if(mousePressed == false) {
  fill(255);
  }
  
  else {
  fill(0);
  }
  rect(x_pos,y_pos,150,150); //head
  

  if (keyPressed == false) {
    if (key != 'b') {
      eye(x_pos + 20, y_pos+10);
    }
  }
  eye(x_pos + 95, y_pos+10);
  noFill();
  if(keyPressed){
    if (key == 'a') {
      fill(245,0,0);
      rect(x_pos+20, y_pos+10, 35, 10);
      fill(255,0,255);
      rect(x_pos + 20, y_pos+30, 35, 10);
    }
  
  
  }
  
 
  mouth(x_pos , y_pos + 10);
  nose(x_pos, y_pos);
 
 
  popMatrix();
}


void mouth (int x, int y){
   if (mousePressed) {
    fill(255);
  }
  else {
    fill(33,185,60);
  }
  for (int i = 0; i < 10; i = i+1) {
    rect((x+20)+(i * 11), (y+95),15,15); //mouth
  } 
}


void eye(int x, int y) {
  
  fill(245,0,0);
  rect(x, y, 35, 10); // eyebrow
  
  if (mousePressed == false) {
    fill(239,255,25);
    rect(x, y+14, 35, 35); // eye   
  
  fill(2,22,202); 
  rect(x + 8,y + 22,20,20); // eye inside 
  }
  
  else {
    fill(255,255,0);
    rect(x, y+21, 35, 10);
    noFill();
  }
  
}

void nose(int x, int y) {
  
  if(mousePressed == false) {
    fill(255,90,23);
    rect(x+65,y+65,20,20);
    noFill();
  } 
  else {
    fill(255,90,23);  
    ellipse(x+75,y+75,27,27);
    noFill();
  }
}


