
void setup()
{
  size(400,800);
  background(255);
  loop();
}

void draw()
{
  background(177);
  noStroke();
  fill(255);
  ellipse(width/2, mouseY/4*3,mouseY/3, mouseY/3);
  ellipse(width/2, mouseY/2, mouseY/4, mouseY/4);
  ellipse(width/2, mouseY/3, mouseY/5, mouseY/5);
  fill(255, 156, 26);
  ellipse(width/2, mouseY/3, mouseY/40, mouseY/40);
  fill(0);
  ellipse(width/2 + mouseY/20.0 , mouseY/21.0*6.0, mouseY/40, mouseY/40);
  ellipse(width/2 - mouseY/20.0, mouseY/21.0*6.0, mouseY/40, mouseY/40);
  ellipse(width/2, mouseY/20.0*11.0, mouseY/35, mouseY/35);
  ellipse(width/2, mouseY/20.0*9.0, mouseY/35, mouseY/35);
  ellipse(width/2, mouseY/2, mouseY/35, mouseY/35);
  noFill();
  stroke(0);
  strokeWeight(mouseY/100);
  arc(width/2, mouseY/3, mouseY/8, mouseY/8, radians(30), radians(150));
}
