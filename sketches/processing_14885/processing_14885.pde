
/*
Program Name: Crazy Boxes
Version: V 1.0


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
Also add information on how to contact you by electronic and paper mail.



*/




int rx = 50;
int ry = 50;
int gx = 100;
int gy = 100;
int bx = 150;
int by = 150;
boolean r = false;
boolean g = false;
boolean b = false;

void setup() {
  size(640, 480);
}
void draw() {
  

  background(255);
  fill(255, 0, 0, 75);
  rect(rx, ry, 50, 50);
  fill(0, 255, 0, 75);
  rect(gx, gy, 50, 50);
  fill(0, 0, 255, 75);
  rect(bx, by, 50, 50);
      if (abs(rx - gx) < 50 &&
      abs(ry - gy) < 50) {
    gx += random(-5, 5);
    gy += random(-5, 5);
  }
        if (abs(rx - bx) < 50 &&
      abs(ry - by) < 50) {
    bx += random(-5, 5);
    by += random(-5, 5);
  }
        if (abs(gx - rx) < 50 &&
      abs(gy - ry) < 50) {
    rx += random(-5, 5);
    ry += random(-5, 5);
  }
          if (abs(gx - bx) < 50 &&
      abs(gy - by) < 50) {
    bx += random(-5, 5);
    by += random(-5, 5);
  }
            if (abs(bx - rx) < 50 &&
      abs(by - ry) < 50) {
    rx += random(-5, 5);
    ry += random(-5, 5);
  }
              if (abs(bx - gx) < 50 &&
      abs(by - gy) < 50) {
    gx += random(-5, 5);
    gy += random(-5, 5);
  }
  if(rx + 50 < 0) {
    rx = width/2;
    ry = height/2;
  }
  if(rx > width) {
    rx = width/2;
    ry = height/2;
  }
  if(ry + 50 < 0) {
    rx = width/2;
    ry = height/2;
  }
  if(ry > height) {
    rx = width/2;
    ry = height/2;
  }
    if(gx + 50 < 0) {
    gx = width/2;
    gy = height/2;
  }
  if(gx > width) {
    gx = width/2;
    gy = height/2;
  }
  if(gy + 50 < 0) {
    rx = width/2;
    ry = height/2;
  }
  if(gy > height) {
    gx = width/2;
    gy = height/2;
  }
    if(bx + 50 < 0) {
    bx = width/2;
    by = height/2;
  }
  if(bx > width) {
    bx = width/2;
    by = height/2;
  }
  if(by + 50 < 0) {
    bx = width/2;
    by = height/2;
  }
  if(by > height) {
    bx = width/2;
    by = height/2;
  }

  

}

void mouseDragged() {
  if(mouseX > rx && mouseX < (rx + 50) && mouseY > ry && mouseY < (ry + 50) && g == false && b == false && r == false){
  r = true;
  g = false;
  b = false;
  }
  if(r == true) {
    rx = mouseX;
    ry = mouseY;
  }
    if(mouseX > gx && mouseX < (gx + 50) && mouseY > gy && mouseY < (gy + 50) && g == false && b == false && r == false){
  g = true;
  r = false;
  b = false;
  
  }
  if(g == true) {
    gx = mouseX;
    gy = mouseY;
  }
      if(mouseX > bx && mouseX < (bx + 50) && mouseY > by && mouseY < (by + 50) && g == false && b == false && r == false){
  g = false;
  r = false;
  b = true;
  
  }
  if(b == true) {
    bx = mouseX;
    by = mouseY;
  }

}
void mouseReleased() {
  g = false;
  r = false;
  b = false;
}
void bounce(String as, String sa){
if(as == "rx") {
  if(sa == "gx") {
    int dx = int(random(180));
    int dy = int(random(180));
    if (abs(mouseX - gx) < 50 &&
      abs(mouseY - gy) < 50) {
    gx += random(-5, 5);
    gy += random(-5, 5);
  }

    }
  }
}


      



