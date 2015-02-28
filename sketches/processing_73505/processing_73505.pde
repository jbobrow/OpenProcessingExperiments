
//Matthew Quesada, Computer Programming 4-5
//Rotating Cube

float x=1;
float y=2;
void setup()
{
size(500,500, P3D);
}

void draw()
{
  background(0);
  pointLight(255,255,255,255,255,255);
  camera(7*mouseX,7*mouseY,300,0,0,0,0,1,0);
  rotateX(x);
  rotateY(y);
  fill(11,216,132);
  box(150);
  fill(211,93,229,100);
  box(300);
  strokeWeight(0);
  fill(142,171,242);
  translate(300,300,300);
  sphere(50);
  fill(242,184,76);
  strokeWeight(0);
  translate(-600,-600,-600);
  sphere(50);
  fill(255,124,124);
  noStroke();
  translate(600,0,0);
  sphere(50);
  fill(165);
  noStroke();
  translate(-600,600,600);
  sphere(50);
  x=x+.1;
  y=y+.1;
}
