
particle[] particles;
int NUM = 100;
int c;
float begin_fc, f;
float k;
float cur;
int sign;
int l_of_line;
float d_line_points;
void setup() {
  size(450,450, P2D);
  noFill();
  background(0);
  colorMode(HSB, 100);
  particles = new particle[NUM];
  k=1000;
  c = 0;
  f = 5;
  sign = 1;
  l_of_line = int(pow(12,5));
  d_line_points = 0.2;
  stroke(100);
  redraw_field();
}

void draw() {  
  if (mousePressed) {
    ellipse(mouseX, mouseY, f*(frameCount-begin_fc), f*(frameCount-begin_fc));
  }
  if(keyPressed){
    if(key=='l'){
      line_of_force(mouseX,mouseY,l_of_line,d_line_points);
    }
  }
}

void redraw_field(){
  loadPixels();
  
  for (int p = 0; p < width*height; p++) {
      float x = p%width;
      float y = (p - x)/width;
      cur = calc_elec_field_co(x, y).mag();
      pixels[p] = color(10*log(cur), 100, 100*log(cur));
    }
  updatePixels();
}

void mousePressed() {
  begin_fc = frameCount;
}

void keyPressed() {
  if (key == ' ') {
    redraw_field();
  }
  if (key == 'r') {
    c = 0;
    redraw_field();
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    sign = 1;
  }
  else if (mouseButton == RIGHT) {
    sign = -1;
  }
  particles[c] = new particle(mouseX, mouseY, f*(frameCount - begin_fc)*sign);
  c= (c + 1) % NUM;
}

class particle {
  float charge;
  PVector pos;
  particle(float _x, float _y, float _c) {
    charge = _c;
    pos = new PVector(_x, _y);
  }
}

PVector calc_elec_field_co(float x, float y) {
  PVector pos = new PVector(x, y);
  return calc_elec_field(pos);
  
}

PVector calc_elec_field(PVector pos) {
  PVector res = new PVector(0, 0);
  float d;
  for (int i=0; i < c; i++) {
    PVector cur = new PVector(0, 0);
    cur = PVector.sub(pos, particles[i].pos);
    d = cur.mag();
    cur.normalize();
    cur.mult(k*particles[i].charge/(d*d));
    res.add(cur);
  }
  return res;
}

void line_of_force(float x0, float y0, int end, float ds){
  PVector position, _position;
  PVector fieldhere;
  position = new PVector(x0,y0);
  _position = new PVector(x0,y0);
  fieldhere = new PVector(0,0);
  for(int i = 0; i < end / 2; i++){
    point(position.x, position.y);
    point(_position.x,_position.y);
    fieldhere = calc_elec_field(position);
    fieldhere.normalize();
    fieldhere.mult(ds);
    position.add(fieldhere);
    fieldhere = calc_elec_field(_position);
    fieldhere.normalize();
    fieldhere.mult(ds);
    _position.sub(fieldhere);
  }
}


