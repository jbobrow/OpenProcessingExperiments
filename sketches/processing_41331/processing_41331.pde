
size(800,800);
smooth();
background(255);

PShape s;
s = loadShape("logo.svg");

for(int i=0; i<height; i++) {
  float r = random(1000);
  stroke(r*5);
  shape(s, i, 400+r, i,i);
}

