
PShape F, SC, C, A, S;

float es0, es1, es2, es3;
float targetS0, targetS1, targetS2, targetS3;
float angle, angle2;
int mouseTimer = 0;


void setup()
{
  size(1000, 1000);

  F = loadShape ("f.svg");
  SC = loadShape("sc.svg");
  C = loadShape ("C.svg");
  A = loadShape ("A.svg");
  S = loadShape ("slo.svg");

  frameRate(20);

  shapeMode(CENTER);
}


void draw()
{
  background(255);
  smooth();

  if (mousePressed)
  {

    mouseTimer++;
    if (mouseTimer > 0 && mouseTimer<= 30)
    {

      targetS3 = width-300;
    }
    if (mouseTimer > 30 && mouseTimer<= 60)
    {

      targetS3 = width-300;
      targetS2 = width-250;
    }  
    if (mouseTimer > 60 && mouseTimer<= 90)
    {

      targetS3 = width-300;
      targetS2 = width-250;
      targetS1 = width-200;
    }
    if (mouseTimer > 90 && mouseTimer<= 120)
    {

      targetS3 = width-300;
      targetS2 = width-250;
      targetS1 = width-200;
      targetS0 = width-120;
    }
  }

  else
  {
    targetS0 = 700;
    targetS1 = 370;
    targetS2 = 180;
    targetS3 = 100;
  }


  pushMatrix();
  translate (width/2, height/2);
  angle += 0.1;
  rotate (angle);
  es0 += (targetS0 - es0) *0.08;
  shape (SC, 0, 0, es0, es0);
  es2 += (targetS2 - es2) *0.08;
  shape (C, 0, 0, es2, es2);

  angle2 += 0.04;
  rotate (angle2);
  es1 += (targetS1 - es1) *0.08;
  shape (F, 0, 0, es1, es1);
  es3 += (targetS3 - es3) *0.08;
  shape (A, 0, 0, es3, es3);
  popMatrix();

  shape (S, width/2, height/2);
  
  
}

void mouseReleased()
{
  mouseTimer = 0;
}



