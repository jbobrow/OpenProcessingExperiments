
PImage pic;

void setup()
{
 size(600, 600, P3D);
  pic = loadImage("IMG_0005.jpg");
  imageMode(CENTER);
  frameRate(20);
}

void draw()
 {
   background(0);
   translate(width/2, height/2, -200);
   rotateY(frameCount);
   image(pic, 0, 0, 375, 500);
 }


