
PImage img;

float x;
float y;
float x1;
float y1;
float multiStroke;

void setup() { 
  size(500,300); 
  img = loadImage("tree.jpg"); 
  smooth();
  //img variable will be this image
}
void draw() { 
  image(img,0,0);
  line(x,y,x1,y1);
  multiStroke = random(255);
  x = random(580);
  y = random(580);
  x1 = random(580);
  y1 = random(580);
}

