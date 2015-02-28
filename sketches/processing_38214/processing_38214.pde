
size(400,400);
background(255);


for (int x = 0; x<500; x=x+15) {
  for(int y = 0; y<500; y=y+15) {
  stroke(x*2%255,x*100%255,x*100%255);
  strokeWeight(2);
  line(x,0,x,400);
  strokeWeight(2);
  stroke(255);
  line(0,y,400,y);
} 
}

