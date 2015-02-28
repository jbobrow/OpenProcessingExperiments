
PImage sanic;
float i;
float r;
float x, y;
float size;
color c;
import ddf.minim.*;
Minim minim;
AudioSample spook;

void setup() {
  size(700, 700);
  sanic = loadImage("sanic.jpg");
  imageMode(CENTER);
  minim = new Minim(this);
  spook=minim.loadSample("spook.mp3");
  spook.trigger();
}

void draw() {
  //background(0);
  translate(width/2, height/2);
  rotate(i);
  i+=0.1;
  image(sanic, r, r);
  r+=random(-i, i);
  rotate(i);
  image(sanic, 300, 300);
  image(sanic, -300, -300);
  image(sanic, 300, -300);
  image(sanic, -300, 300);
  for (int i=0; i<5; i++) {
    x=random(width);
    y=random(height);
    c=color(random(256), random(256), random(256));
    size=random(10, 50);
    textSize(size);
    fill(c);
    text("Gotta go fast", x, y);
  }
}



