
float counter = 0;
void setup()
{
  size(400, 400);
}

void draw()
{

  size(400, 400);
  colorMode(HSB, 360, 100, 100);

  float h = map(sin(counter), -1, 1, 300, 250); //strecke-1bis1,farbe
  background(h, 100, 100);   //sinus+sättigung+helligkeit
  counter += 0.01; //geschwindigkeit des durchlaufs

  translate(width/2, height/2);

  pushMatrix();
  translate(cos(counter)*100, sin(counter)*100);
  ellipse(0, 0, 30, 30);
  popMatrix();

  counter -= 0.05;

  pushMatrix();
  translate(cos(counter)*50, sin(counter)*50);
  ellipse(0, 0, 60, 60);
  noStroke();
  fill(0, 0, 0);
  popMatrix();

  counter -= 0.05;
}

