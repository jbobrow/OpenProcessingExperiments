
boolean mode=true;
void setup()
{
  size(600, 600);
  background(150, 0, 0);
  smooth();
  fill(0, 0, 0);
  ellipse(300, 300, 300, 300);
  noLoop();
}
void draw()
{
  String lines[] =loadStrings ("lists.txt");
  if (mode==true)
  {
    fill(255, 255, 255);
    ellipse(300, 190, 120, 80);
    noFill();
    strokeWeight(5);
    stroke(0, 0, 0);
    ellipse(300, 170, 53, 25);
    ellipse(300, 200, 75, 35);
  }
  else
  {
    int i= int(random(0, 16));
    fill(0, 0, 255);
    triangle(240, 180, 360, 180, 300, 255);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(lines[i], 300, 300);
  }
}

void mouseClicked()
{
  if (mouseX>200&& mouseX<400 && mouseY>200 && mouseY<400)
  {
    mode=!mode;
    background(150, 0, 0);
    fill(0, 0, 0);
    smooth();
    ellipse(300, 300, 300, 300);
    redraw();
  }
}


