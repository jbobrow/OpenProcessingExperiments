
size(500,500);
fill(0, 0, 0);
smooth();
beginShape();
vertex(40,100);
for (int i = 50; i <=300; i +=15) {
  vertex(20, i);
  vertex(30, i);
  vertex(40, i);
  vertex(50, i);
  vertex(60, i);
  vertex(70, i);
  vertex(80, i);
  vertex(90, i);
  vertex(100, i);
  vertex(110, i);
  vertex(120, i);
  vertex(130, i);
}
vertex(40, 100);
endShape();

