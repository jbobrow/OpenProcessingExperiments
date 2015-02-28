
void setup()
{
  size(480, 120);
  smooth();
}

void draw()
{
  background(204);
  randomSeed(0);
  for(int i = 35; i < width + 40; i += 40)
  {
    int gray = int (random(0, 102));
    float scalar = random(0.25, 1.0);
    owl(i, 110, gray, scalar);
  }
}

void owl(int x, int y, int g, float s)
{
  pushMatrix();
  translate(x, y);
  scale(s); // set the size
  stroke(g); // set the gray value
  strokeWeight(70);
  line(0, -35, 0, -65); //body
  noStroke();
  fill(255 - g);
  ellipse(-17.5, -65, 35, 35); //left eye 
  ellipse(17.5, -65, 35, 35); //right eye 
  
  arc(0, -65, 70, 70, 0, PI); //chin
  fill(g);
  ellipse(-14, -65, 8, 8); //left eye
  ellipse(14, -65, 8, 8); //right eye
  quad(0, -58, 4, -51, 0, -44, -4, -51); //beak
  popMatrix();
}


