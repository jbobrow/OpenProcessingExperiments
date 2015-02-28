
int x = -50; 
int speed = 13;

PImage flower;
PImage rain;

void setup() {
  flower = loadImage("flower.png");
  rain = loadImage("rain.png");
  size(600,600);
  smooth();
  noStroke();
  fill(#E2E744);
  frameRate(30);
}

void draw() {
  background(255);
  ellipse(x,300,100,100);
  ellipse(x,100,100,100);
  ellipse(x,500,100,100);
  ellipse(300,x,100,100);
  ellipse(100,x,100,100);
  ellipse(500,x,100,100);
   x = x + speed;
   if (x >= 650) {
   speed = -13;
   }
  if (x < 0) {
    speed = 13;
  }
  if (mousePressed) {
    image(flower,mouseX,mouseY, 150,150);
    } 
  if (keyPressed) {
    image(rain,mouseX,mouseY, 500,500);
    } 
}



