
boolean mouseIsDown = false;

void setup()
{
  size(700, 700);
  background(255, 255, 255);
  smooth();
  frameRate(200);
}

void draw()
{
  {
  fill(255, 255, 255, 2);
  rect(0, 0, 1000, 1000);
  strokeWeight(.3);  
  }
  
  if (mouseIsDown == true) 
  {
    stroke(mouseX, mouseY, pmouseX, pmouseY);
    fill(random(255), 0, 0);
    ellipse(mouseX, mouseY, random(30), random(30));
    rect(mouseX, mouseY, random(15), random(15));
    line(mouseX, mouseY, random(700), random(700));  
  }
  
  if (mouseIsDown == false)
  {
    fill(0, random(255), 0);
    noStroke();
    ellipse(mouseX, mouseY, random(50), random(50));    
  }

}
 
 
void mousePressed() 
{
  mouseIsDown = true;
}
 
void mouseReleased() 
{
  mouseIsDown = false;
}


