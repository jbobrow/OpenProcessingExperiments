
int x;
PFont BauhausFont;
PImage smile;

void setup(){
  size(600,600);
  x=0;
  BauhausFont= loadFont("Bauhaus93-48.vlw");
  smile= loadImage("Smile.jpg");
}
void draw(){
  tint(random(100),random(100),100);
  image(smile, mouseX,mouseY,150,150);
  fill(0);
  text("hello", 300,300,100);
  fill(0,random(250),random(176),random(15));
  textFont(BauhausFont);
  text("hello", random(100),random(176));
  text("hello",mouseX,mouseY);
}

