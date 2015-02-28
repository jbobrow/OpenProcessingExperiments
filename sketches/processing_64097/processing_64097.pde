



PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage p8;
PImage p9;
PImage p10;
  
void setup() {
  size(625, 351);
  p1 = loadImage("1.png");
  p2 = loadImage("2.png");
  p3 = loadImage("3.png");
  p4 = loadImage("4.png");
  p5 = loadImage("5.png");
  p6 = loadImage("6.png");
  p7 = loadImage("7.png");
  p8 = loadImage("8.png");
  p9 = loadImage("9.png");
  p10 = loadImage("10.png");

  frameRate(3);
  
}
  
void draw() {
  background(#E4EE96);
  float x = random(width);
  float y = random(height);
  float d = random(625, 351);
  image(p1, x, y, d, d);

 float x2 = random(width);
  float y2 = random(10);
  float d2 = random(200, 140);
  image(p2, x2, y2, d2, d2);
  
   float x3 = random(2);
  float y3 = random(199);
  float d3 = random(300, 160);
  image(p3, x3, y3, d3, d3);
  
    float x4 = random(width);
  float y4 = random(height);
  float d4 = random(300, 160);
  image(p4, x4, y4, d4, d4);
  
      float x5 = random(height);
  float y5 = random(width);
  float d5 = random(200, 110);
  image(p5, x5, y5, d5, d5);
  
        float x6 = random(width);
  float y6 = random(height);
  float d6 = random(300, 90);
  image(p6, x6, y6, d6, d6);
  
         float x7 = random(width);
  float y7 = random(height);
  float d7 = random(110, 40);
  image(p7, x7, y7, d7, d7);
  
  
         float x8 = random(width);
  float y8 = random(height);
  float d8 = random(400, 220);
  image(p8, x8, y8, d8, d8);
  
  
         float x9 = random(300);
  float y9 = random(200);
  float d9 = random(160, 100);
  image(p9, x9, y9, d9, d9);
  
  
         float x10 = random(width);
  float y10 = random(height);
  float d10 = random(100, 60);
  image(p10, x10, y10, d10, d10);
  
  

  
}


