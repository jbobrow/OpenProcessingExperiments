
void setup (){
  size (250,250);
  background (0,150);
  smooth();
}

float a = 0;     //// <-- pieces of code inspired by Evan Winland-Gaetz's "Motion Type 1"
float b = 0;
float c = 0;
float d = 0;
float e = 0;
float f = 0;
float y = 50.0;
float speed = 1.0;

void draw(){
  fill(0, 20);
  rect(-20, -20, 300, 300);
  //
  PFont font;
  font = loadFont("Gulim-48.vlw");
  textFont(font);
  textSize(45);
  //
  a += 1.5;
  b += 2.2;
  c += 1.8;
  d += 2.1;
  e += 1.7;
  f += 2.3;
  y += speed;
  //
  fill(225, 255,193, a);
  text("L", mouseX, mouseY);
  fill(225,255,193, a);
  text("5", mouseX+10, mouseY+14);
  fill(225,255,193, a);
  text("B", mouseX+23, mouseY+22);
  fill(225,255,193, a);
  text("1", mouseX+42, mouseY+30);
  fill(225,255,193, a);
  text("R", mouseX+55, mouseY+41);
  fill(225,255,193, a);
  text("6", mouseX+70, mouseY+53);
 
  if(a > 250) {
    a = 0;
  }
  if(b > 250) {
    b = 0;
  }
  if(c > 250) {
    c = 0;
  }
  if(d > 250) {
    d = 0;
  }
  if(e > 250) {
    e = 0;
  }
  if(f > 250) {
    f = 0;
  }
  if(y > height+a) {
    y = - a;
  }
}

