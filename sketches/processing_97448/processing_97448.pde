
//Roberta
//Reforço 3
void setup()
{
  size(200, 200);
  background(255, 0, 243);
  line(75, 75, 80, 75);
  line(90, 75, 95, 75);
  line(105, 75, 110, 75);
  line(120, 75, 125, 75);


  line(75, 125, 80, 125);
  line(90, 125, 95, 125);
  line(105, 125, 110, 125);
  line(120, 125, 125, 125);


  line(75, 75, 75, 80);
  line(75, 90, 75, 95);
  line(75, 105, 75, 110);
  line(75, 120, 75, 125);


  line(125, 75, 125, 80);
  line(125, 90, 125, 95);
  line(125, 105, 125, 110);
  line(125, 120, 125, 125);
}
void draw()
{
  if (mouseX > 75 && mouseX < 125) {
    if (mouseY >75 && mouseY < 125) {
      fill(255);
      rect(0, 0, 200, 200);
    }
  }

  for ( int i=0; i<5; i++)
  {
    noStroke();
    ellipse(mouseX, mouseY, 15, 15);
    fill(50, 255, 100, i*i);
  }
}
