
size(500,500);
background(255);

for (int i = 10; i < height; i = i+20) {
  fill (0,0,255);
  rect(0,i,10,10);
}


for(int i = 0; i < width; i=i+20) {
  fill(0);
  rect(i,50,10,10);
}

for (int i = 10; i < width; i = i+20) {
  fill (0,255,0);
  rect(i,50,10,10);
}

for (int i = 00; i < height; i = i+20) {
  fill (255,0,0);
  rect(0,i,10,10);
}

