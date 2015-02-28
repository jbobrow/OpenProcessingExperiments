
void setup()
{
  size(300,300);
  faceDrawing(50,50);
  faceDrawing(150,150);
  faceDrawing(50,250);
}

void faceDrawing(int a, int b)
{
  fill(255);
  ellipse(a,b,100,100);
  

  
  fill(0);
  ellipse(a-25 , b-15 , 10,10);
  rect(a+15 , b-25 ,20, 20);
  
  noFill();
  arc(a, b+15 , 30 , 10 , 0, PI);
  arc(a, b+15 , 30, 30, 0,PI);
  arc(a+25,b-5,30,10,0,PI);
  
  stroke(0);
  strokeWeight(3);
  line(a-40,b-30,a-5,b-20);
  line(a+5,b-20,a+40,b-30);
  line(a-50,b+10,a+45,b-20);
  
  strokeWeight(1);
  line(a+20,b-5,a+20,b+5);
  line(a+30,b-5,a+30,b+5);
  line(a-7,b+17,a-7,b+27);
  line(a,b+18,a,b+28);
  line(a+7,b+17,a+7,b+27);
  
  
  
}


