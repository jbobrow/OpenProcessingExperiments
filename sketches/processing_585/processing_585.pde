
float twist = -3.34;
boolean twisting = true;
int threadcount = 60;
int beadcount = 60;
int bgcolor = 255;

void setup ()
{
  size(900,450,P3D);
  noStroke();
}

void draw()
{
  background(0);
  fill(255,255,255,200);

  translate(150,-50,-100);
  rotateX(0.99);

  for (int j = 1; j <= threadcount; j += 2 )
  {
    pushMatrix();  
    translate(10*j, 0, 0); 

    for (int i = 0; i <= beadcount; i++)
    {
      translate(10, 10, 0);
      float twistlimit = constrain(twist, -PI, PI);
      rotateY(twistlimit);
      ellipse(0,0,10,10);
    } 

    popMatrix();
  }

  if (twist > 3.34) twisting = false;
  else if (twist <= -3.34) twisting = true;

  if (twisting == true) twist += 0.01;
  else if (twisting == false) twist -= 0.01;
}

