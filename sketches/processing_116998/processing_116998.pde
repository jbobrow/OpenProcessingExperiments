
// colored stripes
// Behnood Eghbali Wed.Oct 23.2013 10:53am
size(800, 600);
smooth();
noStroke();
for(int i = 0; i < width; i++) {
  float r = random(100);
  float x = random(0, width);
  float t = random(x);
    fill(random(t), random(200), random(r), r); 
  rect(x, 0, r, height);
}
