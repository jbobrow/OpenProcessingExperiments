
PImage kiwi;
PImage lime;
PImage melon;
PImage orange;
PImage strawberry;
PImage basket;
 
  
void setup() {
  size(600, 400);
  smooth();
   
  kiwi = loadImage("kiwi.png");
  lime = loadImage("lime.png");
  melon = loadImage("melon.png");
  orange = loadImage("orange.png");
  strawberry = loadImage("strawberry.png");
  basket = loadImage("basket.jpg");
   
   
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(255);
  float x = random(width);
  float y = random(height);
  float x2 = random(width);
  float y2 = random(height);
  float x3 = random(width);
  float y3 = random(height);
  float z = random(100, 500);
  float r = random(0, 300);
   
   
  float a = random(100, 300); //kiwi
  float b = random(50, 200); //lime
  float c = random(200, 400); //melon
  float d = random(200, 400); //orange
  float e = random(100, 200); //strawberry
   
  image(basket, 300, 200, width, height);
  image(melon, x2, y2, c, c);
  image(orange, z, y+200, d, d);
  image(kiwi, x3, y3, a, a);
  image(lime, y+100, r, b, b);
  image(strawberry, x, y, e*1.25, e);
   
  
 
 
}


