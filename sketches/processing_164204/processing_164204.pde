
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  fill(rot, grun, blau);
 rect(0,0,100,500);

fill(grun, blau, rot);
 rect(100,0,100,500);

fill( blau,rot, grun);
 rect(200,0,100,500);
save("Test.png"); 
}
