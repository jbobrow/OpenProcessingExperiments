
void setup()
{
  size(500,500);
  smooth();
  background(0);
  noFill();
}

void draw ()
{
    translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  {
    rotate(radians(20));
    strokeWeight(10);
    stroke(#03FFE8,60);
    triangle(0, 100, 50, 0, 100, 100);  
  }
  for (int i=0;i<360;i+=40)
  {
    rotate(radians(40));
    stroke(#05FFAE,60);
    strokeWeight(15);
    triangle(0,50,50,0,50,50);
  }
  for(int i=0;i<360;i+=10)
  {
    rotate(radians(10));
    strokeWeight(13);
    stroke(#0832FF,50);
    triangle(0,200,100,0,200,200);
    
  }
  
  noLoop();
}

