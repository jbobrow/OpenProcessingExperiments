
int[] x = {90, 30, 80, 50, 10, 90, 30, 50, 80, 10, 300, 90};
int[] y = {50, 10, 20, 30, 40, 90, 80, 70, 100, 90, 100, 20};

size(400,400);
background(80, 100, 90);
fill(100, 250, 200, 50);
stroke(90, 100, 90, 10);

beginShape();
for(int i = 0; i<x.length; i++) {
  vertex(x[i], y[i]);
}
endShape(CLOSE);




