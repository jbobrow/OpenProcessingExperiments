
//Nancy Wang nancyw
//copyright notice
float wd1 = 50, ht1 = 50, wd2 = 75, ht2 = 75;
float x1=0, y1=0, x2 = 0, y2 = 0;
float deltaX1 = random(2, 5), deltaX2 = random(3,7);
float deltaY1 = random(2, 5), deltaY2 = random(3,7);
PImage pic1, pic2, pic3, pic4;
float f=1.0;
float hit = 0;

void setup()
{
  size(400, 400);
  smooth();
  imageMode(CENTER);
  pic4 = loadImage("hogwarts.jpg");
  pic1 = loadImage("harrypotter.jpg");
  pic2 = loadImage("voldemort.jpg");
  pic3 = loadImage("finalbattle.jpg");
}

void draw()
{
  background(0);
  int s = second();  // Values from 0 - 59
  image(pic4, width/2, height/2, width, height);
  fill(255);
  text(hit, 10, 30);
  
  // Harry Potter
  image (pic1, x1, y1, wd1, ht1);
  
  x1 = mouseX;
  y1 = mouseY;

 // Voldemort wrapping
  image (pic2, x2, y2, wd2, ht2);
  x2 = x2+deltaX2;
  if (x2 > 400)
 {
   x2 = random(-.75*width, width);
   y2 = -50;
 }  
 y2 = y2+deltaY2;

// Collision
 if (dist(x1, y1, x2, y2) < (wd1/2 + wd2/2)*f)
  {
    image(pic3, width/2,height/2 , width, height);
    f=.9f;
  }
}


