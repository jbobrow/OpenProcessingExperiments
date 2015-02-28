
size(400,400);

for(int x= -1; x<400; x+=10){
  for(int y = -1; y<400;y +=10){
    line(x,0,x,400);
    line(x,y,400,y);
    ellipse(x,y,10,10);
    ellipse(x,y,10,10);
  }
}


