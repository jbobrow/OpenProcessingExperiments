
void setup()
{
  size(500,500);
}

void draw()
{
}

void keyPressed()
{
  background(0);
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  fill(rot,grun,blau);
  ellipse(250,250, 350, 350);
  
  fill(255-rot, 255-grun, 255-blau);
  triangle(220,20, 280,20, 250,230);
  triangle(20,220, 20,280, 230,250);
  triangle(480,220, 480,280, 270,250);
  triangle(220,480, 280,480, 250, 270);
  
  fill((grun+blau)/2,(rot+blau)/2,(rot+grun)/2);
  ellipse(250,250, 35,35);
}

