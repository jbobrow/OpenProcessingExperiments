
size (400, 300);
background(0);
colorMode(RGB,200);
smooth();

for (int x = 0; x < height; x = x+20){
  noFill();
  stroke(200);
  rect(x, x, 20,20);
}

for (int x = 20; x < height; x = x+x) {
  stroke(x);
  strokeWeight(x);
  line(x, x, x, x);
}

