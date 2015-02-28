
float [] posX = {30,60,90,120,150};

void setup()
{
  size(200,200);
  background(0);
}

void draw()
{
  rect(20,0,160,180);
  rect(posX[0],0,10,10);
  rect(posX[1],30,10,10);
  rect(posX[2],60,10,10);
  rect(posX[3],90,10,10);
  rect(posX[4],120,10,10);

if (mouseX < 20 || mouseX > 180|| mouseY >180)
{
  posX[]= posX[random(20,170)];
}
}
