
size(800, 800);
background(220, 240, 250);
smooth();


for (int x = 20; x <= 900; x += 20) {
  for (int y = 20; y <= x; y += 20) {
      strokeCap(SQUARE);
      strokeWeight(2);
      stroke(random(255), random(255), random(255)); 
      line(0, y-20, width, y-20);
  }
}

 
for (int x = 20; x <= 900; x += 20) {
  for (int y = 20; y <= x; y += 20) {
      strokeCap(SQUARE);
      strokeWeight(2);
      line(x-20, y-20, x-20, height);
  }
}

 
for (int x = 20; x <= 900; x += 20) {
  for (int y = 20; y <= 900; y += 20) {
      noFill();
      stroke(255);
      strokeWeight(2);
      rect(x-25,y-25,30,30);
  }
}


for (int x = 20; x <= 900; x += 40) {
  for (int y = 20; y <= 900; y += 40) {
      fill(255);
      stroke(255);
      strokeWeight(2);
      rect(x-25,y-25,10,10);
  }
}
