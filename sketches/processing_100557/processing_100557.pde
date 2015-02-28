
void setup() {
  size(800, 600);
  frameRate(30);
}
float i=0;
void draw() 
{
  float a;
  if (mouseX<400)
  {
    noStroke();
    fill(359, 67, 67);
    rect(0, 0, 400, 600);

    fill(76, 121, 229);
    rect(400, 0, 400, 600);
    stroke(0, 0, 0);
    if (mouseX<400)
    {
      a=sin(i)*5;
      strokeWeight(a);
    }
    fill(255, 255, 255);
    ellipse(600, 250, 95, 105);
    ellipse(600, 325, 110, 95);
    if (i>3)
    {
      i=0;
    }
    i=i+0.1;
    fill(1, 1, 1);
    ellipse(580, 240, 10, 10);
    ellipse(620, 240, 10, 10);

    //ahora pongo el sol

    ellipse(200, 300, 150, 150);
  }
}


