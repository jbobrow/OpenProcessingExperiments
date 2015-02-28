

color a = color(random(255), random(255), random(255));
color b = color(random(255), random(255), random(255));
color c = color(random(255), random(255), random(255));
color d = color(random(255), random(255), random(255));
color e = color(random(255), random(255), random(255));
color f = color(random(255), random(255), random(255));
//float g = random(0.25, 1.0);
//float h = random(0.25, 1.0);
//float i = random(0.25, 1.0);
//float j = random(0.25, 1.0);
//float k = random(0.25, 1.0);
//float l = random(0.25, 1.0);


void setup()
{
  //600 width by 800 height
  size(600, 600);
  //smooth lines
  smooth();
}

void draw()
{
  //grey background
  background(250, 154, 228);
  randomSeed(0);
  for (int x=35; x < width + 70; x += 70)
  {
    float g = random(1.0, 1.0);
    float h = random(0.60, 1.0);
    float i = random(0.70, 1.0);
    float j = random(1.0, 1.0);
    float k = random(0.80, 1.0);
    float l = random(0.70, 1.0);
    owl(x, 100, a, g);
    owl(x, 200, b, h);
    owl(x, 300, c, i);
    owl(x, 400, d, j);
    owl(x, 500, e, k);
    owl(x, 600, f, l);
  }
}

void owl(int x, int y, int c, float s)
{
  pushMatrix();
  translate(x, y);
  scale(s);
  stroke(0);
  //thickness of the line
  strokeWeight(70);
  //body of owl
  line(0, -35, 0, -65);
  //stroke now turned off
  noStroke();
  //left eye dome
  //random fill on left eye dome
  fill(c);
  ellipse(-17.5, -65, 35, 35);
  //right eye dome
  //random fill on right eye dome
  fill(c);
  ellipse(17.5, -65, 35, 35);
  //chin and random fill
  fill(c);
  arc(0, -65, 70, 70, 0, PI);
  //black fill
  fill(0);
  //left eye
  ellipse(-14, -65, 8, 8);
  //right eye
  ellipse(14, -65, 8, 8);
  //beak
  fill(0);
  quad(0, -58, 4, -51, 0, -44, -4, -51);
  popMatrix();
}


