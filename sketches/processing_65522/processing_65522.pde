
PImage trunks;
PImage forest;
PImage deer;
PImage cow;
PImage clouds;

 
void setup() {
  size(600, 400);
  smooth();
  
  trunks = loadImage("trunks.jpg");
  forest = loadImage("forest.jpg");
  deer = loadImage("deer.jpg");
  cow = loadImage("cow.jpg");
  clouds = loadImage("clouds.jpg");
  
  
  
  frameRate(1);
  imageMode(CENTER);
}
 
void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float z = random(100, 500);
  float q = random(0, 300);
  
  
  float a = random(100, 600); //trunks
  float b = random(100, 500); //forest
  float c = random(100, 300); //deer
  float d = random(100, 400); //cow
  float e = random(600, 950); //clouds
  if (a>300) {
    b = random(100, 300);
    c = random(100, 150);
    d = random(150, 400);
  } else {
    b = random(300, 500);
    c = random(150, 300);
    d = random(100, 150);
  }
  
  
  tint(255, 190);
  
  image(clouds, 300, 200, e, e);
  image(trunks, x, y, a, a);
  image(forest, y+100, q, b, b);
  image(deer, q, z-50, c, c);
  image(cow, z, y+200, d, d);
  
 


}

