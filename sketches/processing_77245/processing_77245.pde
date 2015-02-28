
float y;
 
void setup()
{
  size(900,400);
  y = height * .25;
  smooth();

}
 
void draw()
{
  background(0);
  noFill();
  stroke(30,200,250);
 
   
  for(int i = 0; i < 100; i+=1)
  {
  beginShape();
  vertex(0,height);
  for(int x = 0; x < width; x+=4)
  {
  
   vertex(x,  y-i  + (noise(x*.01, (frameCount*.01), i*.01 )*400));
     
  }
  vertex(width, height);
  endShape();
   
  } 
   
}
