
//Quad/rects - pattern02

size(500,500);
smooth();
 
for(int x= 0; x< width; x+=10)
{
  for(int y=0; y<height; y+=10)
  {
    stroke (255,249,196);
    strokeWeight(1);
    fill(86,174,152);
    rect(x,y,100,100);
    
    
  }
}




fill(174,233,218);
strokeWeight(1);
for (int i = 89; i <= 500; i += 5) {
  rect(i + i/10, i, i*10.2, i/3);
}

fill(174,233,218);
strokeWeight(1);
for (int i = 29; i >= 90; i += 10) {
  rect(i + i/6, i, i*1.9, i/2);
}

