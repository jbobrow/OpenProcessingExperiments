
void setup()
{
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  println("Click to clear screen of lines.");
}

void draw()
{
  //perma-circle
  int r = 100;
  fill(255);
  ellipse(150, 150, r, r);
  float d = dist(150, 150, mouseX, mouseY);

  //perma-rectangle
  fill(255);
  rect(400, 400, 100, 100);

  //hover over circle
  if (d <= r/2)
  {
    background(255, 0, 0);
    rect(400, 400, 100, 100);
    for (int i = 0; i <= width; i += 15)
    {
      stroke(0, i, 255);
      line(i, height, mouseX, mouseY);
      line(width, i, mouseX, mouseY);
      line(i, 0, mouseX, mouseY);
      line(0, i, mouseX, mouseY);
    }
  }

  //hover over rectangle
  if (mouseX>=400 && mouseX<=500 && mouseY>=400 && mouseY<=500)
  {
    background(0, 0, 255);
    ellipse(150, 150, r, r);
    for (int i = 0; i <= width; i += 15)
    {    
      stroke(255, i, 0);
      line(i, height, mouseX, mouseY);
      line(width, i, mouseX, mouseY);
      line(i, 0, mouseX, mouseY);
      line(0, i, mouseX, mouseY);
    }
  }

  //back to black
  if (mousePressed)
  {  
    background(0);
    rect(400, 400, 100, 100);
    ellipse(150, 150, r, r);
  }
}


