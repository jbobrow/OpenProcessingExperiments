
int eSize = 3;

size(510, 510);
background(0);
stroke(0);

for(int i = 50; i <= width; i += 50) {
  noStroke();
  fill(0, 255, 255, 17);
  ellipse(255, 255, i, i);
}  


for(int x = 0; x <= width; x += 150) {
  for(int y = 0; y <= height; y += 150) {
    strokeWeight(15);
    stroke(255, 255, 255, 77);
    line(255, 255, x, y);
  }
}

for(int x = 0; x <= width; x += 100) {
  for(int y = 0; y <= height; y += 100) {
    strokeWeight(10);
    stroke(255, 0, 0, 77);
    line(255, 255, x, y);
  }
}


for(int i = 50; i <= width; i += 50) {
  noStroke();
  fill(0, 255, 255, 17);
  ellipse(255, 255, i, i);
}  

for(int x = 0; x <= width; x += 50) {
  for(int y = 0; y <= height; y += 50) {
    strokeWeight(3);
    stroke(255, 255, 0, 77);
    line(255, 255, x, y);
  }
}


