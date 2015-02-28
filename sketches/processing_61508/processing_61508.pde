
void setup()
{
  size(300,300);
  face(width/2,height/2);
  face(50,50);
  face(150,50);
  face(250,50);
}

void face(int a, int b)
{
  
  ellipse(a,b,100,100);
  
  fill(0);
  ellipse(a-20,b-15,8,8);
  ellipse(a+20,b-15,8,8);
  
  noFill();
  strokeWeight(3);
  arc(a-30,b-15,50,50,PI/4*5,PI/4*7);
  arc(a+30,b-15,50,50,PI/4*5,PI/4*7);
  
  strokeWeight(2);
  arc(a,b-50,130,150,PI/3,PI*2/3);
}
