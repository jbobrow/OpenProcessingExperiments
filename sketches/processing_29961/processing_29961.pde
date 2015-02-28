
void setup()
{
  size(500,500);
  background(255);
  smooth();
}

void draw()
{
  for(int i=0; i<2; i++)
  {
    for(int j=0; j<2; j++)
    {
      strokeWeight(1);
      noFill();
      stroke(mouseX,mouseY,50);
      strokeWeight(mouseX/5);
      ellipse(random(0,500),random(0,500),random(15,30),random(15,30));
      
      strokeWeight(mouseY);
      noFill();
      stroke(mouseX,mouseY,255,50);
      ellipse(500/2,500/2,mouseX,mouseX);
    }
  }
}

void keyPressed(){
  save("w"+second() +".TIF");
  
}

