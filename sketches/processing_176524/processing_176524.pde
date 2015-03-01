
int I = 50;
int H = 5;

void setup () {
size(400, 400); 
}

void draw () {
background(#E89FF2);
smooth();
noStroke();
translate(-200, -20);
scale(8.0); 
fill(#09ACEA);
beginShape();
vertex(50, 15);
if (mousePressed) { 
fill (#ED7011);
bezierVertex(I, -5, 75, H, 50, 45);
vertex(50, 15);
bezierVertex(I, -5, 25, H, 50, 45);
endShape();}
else {
  bezierVertex(I, -5, 75, H, 50, 45);
vertex(50, 15);
bezierVertex(I, -5, 25, H, 50, 45);
endShape();
}
}
