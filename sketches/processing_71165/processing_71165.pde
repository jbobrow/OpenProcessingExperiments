
PImage img1, img2, img3, bg;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  imageMode(CENTER);
  img1 = loadImage("image_1.png");
  img2 = loadImage("image_2.png");
  img3 = loadImage("image_3.png");
  bg = loadImage("background_2.jpg");
  //image(bg, 0, 0, width, height);
}
 
int numObjects = 10;
int centerX = 250;
int centerY = 250;
float distance = 0;
float distance2 = 0;
float angle = 0;
float angleObject = 360/numObjects;
float angleObject2 = 360/(numObjects/2);
 
void draw() {
  tint(255, 20);
  pushMatrix();
    translate(width/2, height/2);
    rotate(radians(-angle/2));
    image(bg, 0, 0, width*1.5, height*1.5);
  popMatrix();
  tint(255, 255);
  angle++;
 
  for (int i=0;i<numObjects ;i++)
  {
    distance = sin(radians(frameCount))*150;
    distance2 = cos(radians(frameCount))*150;
    pushMatrix();
      translate(centerX, centerY);
      rotate(radians(i*angleObject + angle*2.5));
      image(img1, distance, distance, 50+distance, 50+distance);
    popMatrix();
    pushMatrix();
      translate(centerX, centerY);
      rotate(radians(i*angleObject - angle*3.5));
      image(img2, distance2, distance2, 300+distance2, 300+distance2);
    popMatrix();
  }
  
}

