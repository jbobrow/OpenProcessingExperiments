
size(480, 120);
background(0);
smooth();
noStroke();
for (int y = 0; y <= height; y +=60) { //height
  for (int x = 0; x <= width; x +=60) { //width
    fill(250, 200);
    ellipse( x, y, 60, 60);
  }
}

for (int y = 0; y <= height; y +=15) { //height  
  for (int x = 0; x <= width; x +=15) { //width
    fill(250, 80);
    ellipse( x, y, 15, 15);
  }
}



