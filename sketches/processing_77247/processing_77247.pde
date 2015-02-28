
float y;

void setup()
{
  size(1000,500);
  y = height/2;
  smooth();
  //noLoop();
}

void draw()
{
  background(255,0,0);
  noFill();
  stroke(0,100); 

  
  for(int i = 0; i < 100; i+=1.5)
  {
  beginShape();
  vertex(0,height);
  for(int x = 0; x < width; x+=5)
  {
    //noise always return a number between 0,1
   vertex(mouseX,mouseY-i+ (noise(x*.01, (frameCount*.01), i*.01 )*300));
    
  }
  vertex(width, height);
  endShape();
  
  }  
  
}
