
PImage bild;

void setup(){
size(800,533);
bild = loadImage("frau.jpg");
frameRate(80);
//image(bild,0,0);
background(0);
}

void draw() {
  noStroke();
 float cs = 80;
  fill(bild.get(mouseX,mouseY));
  int x = int(random(width));
  int y = int(random(height));
  
  ellipse(mouseX,mouseY,random(1,40), random(1,40));
  
}


