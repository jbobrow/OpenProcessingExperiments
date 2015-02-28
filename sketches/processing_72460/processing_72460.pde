
float a=1;

void setup()
{
  size(500, 500);
  noFill();
  background(0);
  strokeWeight(2);
}
 
void draw()

 {
        fill(0, 0, 0, (random(1,40)));
        rect(0, 0, 500, 500);
        noFill();
        stroke(mouseX, mouseY+10, 160);
        triangle(mouseX, 250-a, 250-a, 250+a, 250+a, 250+mouseY);
        a=a+5;
        if (a>250)
        {
          a=1; 
        }
      }
   

