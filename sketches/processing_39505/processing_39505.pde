
size(400,400);
background(0);
smooth();
noStroke();
fill(255,109,32);

beginShape();
vertex(100,100);
for (int i = 10; i<=400; i+=10) {
  vertex(0,i);
  vertex(i,0);
}
endShape();

fill(131,6,39);
beginShape();
vertex(400,400);
for (int i = 10; i<=400; i+=10) {
  vertex(400,i);
  vertex(i,400);
}
endShape();


