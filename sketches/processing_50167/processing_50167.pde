
//HW #3
//copyright 2012 mdanver 

void setup ()
{
  size(500,500);
  background(245);
  noStroke();
}

void draw()
{
  if(mousePressed == true)
  {ellipse(mouseX,mouseY,20,20);
   // fill(255,255,255);
   // rect(0,0,width,height);
  
  }
  else{
  fill(255,255,255,10);
rect(0,0,width,height);
  fill(random(23,123),234,random(134,234));
  ellipse(mouseX,mouseY,random(20,40),random(20,40));
  }
}



