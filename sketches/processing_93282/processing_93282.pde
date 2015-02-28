
for (int x=0; x<110; x+=10) {
  for(int y=0; y<110; y+=10) {
  fill(0,x*1.090,x*1.581,x-80);
  strokeWeight(3);
  stroke(0,120,174,x-10); 
  ellipse(x-10,y-10,x,y); }
}


