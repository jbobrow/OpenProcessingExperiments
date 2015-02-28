
void setup()  
{
  size(400, 400);
}

void draw()
{
  background(56, 235, 240); 
  noStroke();
  fill(mouseX, mouseY, 200);
  ellipse(200, 300, 200, 200);
  ellipse(200, 150, 150, 150);
  ellipse(200, 50, 100, 100);
  fill(0, 0, 0);
  ellipse(200, 125, 25, 25);
  ellipse(200, 175, 25, 25);
  ellipse(200, 225, 25, 25);
  ellipse(200, 275, 25, 25);
  ellipse(180, 30, 15, 15);
  ellipse(220, 30, 15, 15);
  fill(255, 100, 0);
  triangle(210, 60, 210, 45, 270, 50);
  stroke(0, 0, 0);
  strokeWeight(5);
  line(15, 15, 125, 125);
  line(385, 15, 270, 125);
  line(45, 45, 50, 15);
  line(45, 45, 10, 50);
  line(350, 45, 355, 15);
  line(385, 45, 355, 48);
}
