
/**
<p>Use mouse to control it. Use left button to organize it's movement, right to organize it's position. Scroll to change it's calmness</p>
*/
 
int n = 2000; // number of cells
float bd = 30; // base line length
float sp = 0.001; // rotation speed step
float sl = .9; // slow down rate

float bcg_color = 0;
 
Cell[] all = new Cell[n];
 
public class Cell{

  float x, y;
  float x_start, y_start;
  float s = 0; // spin velocity
  float c = 0; // current angle

  Cell(float x, float y) {
    this.x=x;
    this.y=y;
    this.x_start = x;
    this.y_start = y;
  }

  void sense() {
    if(pmouseX != 0 || pmouseY != 0)
      s += log(sp * .5 * abs(det(x, y, pmouseX, pmouseY, mouseX, mouseY)) / (dist(x, y, mouseX, mouseY) + 1) + 1);
    s *= sl + 0.01;
    c += s;
    float d = bd * s + .001;
    stroke((50 + abs(d)*5));
    line(x, y, x + d * cos(c), y + d * sin(c));
    x = (x + (.5 * d * cos(c)));
    y = (y + (.5 * d * sin(c)));
  }

  void reset(){
    x = x_start;
    y = y_start;
  }
}
 
void setup(){
  size(1000, 600, P2D);
  // for full-size web:
//  size(window.innerWidth, window.innerHeight);
  int w = min(width - 300, 600);
  int h = min(height - 300, 400);
  for(int i = 0; i < n; i++){
    // float xx = random(w) + (width - w)/2;
    // float yy = random(h) + (height - h)/2);
    all[i] = new Cell(random(w) + (width - w)/2, random(h) + (height - h)/2);
  }
  bcg_color = map(sl, .85, .99, 40, 0);
}
 
void draw() {
//  fill(max(min(1000 - millis()/10,255), bcg_color));
  background(bcg_color);
//  text("Use mouse to control it. \nUse left button to organize it's movement, \nright to organize it's position\nScroll to change it's calmness", 100, 100);
  for(int i = 0; i < n; i++)
    all[i].sense();
}
 
void mousePressed() {
  float c = random(0, 2*PI);
  if (mouseButton == LEFT) {
    for(int i=0;i<n;i++)
      all[i].c = c;
  } else {
    for(int i = 0; i < n; i++)
      all[i].reset();
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  sl = max(min(sl + e/200, .99), .85);
  bcg_color = map(sl, .85, .99, 40, 0);
}

// for web scrolling
void mouseScrolled() {
   if(mouseScroll > 0) {
      sl = max(min(sl + 1/200, .99), .85);
      bcg_color = map(sl, .85, .99, 40, 0);
   } else {
      sl = max(min(sl - 1/200, .99), .85);
      bcg_color = map(sl, .85, .99, 40, 0);
   }
}

float det(float x1, float y1, float x2, float y2, float x3, float y3) {
  return (float) ((x2-x1)*(y3-y1) - (x3-x1)*(y2-y1));
}


