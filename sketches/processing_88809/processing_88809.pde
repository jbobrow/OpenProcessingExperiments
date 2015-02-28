
//facescollage//

PImage face1; 
PImage face2; 
PImage face3; 
PImage face4; 
PImage face5; 
PImage face6; 
PImage face7; 
PImage face8; 
PImage face9; 
PImage face10; 
PImage face11; 
PImage face12; 
PImage face13; 
PImage face14; 

void setup () {
  size (700, 400);
  face1 = loadImage ("1.jpg");
  face2 = loadImage ("2.jpg");
  face3 = loadImage ("3.jpg");
  face4 = loadImage ("4.jpg");
  face5 = loadImage ("5.jpg");
  face6 = loadImage ("6.jpg");
  face7 = loadImage ("7.jpg");
  face8 = loadImage ("8.jpg");
  face9 = loadImage ("9.jpg");
  face10 = loadImage ("10.jpg");
  face11 = loadImage ("11.jpg");
  face12 = loadImage ("12.jpg");
  face13 = loadImage ("13.jpg");
  face14 = loadImage ("14.jpg");

  imageMode (CENTER);
}

void draw () {
  background (255);

  float x = random (100, 500);
  float y = random (300, 300);
  float z = random (800, 160);
  float d = random (400, 100);
  float e = random (700, 10);
  float f = random (5, 50);
  float g = random (115, 650);
  float h = random (680, 150);


  image (face1, z, f, 240/2, 291/2);
  image (face2, x, g, 240/2, 291/2);
  image (face3, z, y, 240/2, 291/2);
  image (face4, h, g, 240/2, 291/2);
  image (face5, f, z, 240/2, 291/2);
  image (face6, g, x, 240/2, 291/2);
  image (face7, z, h, 240/2, 291/2);
  image (face8, f, y, 240/2, 291/2);
  image (face9, x, z, 240/2, 291/2);
  image (face10, g, f, 240/2, 291/2);
  image (face11, h, f, 240/2, 291/2);
  image (face12, g, z, 240/2, 291/2);
  image (face13, e, h, 240/2, 291/2);
  image (face14, h, z, 240/2, 291/2);
}



