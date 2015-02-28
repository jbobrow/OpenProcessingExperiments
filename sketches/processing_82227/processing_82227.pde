
import processing.video.*;

int beat = 0;
Movie x;
Movie y;
Movie bass;
Movie dub;
int a;
int b;
int c;
int d;

void setup(){
  size(200, 200);
  x = new Movie (this, "01.wav");
  y = new Movie (this, "02.wav");
  bass = new Movie (this, "Bass.wav");
  dub = new Movie (this, "dup.wav");
  background(0);
  ellipse(0.3*width, 0.3*height, 50 + a, 50 + a);
  ellipse(0.7*width, 0.3*height, 50 + b, 50 + b);
  ellipse(0.5*width, 0.7*height, 50 + c, 50 + c);
  ellipse(0.5*width, 0.45*height, 30 + d, 30 + d);
}

void draw(){
  
  background(0);
  ellipse(0.3*width, 0.3*height, 50 + a, 50 + a);
  ellipse(0.7*width, 0.3*height, 50 + b, 50 + b);
  ellipse(0.5*width, 0.7*height, 50 + c, 50 + c);
  ellipse(0.5*width, 0.45*height, 30 + d, 30 + d);
  
  smooth();
  noStroke();
  fill(200);
  
 float x1 = dist(mouseX, mouseY, 0.3*width, 0.3*height);
 if(x1 < 25){
  x.play();
  a = 5;
}
if(x1 > 25){
  x.stop();
  a= 0;
}
float y1 = dist(mouseX, mouseY, 0.7*width, 0.3*height);
 if(y1 < 25){
  y.play();
  b = 5;
}
if(y1 > 25){
  y.stop();
  b = 0;
}
float bass1 = dist(mouseX, mouseY, 0.5*width, 0.7*height);
 if(bass1 < 25){
  bass.play();
  c = 5;
}
if(bass1 > 25){
  bass.stop();
  c = 0;
}
float dub1 = dist(mouseX, mouseY, 0.5*width, 0.45*height);
 if(dub1 < 15){
  dub.play();
  d = 3;
}
if(dub1 > 15){
  dub.stop();
  d = 0;
}
}




