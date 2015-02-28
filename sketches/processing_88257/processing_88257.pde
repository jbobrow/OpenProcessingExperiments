
PImage img;

float x2, y2=0;
float q=0.2;
int ang=1;

void setup()
{
  frameRate(9);
  img = loadImage("b_w.jpg");
  size(500, 500);
  background(0);
}

void draw() 
{
  float a=random(10, 255);
  float b=random(10, 255);
  float c=random(10, 255);
  int s =second();
  imageMode(CENTER);
  
  if (s%4==0)
  {
    x2=0;
    y2=0;
    q+=0.02;
  }

  if (s%7==0)
  {
    x2=-12;
    y2=-12;
    q-=0.02;
  }

  pushMatrix(); 
  translate(width/2, height/2);
  for (int j = 10; j < 15; j++) {
    tint(b, c, 0, a); 
    x2-=1;
    y2-=1;
    translate(0, j);
    rotate(radians(30+ang));
    image(img, x2+noise(q), y2+noise(q), 100, 30);
  }
  popMatrix();

  pushMatrix(); 
  translate(width/2, height/2);
  for (int j = 10; j < 15; j++) {
    tint(b, c, 0, a); 
    x2-=1;
    y2-=1;
    translate(0, j);
    rotate(radians(-30-ang));
    image(img, x2+noise(q), y2+noise(q), 100, 30);
  }
  popMatrix();
}



