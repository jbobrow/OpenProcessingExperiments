
void human(float a , float b)
{
  fill(12,245,146);
  ellipse(a,b,90,90);
  fill(0);
  ellipse(a-13,b-5,5,5);
  ellipse(a+13,b-5,5,5);
  line(a,b,a,b+10);
  line(a-8,b+15,a,b+20);
  line(a,b+20,a+8,b+15);
  line(a,b+45,a,b+100);
  line(a,b+45,a-30,b+90);
  line(a,b+45,a+30,b+90);
  line(a,b+100,a-30,b+160);
  line(a,b+100,a+30,b+160);
  
  
  
}

void setup()
{
  background(255);
  size(500,500);
  smooth();
  human(100,100);
  human(190,100);
}
  

