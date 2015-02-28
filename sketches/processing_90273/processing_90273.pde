
int n=100;
int x;
float y=.05;
float noiseY;

size(800,200);
background(#21445B);
stroke(#5D8A66);
strokeWeight(50);

for (int i=1; i < n; i++) {
  y+=.02;
  x=i* (width/n);
  noiseY= noise(y) * height;
  line(x, height, x, noiseY);
}
