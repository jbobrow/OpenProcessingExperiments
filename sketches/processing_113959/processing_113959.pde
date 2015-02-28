

PImage a;
PImage b;

void setup(){
  size(600,600);
  rectMode(CENTER);
  noStroke();

a= loadImage("001.JPEG");
imageMode(CENTER);
noCursor();
b= loadImage("003.JPEG");



}

void draw(){
  background(192);
  if (mouseY > 100){
  image(a, width-mouseX, height-mouseY, a.width/5, a.height/5);
  }
  image(b, mouseX, mouseY, b.width/3, b.height/3);

}
