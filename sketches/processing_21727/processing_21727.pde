
float counter;
PImage img;

void setup()
{
  counter=0.0;
  size(400,400);
  img=loadImage("Graphic1.png");
  frameRate(500);
}

void draw()
{
  background(0);
  counter++;
  translate(width/2, height/2);
  rotate(counter*TWO_PI/360);
  translate(-width/2,-height/2);
  image(img, 0, 0);
  //rect(125, 50, 50, 200);
  //ellipse(150,150, 5, 5);
} 

