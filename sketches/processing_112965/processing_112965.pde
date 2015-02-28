
PImage cat;
PImage kitty;
PImage hamburger;
PImage me;
PImage coffee;
 
void setup() {
  size(600, 600);
  cat = loadImage("123.png");
  kitty = loadImage("kitty.png");
  hamburger = loadImage("hamburger.png");
  me = loadImage("me.jpg");
  coffee = loadImage("coffee.png");
  frameRate(random(1,3.6));
  imageMode(CENTER);
}
 
void draw() {
  background(255);
  float x = random(width);
  float y = random(height);
  float a = random(width/3);
  float b = random(height/3);
  float c = random(200, 450);
  float d = random(100, 225);
  image(me,width/2,height/2,600,500);
  image(cat, a, b, c, c);
  image(kitty, y, c, a, a);
  image(hamburger, c, a, b, b);
  image(coffee, y, a, d, d);
  
}



