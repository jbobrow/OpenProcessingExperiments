
/*

Lamarck Society Sketch Pad - Beta Version 1.0
daniel@lamarcksociety.com
http://www.lamarcksociety.com
June 2009

*/

PImage pad;
PImage francis;
PImage dan;
PImage joe;
PImage ahmed;
PImage ryan;


void setup() {
  size(900,630);
  pad = loadImage("sketch_pad2.jpg");
  background(pad);
}

void draw(){
  smooth();
  stroke(200,0,50,240);
  strokeWeight(5);
  if(mousePressed) {
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if(keyPressed) {
    if (key == 'f' || key == 'F') 
    {
      francis = loadImage("fl_head.png");
      imageMode(CENTER);
      image(francis,mouseX,mouseY,132,144);
      }
    }
   if(keyPressed) {
    if (key == 'd' || key == 'D') 
    {
      dan = loadImage("dv_head.png");
      imageMode(CENTER);
      image(dan,mouseX,mouseY,110,158);
      }
    }
    if(keyPressed) {
    if (key == 'j' || key == 'J') 
    {
      joe = loadImage("jl_head.png");
      imageMode(CENTER);
      image(joe,mouseX,mouseY,92,142);
      }
    }
     if(keyPressed) {
    if (key == 'a' || key == 'A') 
    {
      ahmed = loadImage("ae_head.png");
      imageMode(CENTER);
      image(ahmed,mouseX,mouseY,103,154);
      }
    }
    if(keyPressed) {
    if (key == 'r' || key == 'R') 
    {
      ryan = loadImage("rd_head.png");
      imageMode(CENTER);
      image(ryan,mouseX,mouseY,118,153);
      }
    }
}


