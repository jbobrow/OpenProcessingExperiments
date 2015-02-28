
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

fill(2,12,223,100);
stroke(1);
beginShape(TRIANGLE_STRIP);
vertex(100,300);
vertex(150,50);
vertex(200,60);
vertex(175,350);
vertex(250,320);
vertex(300,20);
endShape();

