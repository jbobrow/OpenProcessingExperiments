
/*
ACCD Summer 2012
ID02
4 // Collage Engine
Charlene Chen
06/15/2012
*/


PImage image1;
PImage image2;
PImage image3;
PImage image4;
  
void setup() {
  size(500, 500);
  image1 = loadImage("image1.png");
  image2 = loadImage("image2.png");
  image3 = loadImage("image3.png");
  image4 = loadImage("image4.png");
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  
  float x1 = random(width);
  float y1 = random(height);
  float d1 = random(50, 178);
  
  float x2 = random(height);
  float y2 = random(width);
  float d2 = random(50, 178);
  
  float x3 = random(100, 500);
  float y3 = random(0, 250);
  float d3 = random(50, 179);
  
  float x4 = random(0, 250);
  float y4 = random(250, 500);
  float d4 = random(50, 172);
  
  background(x1, x2, x3);
  
  tint(x1, x2, x3, x1);
  image(image1, random(0, 50), random(0, 50), d1, d1);
  image(image1, random(100, 150), random(100, 150), d2, d2);
  image(image1, random(200, 250), random(200, 250), d3, d3);
  image(image1, random(300, 350), random(300, 350), d4, d4);
  image(image1, random(400, 450), random(400, 450), d1, d1);
  image(image1, random(500, 550), random(500, 550), d2, d2);
  image(image1, random(0, 500), random(300, 550), d1, d1);
  
  tint(x1, x2, x3, x2);
  image(image2, random(0, 50), random(50, 100), d2, d2);
  image(image2, random(100, 150), random(150, 200), d3, d3);
  image(image2, random(200, 250), random(250, 300), d4, d4);
  image(image2, random(300, 350), random(350, 400), d1, d1);
  image(image2, random(400, 450), random(450, 500), d2, d2);
  image(image2, random(500, 550), random(550, 600), d3, d3);
  image(image2, random(0, 500), random(350, 500), d1, d1);
  
  tint(x1, x2, x3);
  image(image3, random(0, 50), random(150, 200), d3, d3);
  image(image3, random(100, 150), random(200, 250), d4, d4);
  image(image3, random(200, 250), random(300, 350), d1, d1);
  image(image3, random(300, 350), random(400, 450), d2, d2);
  image(image3, random(400, 450), random(500, 550), d3, d3);
  image(image3, random(500, 550), random(0, 50), d4, d4);
  image(image3, random(400, 500), random(0, 100), d2, d2);
  image(image3, random(300, 400), random(100, 200), d3, d3);
  image(image3, random(200, 300), random(200, 300), d4, d4);
  image(image3, random(100, 200), random(300, 400), d3, d3);
  image(image3, random(0, 500), random(400, 500), d4, d4);
  image(image3, random(400, 500), random(350, 400), d1, d1);
  
  tint(x1, x2, x3, x4);
  image(image4, random(100, 200), random(0, 50), d4, d4);
  image(image4, random(200, 300), random(50, 100), d1, d1);
  image(image4, random(300, 400), random(100, 150), d2, d2);
  image(image4, random(400, 500), random(150, 200), d3, d3);
  image(image4, random(0, 100), random(200, 250), d4, d4);
  image(image4, random(200, 300), random(250, 300), d1, d1);
  image(image4, random(300, 400), random(300, 350), d4, d4);
  image(image4, random(0, 500), random(400, 500), d1, d1);
}


