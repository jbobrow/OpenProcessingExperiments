
float proximity;

void setup()
{
 size(300,300);
}

void draw()
{
  background(255);
  rectMode(CENTER);
 fill(0);
 noStroke();
 smooth();
 
 for (int i =-800; i <= width+200; i += 40)
 {
  for (int j = -800; j <= height+200; j += 20)
 {
    proximity = min(((abs(mouseX-10-i)+abs(mouseY-10-j))/4.0),40);
    pushMatrix();
    {
      translate(i,j);
      
      rotate(PI/4);
      rect(0,0,40-proximity,40-proximity);
      
      
      
    }
    popMatrix();
 } 
 }
 }

