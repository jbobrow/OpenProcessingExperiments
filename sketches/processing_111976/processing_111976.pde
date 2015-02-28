
size (400,400);
background(255);

for(int y=0; y<400; y+=20){
  for(int x=0; x<400;x+=20){
    fill((x+y)/5,(x+y)/3,(x+y));
    stroke(255-(x+y),225-(x+y)/8,225-(x+y)/2);
    rect(x,y,20,20);
  }
}
