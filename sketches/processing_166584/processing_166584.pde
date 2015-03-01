
size(500, 500);
background(92,207,234);
translate(width/2, 1);
noStroke();

for (int i=0; i<20; i++) {
  beginShape(TRIANGLES);
  fill(247,120,190);
  vertex(0,50);
  vertex(-10,70);
  vertex(10,70);
  fill(247,242,75);
  vertex(0,50);
  vertex(10,60);
  vertex(10,40);
  fill(247,120,190);
  vertex(0,50);
  vertex(10,30);
  vertex(-10,30);
   fill(239,231,65);
  vertex(0,50);
  vertex(-10,60);
  vertex(-10,40);
  translate(30,70);
  rotate(PI/7);
  scale(1.05);
  endShape();
}



