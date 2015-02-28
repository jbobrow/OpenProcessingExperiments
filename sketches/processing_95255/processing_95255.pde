
// Fuzzy

int r = 250;

void setup() {
  size(600,600);
  background(0);
  stroke(255,random(255),255,random(255));
  noFill();
  strokeWeight(3);
  translate(300,300);
  strokeWeight(1);
}

void draw() {
  translate(300,300);
  float o = random(360);
  float s = random(360);
  float x = r * cos(o); 
  float y = r * sin(o);
  float a = r * cos(s);
  float b = r * sin(s);
  stroke(o,s,255,random(255));
  bezier(x,y,lerp(x,0,0.5),lerp(y,0,0.5),lerp(a,0,0.5),lerp(b,0,0.5),a,b);    // Draw the beziers
}


