
// Wendy Chuyi Liu, Gold Fish, Mods 16/17
// http://besttoshow.webs.com/


void setup()
{
  size(500,500);
  
}
void draw()
{
stroke(0);
fill(0,0,0,10);
rect(0,0,500,500);

}
void mouseDragged()
{
  stroke(255,255,255);
  ellipse(mouseX,mouseY,100,100);
  ellipse(500-mouseX,mouseY,100,100);
  if(keyPressed == true && key == 'r')
  {
  stroke(225,0,0);
  ellipse(mouseX,mouseY, 100,100);
  ellipse(500-mouseX,mouseY,100,100);
  }
  if(keyPressed == true && key == 'g')
  {
  stroke(0,255,0);
  ellipse(mouseX,mouseY, 100,100);
  ellipse(500-mouseX,mouseY,100,100);
  }
  if(keyPressed == true && key =='p')
  {
    
    stroke(145,93,201);
    ellipse(mouseX,mouseY,100,100);
    ellipse(mouseX,500 - mouseY,100,100); 
    ellipse(500-mouseX,mouseY,100,100);
    ellipse(500 - mouseX,500 - mouseY, 100,100);
    
  }
}
