
size(400, 400);
background(75);

for (int a=5; a<400; a+=5)
{
  for (int b=0; b<=400; b+=10) 
  {
    stroke(90, 155, 255);
    strokeWeight(1);
    line (a, b, a, b+399);  
    if (b<200)
    {
      /*stroke(20,110,255);
       strokeWeight(5);
       line(125,200,200,300);
       line(130,160,200,240);
       line(150,130,200,160);
       stroke(190,255,231);*/
      fill(50);
      ellipse(200,400,100,100);
      stroke(90,b*2.5,255);
      strokeWeight(2);
      line(b, b, 200, 400);
    }
    if (b>=200)
    {
      /*stroke(20,110,255);
       strokeWeight(5);
       line(200,300,275,200);
       line(270,160,200,240);
       line(250,130,200,160);
       stroke(190,255,231);*/
      stroke(90,b/1.5,255);
      strokeWeight(2);
      line(b, 400-b, 200, 400);
    }
  }
}

fill(90, 155, 255, 150);
strokeWeight(2);
triangle(0, 0, 200, 200, 400, 0);




