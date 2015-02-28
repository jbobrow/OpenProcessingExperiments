
size(600, 800);

smooth();
for (int counter = 0; counter < 30; counter = counter+1 /*add one*/) {
  noStroke();
  ellipse(random(width), random(height), 40, 40);
}

for(int line_x = 0; line_x<width; line_x+=20) {
  line(line_x, 0, line_x, height);
  strokeWeight(3);
  stroke(random(255),random(25),random(100), random(255));
}
