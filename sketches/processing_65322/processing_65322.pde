
float rs1;
float rs2;
float rs3;
float rs4;
float rs5;
float rs6;

void setup()
{
  size(400,400);
  smooth();
  noFill();
  background(51);
}

void draw()
{
  stroke(random(255),random(255),random(255));
  strokeWeight(random(3,7));
  rs1 = random(40,80);
  rs2 = random(100,140);
  rs3 = random(160,200);
  rs4 = random(220,260);
  rs5 = random(280,320);
  rs6 = random(340,400);
  ellipse(200,400,rs1,rs1);
  ellipse(200,400,rs2,rs2);
  ellipse(200,400,rs3,rs3);
  ellipse(200,400,rs4,rs4);
  ellipse(200,400,rs5,rs5);
  ellipse(200,400,rs6,rs6);
}

