


PImage img;

int x = 0;
int y = 0;
int ag = 0;
float angle = 0;

void setup() {
  colorMode(HSB, 360, 100, 100); 
  size(800, 800);
  img = loadImage("poker.png");
  background(100, 100, 18, 20);
  imageMode(CENTER);
}

void draw()
{

  float shift = sin(angle) / 10;
  shift += sin(angle * 2.1) / 20;
  shift += sin(angle * 4.9) / 40;
  angle += 0.01;
   
  translate(width/2, height/1.5);
  for (int i=0; i<20; i++)
  {
    rotate(shift/0.03);
    translate(0, -20);
    tint(255,75);
    image(img, x, y, i*1.5, 20);
  }


   
 
}
















