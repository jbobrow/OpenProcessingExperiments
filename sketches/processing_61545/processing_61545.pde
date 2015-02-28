
void setup()
{
  size(500, 500);

}
void draw()
{
    for (int i=50;i<=450; i+=100)
  {
    for (int j=50; j<=450; j+=100)
    {
      face(i, j);
    }
  }
}
void face(int a, int b)
{
  fill(b%255,a%255,a%255);
  ellipse(a, b, 100, 100);
  //  noFill();
  arc(a-25, b-20, 10, 10, radians(180), 2*PI);
  arc(a+25, b-20, 10, 10, radians(180), 2*PI);
  
 
  fill(random(255),random(255),random(255));
  ellipse(a,b,8,8);
  
  
  fill(random(255),0,0);
  triangle(a-15, b+15, a+15, b+15, a, b+25);
  
stroke(255,0,0);
 line(a-30,b+3,a-40,b+15);
 line(a-25,b+3,a-35,b+15);
 line(a-20,b+3,a-30,b+15);
 line(a-20+50,b+3,a-30+50,b+15);
 line(a-20+55,b+3,a-30+55,b+15);
  line(a-20+60,b+3,a-30+60,b+15);
  
  stroke(0);
}

