
void setup()
{
  size(500, 500);
  background(255, 255, 255);
}

void draw()
{
  //background(255, 255, 255);
  stroke(100);

  noFill();
  // erstes D element
  translate(width/2, width/2);
  rotate(mouseX/500.0);
  translate(sin(millis()/100.0)*100, 0);
  rect(0, 0, 50, 10);
  rect(50, 65, 10, 50);
}

