
void setup()
{
  size(300,300);

  background(255);

  facedrawing(100,100);
  facedrawing(200,200);
}
void facedrawing(int a,int b)
{
  smooth();
  noStroke();

  fill(255,255,30);
  ellipse(a,b,100,100);

  fill(0);
  ellipse(a-30,b-5,5,5);
  ellipse(a+20,b-5,5,5);

  fill(255,14,4);
  ellipse(a-10,b,10,6);
  ellipse(a-10,b+5,7,5);

  text("PIYAK! PIYAK!",200,50);
}
