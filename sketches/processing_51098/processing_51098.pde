
size(800, 800);
background(0);
smooth();



for (int i = 0; i<height; i+=2) 
{
  fill(0,0,100);
  stroke(0,random(100,255),0);
  strokeWeight(random(1,3));
  rect(-i, i, i, i);
  rotate(5);
  
}

for (int i = 0; i<width; i+=2) 
{
  fill(255,50,i);
  stroke(0,100,100);
  strokeWeight(random(1,3));
  rect(i, 800, i/2, i/2);
  rotate(10);
  
}


