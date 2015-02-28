
import processing.opengl.*;

PShape checker;
float i, j, temp;
int SCALE = 50;
float STEPS = 5000.0;

void setup() {
  size(640,480);
  smooth();
  checker = loadShape("checker1.svg");
  i=0;
  j=0;
  temp=0;
} 

void draw(){
  if (i>STEPS) {i=0;}
  if (j>STEPS) {i=0;}
  background(255);
  translate((width/2),(height/2));
  temp=(i/STEPS)*360.0;
  rotate(radians(temp));
  shape(checker, (-10*SCALE)-(1*SCALE), (-10*SCALE)-(1*SCALE),20*SCALE,20*SCALE);
  rotate(-radians(temp));
  i=i+1;
  temp=radians((j/STEPS)*360.0);
  rotate(-temp);
  shape(checker, (-10*SCALE)-(1*SCALE), (-10*SCALE)-(1*SCALE),20*SCALE,20*SCALE);
  j=j+1;
}


