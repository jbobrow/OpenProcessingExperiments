
int m = 2;
float r = 20;

void setup() {
  size(600, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(0);
  noLoop();
  smooth();
  prepVals();
}
void prepVals() {
  colorMode(HSB, m, m, m);
  background(0);
  stroke(0); 
  strokeWeight(r/20);
}

color getColor(int v) {
  if(v==0)
    return color(0,0,.5*m); //grey
  // return color(v, -.5*m*sin(PI*v/m)+m, -.5*m*cos(PI*v/m)+.85*m);
  // return color(v,m*sin(PI/v)+(m-v),.2*m*cos(5*PI*v/m)+.3*v*m);
  return color(v, m*sin(PI/v)+(m-v), m*log(v+1));
  //return color(v,m*sin(PI/v)+v,m*v/2);
}

int[] computeNextRow(int[] lastVals) {
  int[] vals = new int[lastVals.length+1];
  vals[0]=1;
  for (int n=1; n<vals.length-1; n++)
    vals[n] = (lastVals[n-1] + lastVals[n])%m;
  vals[vals.length-1] = 1;
  return vals;
}

void draw() {
  int[] vals = new int[1];
  vals[0] = 1;
  for (int row=0;row<height/r;row++)
  {
    for (int col=0;col<=row;col++) {
      float py = (row+1)*r;
      float p0x = 0.5*(width - r*(row)) + (col)*r;
      color c = getColor(vals[col]);
      fill(c);
      ellipse(p0x, py, r, r);
    }
    vals = computeNextRow(vals);
  }
}
void mouseMoved() {
  int row = floor((mouseY+.5*r)/r)-1;
  int col = floor((mouseX - .5*width)/r+.5*(row+1));
  row = (row<0)? 0 : min(row, floor(height/r));
  col = (col<0)? 0 : min(col, row);
  if (javascript != null)
    javascript.updateRowCol(row, col, m);
//  println(row+", "+col+", "+m);
}

void setModCheckRedraw(int _m){
if(_m != m){
  m = _m;
  prepVals();
  redraw();
}
}
void setRadius(float _r){
r = _r;
prepVals();
redraw();
}
interface JavaScript {
  void checkUpdates();
  void updateRowCol(int r, int c, int m);
}
void bindJavascript(JavaScript js) {
  javascript = js;
}
JavaScript javascript;


