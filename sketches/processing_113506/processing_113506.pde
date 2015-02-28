

int eSize = 70;
size(800, 800);
colorMode(HSB, 800);
smooth();
background(0);
noStroke();
 
for(int y=0; y<=800; y+=100) {
  for(int x=0; x<=800; x+=100) {
    fill(x, 700, 800-y, 800);
    ellipse(x,y+50,eSize,eSize-y/25);
  }
}


