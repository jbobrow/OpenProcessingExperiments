
float proximity;
 
void setup()
{
 size(500,500);
}
 
void draw()
{
  background(255);
 fill(250, 32, 20, 50);
 noStroke();
 smooth();
 noCursor();
  
 for (int i =115; i <= width-115; i += 20)
 {
  for (int j =115; j <= height-115; j += 20)
 {
    proximity = min(((abs(mouseX-10-i)+abs(mouseY-10-j))/.5),300);
    pushMatrix();
    {
      translate(i, j);

      //rotate(PI/8);
      ellipse(0, 0, 100-proximity , 100-proximity);
       
       
       
    }
    popMatrix();
 }
 }
 }



