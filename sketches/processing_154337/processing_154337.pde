
//Stefan Joseph scjoseph
//copyright: that means you Zuckerberg

void setup()
{
  size (400, 400);

} 
void draw()
{
if(frameCount>100)
{
  float x= mouseX;
  
  float y= mouseY;
  
  fill(255, 100, 0);
  
  arc(x, y, x + 20, y + 20, 0, TWO_PI);
  
  fill(255, 255, 0);
  
  ellipseMode(CENTER);
  
  ellipse(x, y, x, y);
  
  fill(150, 50, 200);
  
  rectMode(CENTER);
  
  rect(x, y, x/2, y/2);
}
 

}


