
float r = 200;
float g = 200;
float b = 200;

float x1 = 20;
float y1 = 20;
float x2 = width;
float y2 = height;


void setup()  {
   size (500, 500);
   background(255);
   smooth();
}
 
void draw()  {
  color c1 = color(r, g, b);
   r = random (0,50);
   g = random (-10,50);
   b = random (70,180);
   
   x1 = random (500);
   x2 = random (500);
   x2 = random (-50,300);
   y2 = random (-50,500);
  stroke (c1);
  line(x1, y1, x2, y2);
 
}

void mousePressed() {
fill (random(0,255));
rect(0,0,500,500);
}



