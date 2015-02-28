
size(400,400);
colorMode(HSB,360,100,100);
background(281,70,70);
strokeWeight(3);
stroke(100,100,100);

for(int x=40; x<1300; x+=80){
  for(int y=5; y<300; y+=3){
    line(x,50,x,50+y);
  }
}

