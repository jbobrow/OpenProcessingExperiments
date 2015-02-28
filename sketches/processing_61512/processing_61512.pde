
void setup()
{
  size(400,400);
  face(150,50);
  face(50,50);
}

void face(float a,float b)
{
  float A;
  A=a-33;
  noFill();
  ellipse(a,b,100,100);
  ellipse(a+8,b+18,30,30);
  fill(0);
  rect(a-30,b-20,20,10);
  rect(a+20,b-20,20,10);
  for(int i=0; i<5; i++)
{
  line(A+50,b,A+55,b-5);
  line(A,b,A+5,b-5);
  A+=4;
}
}

