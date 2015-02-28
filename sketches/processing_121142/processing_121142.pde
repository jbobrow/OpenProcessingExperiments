
float counter = 0;

void setup()
{
size(500, 500);
background(0);
}

void draw()
{
background(0);

noStroke();

fill(255);
ellipse(100, 400, 50, 50);

pushMatrix();
  translate(0, sin(counter)*220);
  fill(255, 0, 0);
  triangle(100, 150, 150, 50, 50, 50);
popMatrix();

pushMatrix();
  translate(sin(counter)*260, 0);
  fill(255, 0, 0);
  triangle(400, 400, 500, 350, 500, 450);
popMatrix();



counter += 0.04;




}


