
float xPos= 0;
float yPos= 0;

void setup()
{
 size (800, 800);
 background(255);
 
}

void draw()
{

 
 xPos = mouseX;
 yPos = mouseY;
 
 
 if (mousePressed)
 {
  fill(random(0,255),random(0,255), random(0,255));
  rect(xPos, yPos, 50, 50); 
   
 }
 
 if (key == 'a' && keyPressed)
 {
  fill(random(255,255),random(3,3),random(0,255));
  ellipse(xPos, yPos, 50,50); 
 }
 
  if (key == 's' && keyPressed)
 {
  fill(random(3,166),random(255,255),random(3,152));
  ellipse(xPos, yPos, 50,50); 
  frameRate(1000);
 }
 
  if (key == 'd' && keyPressed)
 {
  fill(random(0,148),random(3,255),random(255,255));
  ellipse(xPos, yPos, 50,50); 
 }

}
