
//Paulina Kang, 4-5, Disco Ball
float y = 0;
float bg = 190;
float b = 1;
int bchange = 1;
float ag = 96;

void setup()
{
  size(400,400,P3D);
  fill(145,143,232);
}
void draw()
{
  background(bg,ag,255);
  bg = bg + b;
  ag = ag + b;
  if (bg >255)
  {
    b = -1.7;
  }
  if (bg < 0)
  {
    b = 1.6;
  }
  if (ag > 255)
  {
   b = -1.6;
  }
  if (ag < 0)
  {
   b = 1.6;
  }  
  stroke(0);
  strokeWeight(3);
  line(200,0,200,100);
  strokeWeight(1);
  pointLight(255,255,255,90,200,400);
  translate(200,100,0);
  rotateY(y);
  sphere(50);
  stroke(245,242,198);
  strokeWeight(5);
  line(0,10,-10,150, 100, 400);
  line(0,20,-50,-100,400,-400);
  line(0,-30,20,100,400,400);
  line(0,30,0,-400,300,-400);
  y = y + .03;
}




