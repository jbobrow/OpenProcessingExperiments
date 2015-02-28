
size(500, 500);
smooth();
background(225);


for (int x=10; x<500; x+=30) {
  for (int y=5; y<500;y+=12) {

  stroke(23, 114, 163, 60);
    line(x/2, y/2, x+20, X*9);
  }
}


for (int x=5; x<500; x+=30) {
  for (int y=10; y<500;y+=12) {

  stroke(163,125,148,60);
    line(x/2, y, x+90, X-9);
  }
}


for (int x=5; x<500; x+=30) {
  for (int y=20; y<500;y+=12) {

  stroke(63,12,14,6);
    line(x*8, y*5, x+9, X-9);
  }
}               
