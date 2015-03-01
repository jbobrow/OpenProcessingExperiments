
void setup()
{
  size(600,600);
  background(255);
 }
 
void draw()
{
  if(mouseX%3 == 0) {
    line(mouseX,0,mouseX,height);
    stroke(255,255,255);
  } else if(mouseX%3 == 1){
    float size = random(10,150);
    ellipse (mouseX, mouseY, size, size);
    
  } else {
  
    float size = random(1,10);
    line(0,mouseY,width,mouseY);
    stroke(255,0,0);
   
}
}
