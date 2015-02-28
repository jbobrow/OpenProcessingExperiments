
size (600, 300);
background(0);
// controls squares and arcs
for (float y = 0; y <= 200; y ++) {
  fill(66, 250, 76, 25);
  noStroke();
  rect(random(width-25), y+50, (width+2), y/4);

  for (float x = 30; x < width; x +=10) {
    stroke(155);
    fill(200, 35, 150);
    arc(150, x+10, x, 10, 5, 20);
  }
}
// controls lines
for (int z= 250; z < width; z++) {
  stroke(200, 66, 250);
  line(z +1, z/2, z+300, 0);
}


