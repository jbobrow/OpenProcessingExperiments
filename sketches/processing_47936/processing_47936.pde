
void setup()  {
  background (63,63,63);
  smooth();
  size(800, 600);
}

float LineX;
float LineY;

void draw()  {
  LineX = random(0,800);
  LineY = random(0,600);
  
  if (mousePressed)  {
  stroke(0,120,255,63);
  fill(255,255,255,63);
  strokeWeight(20);
  line(mouseX,mouseY,LineX,LineY);
  strokeWeight(5);
  ellipse(LineX,LineY,80,80);
  }
  
}



