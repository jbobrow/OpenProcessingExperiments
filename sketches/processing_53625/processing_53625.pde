


void setup() {
  size(300, 300);
  smooth();
  frameRate(4); // the speed that the refresh rate changes. Higher = faster.
  noStroke();
} 

void draw() {
  background (50, 0, 200);

for (int p=0; p<width; p+=11) { // increase by 11

// ---- LERP COLORS------
color from = color(0, 80, 98);
color to = color(120, 109, 190);

color george = color(100, 200, 187);
color lewis = color(255, 180, 99);


color start1 = lerpColor(from, to, (float)p/width);
color end1 = lerpColor(george,lewis, (float)p/width);

// ------ END LERP COLORS -------

fill(start1);
stroke (start1);
strokeWeight (20);
ellipse (p, p, p, p);

fill(end1);
stroke(end1);
strokeWeight(200);
rect(p,p,p,p);
}
}




