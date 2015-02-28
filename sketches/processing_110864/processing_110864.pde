
boolean mouseIsDown = false;
boolean canIDraw = false;
 
void setup() 
{
  size(800, 800);
  background(255, 255, 255);
}

int value = 0;

void draw() {
  
float strokeW = abs(mouseX - pmouseX);
 
  if (mouseIsDown == true)
  {
    strokeWeight(7);
    stroke(random(255), random(240), 255);
    fill(value);
  fill(random(255), random(200), 255);
  line(pmouseX+100,pmouseY+80, mouseX, mouseY);
  
  }
 if (mouseIsDown == false && canIDraw)
 {
   fill (random (255), 0, 200); 
   line(mouseX, mouseY, pmouseX,pmouseY);
  line(pmouseX+20,pmouseY+10, mouseX, mouseY);
  println("hello!");
}
}
/*
void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
    line(mouseX, mouseY, pmouseX,pmouseY);
  }
} */
 
void mousePressed() 
{
  canIDraw = true;
  mouseIsDown = true;
  line(mouseX, mouseY, pmouseX,pmouseY);
}
 
void mouseReleased() {
  mouseIsDown = false;
  line(pmouseX+20,pmouseY+10, mouseX, mouseY);
  
}
