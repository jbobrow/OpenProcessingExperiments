
float counter;
PImage img;
PImage img2;

void setup()
{
  counter=0.0;
  size(250,250);
  img=loadImage("image.png");
  img2=loadImage("image2.png");
}

void draw()
{
  counter++;
  translate(width/2, height/2);
  rotate(-0.5*counter*TWO_PI/360);
  translate(-img.width/2, -img.height/2);
  image(img2,0,0);

  translate(width/2, height/2);
  rotate(1*counter*TWO_PI/360);
  translate(-img.width/2, -img.height/2);
  tint(255,64);
  image(img,0,0);
} 


