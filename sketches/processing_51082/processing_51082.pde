
size(800, 800);
background(255);
smooth();
strokeWeight(1);
stroke(255);
int d= 150;

for (int x=0; x<=width; x+=10) 
{
  for (int y=0; y<=height; y+=10) 
  {
    if (x%20 ==0) {
     fill(110, 177, 235);
  } else {
    fill(156, 110, 235, 50);
  }
    rect (x*1.15, y*1.15, d, d);
    rotate(10);
    
    
  }
}

