
color[] palette = new color[5];
 
void setup() {
  size(800 , 800);
  smooth();
  noLoop();
 
palette[0] = #000000;
palette[1] = #F25BA1;
palette[2] = #A1F25B;
palette[3] = #5BF2AB;
palette[4] = #AB5BF2;
}
 
void draw() {
  background(255);
 
  generateParanoid(width/2, height/2, 1, 25, 0.1, 0, 1.2*PI, 50);
}
 
void mousePressed() {
  redraw();
  }
 
void keyPressed() {
  saveFrame("blot####.png");
}
 
void generateParanoid(float x, float y, float min, float max, float odds, float lastAngle, float spread, int nLimbs) {
  float angle = ((random(1) - 0.5) * spread) + lastAngle;
  float length = (random(1) * (max - min) + min);
  float x1 = (cos(angle) * length) + x;
  float y1 = (sin(angle) * length) + y;
 
  color c1 = palette[(int) random(5)];
  color c2 = palette[(int) random(5)];
  stroke(c1, 180);
  fill(c2, 180);
 
  float eh = random(min);
  float ev = random(max);
 
  //rect((x1 + x) * 0.5, (y1 + y) * 0.5, eh, ev);
  rect((x1 + x) * 0.5, (y1 + y) * 0.5, length * 0.5, length * 0.5);
  //rect(width - (x1 + x) * 0.5, (y1 + y) * 0.5, eh, ev);
  rect(width - (x1 + x) * 0.5, (y1 + y) * 0.5, length * 0.5, length * 0.5);
 
  if (nLimbs >= 1) {
    generateParanoid(x1, y1, min, max, odds, angle, spread, nLimbs - 1);
 
    if (random(1) < odds) {
      generateParanoid(x1, y1, min, max, odds, angle, spread, nLimbs - 1);
    }
  }
}
