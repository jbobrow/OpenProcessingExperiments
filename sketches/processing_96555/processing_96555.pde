
size (200,200);
  background (255);
  int y=10;
  
  for (int x= 50; x<150; x=x+20){
  fill (y*y,y*y,0);
  ellipse (x,50,50,50);
  y=y+2;
  }
