
PImage cat1; // 300 x 300
PImage cat2;
PImage cat3;
PImage cat4; 
PImage cat5;

void setup () {
  size (600, 600);
  imageMode (CENTER);
  cat1 = loadImage ("cat1.png");
  cat2 = loadImage ("cat2.png");
  cat3 = loadImage ("cat3.png");
  cat4 = loadImage ("cat4.png");
  cat5 = loadImage ("cat5.png");
  frameRate (1.5);
}
 
void draw () {
  background (255);
  
  
  float a = random (10, 120);
  float b = random (250, 480);
  float c = random (400, 550);
  float d = random (480, 200);
  float e = random (50, 400);
  float f = random (480, 560);
  float g = random (400, -50);
  float h = random (10, 180);
  float i = random (100, 250);
  float j = random (200, 120);
  
  //-------------------------------CATIMG
    image(cat4, i, j);
    image(cat1, a, b);
    image(cat2, c, d);
    image(cat3, e, f);
    image(cat5, g, h);
    
   

 //--------------------------------END
}



