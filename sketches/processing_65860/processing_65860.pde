
PImage well;
PImage tree;
PImage fish;
PImage lion;

int x = 600;
int y = 300;

float a = 300;
float b = 150;

void setup() {
  size(600, 300);
  smooth();
  frameRate(20);
  imageMode(CENTER);
  rectMode(CENTER);
  
  well = loadImage("1.png");
  tree = loadImage("2.png");
  fish = loadImage("3.png");
  lion = loadImage("4.png");



}
 
void draw() {
  background(0);
  image(well,width/2,height/2,x,y);
 
 if(x <= 2000) {
   x += 20; y+= 15;
 } else {
   fill(0);
   rect(width/2,height/2,width,height);
 }
  
  if(x >= 2000 && a >= width - width * 2.49) {
    image(tree,a,b,600,300);
    a -= 10;
  } 

image(fish,a+width,b,600,300);

image(lion,a+width * 2,b,600,300);

  }
  




