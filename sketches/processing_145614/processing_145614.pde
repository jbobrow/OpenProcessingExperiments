
float proximity;
 
void setup()
{
 size(500,500);
}
 
void draw()
{
  background(255);
 fill(4, 53, 147, 100);
 noStroke();
 smooth();
 noCursor();
  
 for (int i =10; i <= width+200; i += 30)
 {
  for (int j =10; j <= height+200; j += 30)
 {
    proximity = min(((abs(mouseX-10-i)+abs(mouseY-10-j))/2.0),50);
    pushMatrix();
    {
      translate(i, j);

      //rotate(PI/8);
      ellipse(0, 0, 45-proximity , 45-proximity);
       
       
       
    }
    popMatrix();
 }
 }
 }



