

void setup()
{
  
  background (1);
  size (1000,900);
  noStroke();
  smooth();
 
}
void draw()
{
 //clears page
 
  if(keyPressed) {
    if (key == 'q' || key == 'Q') {
     background(0);
    }
  }
  fill (random (225), random(255), random (255));
  rect (mouseX+14,mouseY+24,10,10);
  fill (random (225), random(255), random (255));
  ellipse (mouseX,mouseY,random(20),random(40));
  fill (random (225), random(255), random (255));
  rect (mouseX-24,mouseY-20,random(10),random (20));
  fill (random (225), random(255), random (255));
  ellipse (mouseX-24,mouseY+24, random (30),random(90));
}


