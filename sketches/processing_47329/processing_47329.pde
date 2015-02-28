

void setup() 
{
  size(600, 600);
  background(51);
  noStroke();
  smooth();
  //noLoop();
}

void draw() 
{
 for(int i=1;i<=10;i++)
 {
   circles(random(600),random(600),random(140),random(20));
   delay(70);
}

if (mousePressed)
{
  fill(0);
  circles(300,300,900,900);
  
}
  }


void circles(float a, float b, float size, float loops) 
{
  float j = 255/loops;
  float steps = size/loops;
  for(int i=0; i<loops; i++) {
    fill(mouseX,mouseY,mouseX,mouseY);
    ellipse(a, b, size-i*steps, size-i*steps);
  }
}

