
PImage img0; PImage img1; PImage img2;

float y = 0.0;
float y2 = 0.0;

void setup() { 
  size(500,500); 
  img0 = loadImage("jungle.png");
  img1 = loadImage("chase1.png");
}
  

void draw() { 
  background(204);
 image(img0,0,0); 
  image(img1, y, 10, 750, 500);
  y -= 7.5;
  if (y < -1800){
    y = 800.0;
  }

}

