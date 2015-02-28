
/*
    Program Name: Hover
    Version: 1.0

    Copyright (C) <year>  <name of author>

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

color bgcolor = color(255, 255, 255);
color drawColor = color( 255, 255, 255);
void setup() {
  size (800,800);
}



void draw() {
  background(0); // background color
  smooth();
  Hover(width / 2, height / 3); // draw character
  stroke(4);

  if ( mousePressed == true ) {
    if (mouseButton == LEFT) {
      background(0);
      Hover(mouseX, mouseY);
    }
  }
}
void mouseDragged() {
  background(0);
  drawColor = color( random(255), random(255), random(255) );
  stroke (drawColor);
  strokeWeight(4);
  Hover(mouseX, mouseY);
}


// character function
void Hover(int x_pos, int y_pos)
{
  float x_size = width / 2;
  float y_size = height / 2;
  float hoverspeed;
  if (mousePressed) {
    hoverspeed = 0.4;
  }
  else {
    hoverspeed = 0.1;
  } 

  fill(255);
  ellipse(x_pos, y_pos + 132, x_size / 4, y_size / 4); // body
  ellipse(x_pos + 82, y_pos + 140, x_size / 6.3, y_size / 2.9); // right hand
  ellipse(x_pos - 82, y_pos + 140, x_size / 6.3, y_size / 2.9); // left hand

  line(x_pos - 15,y_pos + 80, x_pos - 15, y_pos + 180); // cross 1
  line(x_pos - 50,y_pos + 120, x_pos + 50, y_pos + 120); // cross 2

  head(x_pos, y_pos, x_size);
  eye(x_pos + 25, y_pos + 5, 100 );
  eye(x_pos - 30, y_pos + 5, 100 ); 
  hoverRing(x_pos, y_pos + 217 + (sin(frameCount * hoverspeed) * 10.5), 200);
  hoverRing(x_pos, y_pos + 255 + (sin(frameCount * hoverspeed) * 10), 150);
  hoverBall(x_pos, y_pos + 290, 16);
}

void head(float x, float y, float scale) {
  ellipse(x, y, scale / 2.4, scale / 2.4); // head
}

void eye(float x, float y, float scale) {

  float angle = atan2(mouseY-y, mouseX-x);

  float eye_distance = 5;

  fill(255);
  ellipse(x, y, 40, 100); // eye
  //  fill(0);
  //  ellipse(x, y + 5, 40, 60); // eyeball


  pushMatrix();
  translate(x, y+2);
  rotate(angle);
  fill(0);
  ellipse(eye_distance, 0, 32, 32); // pupil
  popMatrix();
}


void hoverRing(float x, float y, float scale)
{
  fill(255);
  ellipse(x, y, scale / 2, scale / 6);  // hover ring 1
  fill(0);
  ellipse(x, y, scale / 8, scale / 24); // inner ring 1
}

void hoverBall(int x, int y, float scale) {
  fill(255);
  ellipse(x, y, scale, scale); // ball
}

void mousePressed() {
  println (mouseX + " " + mouseY);
}


