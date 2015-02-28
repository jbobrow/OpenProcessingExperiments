
 PImage bold;


void setup() {
  size(1000,1000);
  bold = loadImage("bald460x276.jpg");
}


void draw(){
  tint(255,255,255,150);
  image(bold,250,250);
  stroke(random(0-255),random(0-255),random(0-255),100);
  strokeWeight(5);
  line(mouseX,mouseY,random(0-1000),random(0-1000));
  fill(random(0-255),random(0-255),random(0-255));
  ellipse(mouseX,mouseY,10,10);
  

}

