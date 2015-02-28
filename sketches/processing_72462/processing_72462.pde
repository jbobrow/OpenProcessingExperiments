
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
      if (frameCount %1 == 0) 
      {
    fill(frameCount * 3 % 255, frameCount * 5 % 255,
      frameCount * 7 % 255);
  
    translate(250, 250);
    rotate(radians(frameCount *200  % 360));
        triangle(1, 250-a, 250-a, 250+a, 250+a, 250+mouseY);
        a=a+5;
        if (a>250)
        {
          a=1; 
        }
      }
 }

