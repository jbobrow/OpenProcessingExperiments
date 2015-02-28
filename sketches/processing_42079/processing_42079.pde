
size(500, 500);
background(0);
smooth();


for (int y = 0; y <= height; y += 15) {
for (int x = 0; x <= width; x += 15) {
  fill(100,40,90);
  noStroke();
  ellipse(x, y, 15, 15);
  fill(200,40,90);
  ellipse(x,y,15-6,15-6);
  stroke(60,40,90);
  strokeWeight(2);
  line(x-15,y-15,x+15,y+15);
  line(x+15,y-15,x-15,y+15);

}
}

