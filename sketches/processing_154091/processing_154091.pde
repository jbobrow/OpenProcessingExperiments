
void setup()
{
size(600,600);
ellipse(width/2,height/2,width,height);
}
void draw() 
{
  if (mousePressed == true) {
    noCursor();
    ellipse (mouseX, mouseY,100,100);
    
  } else {
    cursor(HAND);
  }
}
