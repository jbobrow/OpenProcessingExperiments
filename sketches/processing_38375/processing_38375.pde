
size(500, 500);
smooth();
for (int i = 0; i < 500; i++) {
  stroke(132, i*1, 204);
  line(i, 0, i, 500);
}

int space = 20;

for (float x = 0; x<width; x+=space) {
  for (float y = 0; y<height; y+=space) {
    strokeWeight (abs(3*sin(20*x/width)+(5*sin(20*y/height))));
    point (x, y);
  }
}

noStroke();
fill(#FF8989);
beginShape();
vertex (450, 100);
vertex (39, 100);
vertex (450, 400);
vertex(39, 400); 
endShape(CLOSE);



