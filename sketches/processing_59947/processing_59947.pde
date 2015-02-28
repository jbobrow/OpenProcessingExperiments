
size(400,400, P3D);
colorMode(HSB,360,100,100);
fill(281,70,70);
stroke(100,100,100);

for(float x=55; x<100; x+=50){
  for(float y=5; y<1000; y+=10){
    box(100);
    translate(x,y,-70);
    fill(2*y,70,70);
  }
}


