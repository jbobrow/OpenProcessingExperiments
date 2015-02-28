
int steps; //number of lines
float r1, r2; 
int sz; //size of one square
float num; // number of squares per line
float scal = .9;

void setup() {
  size(500, 500);
  background(255);
  frameRate(10);
  noFill();
  num = 2;
  sz = int(width/num);
  steps = int(sz/40);
  r1=sz/80.0;
  r2=sz/30.0;

  for (int x = 0; x < num; x++) {
    for (int y = 0; y < num; y++) {
      int sx = x * sz ; //starting points
      int sy = y * sz;
      int mx = x*sz + sz/2 ; //midpoints
      int my = y*sz + sz/2 ;
      createLines(x, y);
    }  
  }  
  filter(BLUR, 2);
  filter(THRESHOLD);

  displayMask();
  filter(BLUR);
}

void draw() {
}

void mouseClicked() {
  background(0);
  setup();
}

void keyPressed() {
  save(random(1234)+".png");
}

void createLines(int _x, int _y) {
  int x = _x;
  int y = _y;
  for (int i = 0; i < steps; i++) {
    stroke(0);
    strokeWeight(random(r1, r2));
    line(x*sz, random(y*sz, (y+1)*sz), (x+1)*sz, random(y*sz, (y+1)*sz));
    line(random(x*sz, (x+1)*sz), y*sz, random(x*sz, (x+1)*sz), (y+1)*sz);
  }
}

void displayMask() {
  PGraphics mask = createGraphics(width, height);
  mask.beginDraw();
  mask.background(255);
  mask.fill(0);
  mask.noStroke();
  for (int x = 0; x < num; x++) {
    for (int y = 0; y < num; y++) {
      int mx = x*sz + sz/2 ; //midpoints
      int my = y*sz + sz/2 ;
      mask.ellipse(mx, my, sz*scal, sz*scal);
    }
  }
  mask.endDraw();
  blend(mask, 0, 0, width, height, 0, 0, width, height, LIGHTEST);
  //image(mask, 0, 0);
}
