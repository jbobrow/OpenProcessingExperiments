

void setup()
{
  smooth();
  
  size(300,300);
  
  fill(245,194,143);
  ellipse(50,50,100,100);
  ellipse(150,50,100,100);
  
  
  strokeWeight(10);
  line(35,30,35,50);
  line(65,30,65,50);
  line(135,30,135,50);
  line(165,30,165,50);
  
  strokeWeight(2);
  ellipse(60,75,20,15);
  ellipse(160,75,20,15);

  noStroke();
  fill(245,10,179);
  ellipse(28,70,20,10);
  ellipse(128,70,20,10);
}

