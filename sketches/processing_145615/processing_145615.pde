
float proximity;
 
void setup()
{
 size(800,800);
}
 
void draw()
{
  background(255);
 fill(255, 70, 8, 200);
 noStroke();
 smooth();
  noCursor();
 for (int i =0; i <= width+200; i += 30)
 {
  for (int j =0; j <= height+200; j += 30)
 {
    proximity = min(((abs(mouseX-10-i)+abs(mouseY-10-j))/4.0), 50);
    pushMatrix();
    {
      translate(i, j);

      //rotate(PI/8);
      ellipse(0, 0, 45-proximity , proximity);
       
       
       
    }
    popMatrix();
 
 
 }
 
 }
 }



