
int rate = 4;
float radius = 50;

color white;
color colourA;
color colourB;

void setup() {
  size(400, 400);


  smooth();
  colorMode(HSB, 360, 100, 100);

  white = color(0, 0, 100);
  colourA = color(0, 60, 95);
  colourB = color(0, 10, 100);

  noStroke();

  background(white);

  float oX = 0;
  float oY = 0;

  translate(width/2, height-radius);
  rotate(-HALF_PI);

  for (int j=0; j<6; j++) {

    if (j % 2 == 0) {
      fill(colourA);
      //stroke(colourA);
    }
    else {
      fill(colourB);
      //stroke(colourB);
    }

    beginShape();

    for (int i=180; i<= 300; i+= rate)
    {
      vertex((oX+radius) + cos(radians(i))*radius, oY + sin(radians(i))*radius);
    }
    for (int i=0; i<= 60; i+= rate)
    {
      vertex((oX-radius) + cos(radians(i))*radius, oY + sin(radians(i))*radius);
    }
    for (int i=0; i<= 120; i+= rate)
    {
      vertex(oX + cos(radians(i))*radius, oY + sin(radians(i))*radius);
    }
    for (int i=180; i<= 240; i+= rate)
    {
      vertex((oX+radius*2) + cos(radians(i))*radius, oY + sin(radians(i))*radius);
    }

    endShape(CLOSE);

    translate(radius, 0);
  }

}
