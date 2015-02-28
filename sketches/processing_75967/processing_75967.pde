
PFont font;
String mouseLoc;

void setup()
{
  background(255);
  size(500,500);
  font = createFont("Arial", 14, true);
}

void draw()
{
  mouseLoc = "x: " + mouseX + "  y: " + mouseY;
  background(255);
  
  if (mousePressed == true)
  {
    fill(random(255), random(255), random(255));
    rectMode(CENTER);
    rect(250, 250, 20, 200);
    rect(250, 250, 200, 20);
    ellipseMode(CENTER);
    ellipse(250, 250, 80, 80);
  }
  textFont(font);
  fill(0);
  text(mouseLoc, 15, 15);
}



