
size(600, 600);
int N = 100;
float[] color1 = new float[3];
background(0);
smooth();

for (int i = N; i >= 0; i--) {
  fill(random(0,255));
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(2);
  ellipse(width/2, height/2, 10*i, 10*i);
}



