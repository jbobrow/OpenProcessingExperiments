
float xPos = 0;
float yPos = 0;

void setup()
{
 size(800,800);
 background(0);
 noStroke(); 
}

void draw()
{
 //xPos = xPos + 1;
 //yPos = yPos + 2;
 
 xPos=mouseX;
 yPos=mouseY;
 
 // background(255);
 if (mousePressed)
 {
  fill(255, 255, 255);
  ellipse(xPos, yPos, 200, 200);
  fill(0,0,0);
  ellipse(xPos,yPos,10,10);
  line(yPos, yPos, 20, 20);
 }
 else
 {
   fill(0);
   ellipse(xPos, yPos,150,150);
 }
} 

void mouseClicked()
{
 fill(255,0,0);
 ellipse(xPos,yPos,100,100); 
}
