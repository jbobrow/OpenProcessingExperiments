
PImage man,dog;

void setup() {
  frameRate(1000000000);
  size(300,300);
  man = loadImage("man.jpg");
  dog = loadImage("bulldog.jpg");
  background(0);
  smooth();
  image(man,0,0);
}

void draw() {
  
  int x = int(random(dog.width));
  int y = int(random(dog.height));
  int loc = x + y*dog.width;
  
  loadPixels();
  float r = red(dog.pixels[loc]);
  float g = green(dog.pixels[loc]);
  float b = blue(dog.pixels[loc]);
  
  noStroke();
  fill(r,g,b,100);
  rect(x,y,10,3); 
}


