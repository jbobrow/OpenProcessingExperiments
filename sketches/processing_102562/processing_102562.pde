
PImage img;
PImage emg;
PImage sac;
PImage ben;
float x,y;
float rot;
void setup(){
  size(1280,800);
  background(0,255);
  img = loadImage("boat.png");
  emg = loadImage("mgz.png");
  sac = loadImage("rzb.png");
  ben = loadImage("botaing.png");
  x = 0.0f;
  y = width/2.0f;
  rot = 0.0f;
}

void draw(){
  
  tint (255,mouseY,mouseX);
  translate(x,y);
  rotate(rot);
  image(img,random(500),random(300));
  x += 1.0;
  rot += 0.01;
  if (X > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rot);
  image(emg,0,0);
  x += 1.0;
  rot += 0.01;
  if (x > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rot);
  image(sac,random(500),random(300));
  x += 1.0;
  rot += 0.01;
  if (x > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rot);
  image(ben,0,0);
  x += 1.0;
  rot += 0.01;
  if (x > width) {
    x = 0;
  }

}

void mousePressed() {
  background(pmouseX,pmouseY);
  image(emg,pmouseX,pmouseY);
  image(img,pmouseX,pmouseY);
 }



