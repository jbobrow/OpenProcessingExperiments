
size(500, 500);
background(0);
smooth();

fill(#EE4036);
noStroke();
ellipse (width/2, height/2, 250, 250);

ellipse (width/2, 420, 40, 40);

fill(0);
noStroke();
ellipse (width/2, height/2, 70, 70);

for (int x = 0; x < width; x += 20) {
  for (int y = 0; y < height; y += 20) {
    stroke(255);
    strokeWeight(3);
    line (x, y, x, y);
  }
}

for (int x = 0; x < width; x += 5) {
  for (int y = 0; y < height; y += 5) {
    stroke(255);
    strokeWeight(1);
    line (x, y, x, y);
  }
}

noFill();
for (int x = 0; x < width; x += 10) {
  stroke(255);
  strokeWeight(1);
  line (0, x, x, height);
}

for (int x = 0; x < width; x += 10) {
  stroke(255);
  strokeWeight(1);
  line (x, 0, width, x);
}


for (float w = 200; w > 0; w = w-20) {
  noFill();
  strokeWeight(1);
  stroke(255);
  ellipse (width/2, height/2, w, w);
}

ellipse (width/2, height/2, 350, 350);

strokeWeight(2);
line (100, 250, 400, 250);
strokeWeight(1);
line (500, 0, 0, 500);


