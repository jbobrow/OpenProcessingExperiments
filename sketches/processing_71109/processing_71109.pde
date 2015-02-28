
//Animation project, computer programming 1
//Iam B

int w=1;
int side=1;
int side2=1;
int tri=1;
void setup()
{
  size(500, 500);
  noFill();
  background(0);
  strokeWeight(2);
}

void draw()
{
  fill(0, 0, 0, 30);
  rect(0, 0, 500, 500);
  noFill();
  stroke(185, 250, 255);
  ellipse(250, 250, w, 200);
  w=w+10;
  if (w>500)
  {
    w=501;
    fill(0, 0, 0, 30);
    rect(0, 0, 500, 500);
    noFill();
    stroke(255, 191, 251);
    rect(0, 0, 0+side, 0+side);
    side=side+7;
    if (side>500)
    {
      side=501;
      fill(0, 0, 0, 30);
      rect(0, 0, 500, 500);
      noFill();
      stroke(180, 255, 213);
      rect(0, 0,0+side2, 0+side2);
      side2=side2+7;
      if (side2>500)
      {
        side2=501;
        fill(0, 0, 0, 30);
        rect(0, 0, 500, 500);
        noFill();
        stroke(250, 255, 160);
        triangle(250, 250-tri, 250-tri, 250+tri, 250+tri, 250+tri);
        tri=tri+6;
        if (tri>250)
        {
          w=1;
          side=1;
          side2=1;
          tri=1;
        }
      }
    }
  }
}
