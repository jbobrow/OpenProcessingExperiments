
void setup()
{
  size(600,600);

  faceDrawing(150,150);
  faceDrawing(450,150);
  faceDrawing(300,450);
}

void faceDrawing(int a,int b)
{
  smooth();
  
    fill(240,140,73);
  noStroke();
  arc(a-90,b-60,70,70,140,180);
  arc(a+90,b-60,70,70,140,180);
  
  fill(167,75,14);
 arc(a-90,b-60,50,50,140,180);
  arc(a+90,b-60,50,50,140,180);
  
  fill(240,140,73);
  noStroke();
  ellipse(a,b,200,200);

  fill(255);
  ellipse(a,b+40,120,120);

  fill(0);
  ellipse(a-40,b-30,10,10);
  ellipse(a+40,b-30,10,10);
  ellipse(a,b,15,15);
  

  noFill();
  stroke(0);
  strokeWeight(2);
  arc(a,b+50,70,70,0,PI);


  
  
  
}


