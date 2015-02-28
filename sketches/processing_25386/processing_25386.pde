
void setup() 
  {
 size(500, 500);
  background(0);
   smooth();
  }


void draw()
  {
  for (int i=1; i < 10; i = i+100) 
  {
  float SCALE=random(50);
  tint(random(255), random(255), random(200));
  PImage b;
  b = loadImage("img.png");
  image(b, mouseX+random(50), mouseY-random(50), SCALE, SCALE);
  }
  }
  



