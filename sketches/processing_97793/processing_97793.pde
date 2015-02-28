
size(500, 250);
background(247,200,95);

for (int b=10; b<500; b+=10)
  {if (b >=10 && b<490)
  {strokeWeight(2.5);
  stroke(255,b+10,0);    
  }
    if (b >= 10 && b<250)  
  {
    line(b, 10, b+10, 30);
  }    
    if (b>=10 && b<300)
{   
    line(b, 40, b+15, 70);      
}

  if (b>=10 && b<350)
  {
    line(b,80,b+23,120);
  }
  
  if (b>=10 && b<400)
  {
    line(b,130,b+30,180);
  }
  
  if (b>=10 && b<490)
  {
    line(b,190,b+40,250);
    strokeWeight(1);
    stroke(255,150);
    line(b,0,0,b);
    //line(
  }
  else
  {
    noStroke();
    fill(255,255,190,245);
    ellipse(100, 100, 150, 150);    
  }
  
  }


