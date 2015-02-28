
int r,g,b,xCoord,yCoord, sizeW;
size(800,600);
background(0);
noStroke();
//smooth();
for (int i = 0; i < 100; i = i+1) {
  r=int(random(255));
  g=int(random(255));
  b=int(random(255));
  xCoord=int(random(800));
  yCoord=int(random(600));
  sizeW=64; //int(random(200));
  fill(r,g,b, 100);
  ellipse(xCoord,yCoord,sizeW,sizeW);
}


