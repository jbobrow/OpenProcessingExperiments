
int [] strokeColour = new int [5];
int counter;
float r = random(255), g = random(255), b = random(255);

void setup()
{
  size(200, 200);
  background(255);
  noStroke();
  rect(20, 0, 159, 180);

  for (int i = 0; i < strokeColour.length; i++)
  {
    strokeColour[i] = (int) random(255);
    println(strokeColour[i]);
  }
}

void draw()
{
  if ((mouseX > 20 && mouseX < 180) && (mouseY > 0 && mouseY < 180))
  {
    fill(0);
    strokeWeight(5);
    stroke(strokeColour[counter] + r, strokeColour[counter] + g, strokeColour[counter] + b);
    rect(70, 70, 20, 20);
    ellipse(100, 150, 13, 15);
    triangle(50, 20, 35, 40, 65, 40);
    rect(120, 50, 35, 16);
    ellipse(120, 120, 50, 10);
  }

  else
  {
    strokeWeight(5);
    stroke(strokeColour[counter] + g, strokeColour[counter] + b, strokeColour[counter] + b);
    rect(70, 70, 20, 20);
    ellipse(100, 150, 13, 15);
    triangle(50, 20, 35, 40, 65, 40);
    rect(120, 50, 35, 16);
    ellipse(120, 120, 50, 10);
  }
}
