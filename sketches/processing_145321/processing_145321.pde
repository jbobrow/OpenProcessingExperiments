

void setup()
{
  size(500, 500);
  colorMode(HSB);
}
int x;
float farbe;
float helligkeit;


void draw()
{

  farbe = map(mouseX, 0, width, 150, 255);

  helligkeit = map(mouseY, 0, width, 100, 70);


  println(farbe);

  background(farbe, 100, helligkeit);

  translate (width/2, height/2);

  for (int i=0; i<360; i+=20)
  {
    pushMatrix();
    strokeWeight(3.0);
    stroke(#FFFFFF);
    rotate(radians (random(0, 60)));
    translate(0, sin(random(0, 60))*mouseX*mouseY/100);
    rect(0, 0, 1, 1, i/16);
    popMatrix();
  }
}



