
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
}
 
void draw() {
  background(0);
  well = loadImage("1.png");
  image(well,width/2,height/2,x,y);
 
 if(x <= 2000) {
   x += 300; y+=300;
 } else {
   fill(0);
   rect(width/2,height/2,width,height);
 }
  
  if(x >= 2000 && a >= width - width * 2.4) {
    tree = loadImage("2.png");
    image(tree,a,b,600,300);
    a -= 100;
  } 
    

fish = loadImage("3.png");
image(fish,a+width,b,600,300);

lion = loadImage("4.png");
image(lion,a+width * 2,b,600,300);

  }
  




