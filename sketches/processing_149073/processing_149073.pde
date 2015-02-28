
void setup()
{
  frameRate(120); 
  size(600, 400); 
  background(255, 255, 255);
}



void draw()


{  
  fill(random(255), random(255), random(255));
  {
    if (mousePressed== true) fill(random(255), random(255), random(255));
    ellipse(0, 0, mouseX, mouseY);
    ellipse(0, 200, mouseX, mouseY);
    ellipse(0, 400, mouseX, mouseY);
    ellipse(300, 0, mouseX, mouseY);
    ellipse(600, 0, mouseX, mouseY);
    ellipse(600, 400, mouseX, mouseY);
    ellipse(600, 200, mouseX, mouseY);
    ellipse(300, 400, mouseX, mouseY);
  }
}  

void mouseClicked() {
  setup();
}
