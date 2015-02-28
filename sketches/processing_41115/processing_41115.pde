
//hw9 CMU-48-757 copywrite Zack Jacobson-Weaver 2011

float x = random(50);

void setup()
{
  size (400,400,P3D);
  rectMode(CENTER);
  noStroke();
  smooth();
  background(0);
  
}

void draw()
{

   lights();
   //spotLight(51, 102, 126, -100, -100,0 , 0, 0, -1, 1, -200);
   translate(width/2, height/2, 0);
   noStroke();

while(x<width)
{
  x=x+2;
  
  fill(255,0,0);
  translate(x*random(5),50-x,5);
  rotateX(100);
  rotateZ(-60);
  box(50);
  translate(x*random(5),50-x,5);
  fill(0,4,198);
  sphere(random(50));
}
}

