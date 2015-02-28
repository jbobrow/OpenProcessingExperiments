
float x = random(width);
float y = random(height);
float c = random(width);
float v = random(height);
float b = random(width);
float n = random(height);
float mx = random(1, 2);
float my = random(1, 2);
float mc = random(1, 2);
float mv = random(1, 2);
float mb = random(1, 2);
float mn = random(1, 2);

float q = random(width);
float w = random(height);
float e = random(width);
float r = random(height);
float t = random(width);
float u = random(height);
float i = random(width);
float o = random(height);
float mq = random(1, 2);
float mw = random(1, 2);
float me = random(1, 2);
float mr = random(1, 2);
float mt = random(1, 2);
float mu = random(1, 2);
float mi = random(1, 2);
float mo = random(1, 2);

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  stroke(255);
  beginShape();
  vertex(x, y);
  vertex(c, v);
  vertex(b, n);
  vertex(q, w);
  vertex(e, r);
  vertex(t, u);
  vertex(i, o);
  endShape();
  moveBall();
}

void moveBall() {
  x+=mx;
  y+=my;
  c+=mc;
  v+=mv;
  b+=mb;
  n+=mn;
  q+=mx;
  w+=mw;
  e+=me;
  r+=mr;
  t+=mt;
  u+=mu;
  i+=mi;
  o+=mo;
  if (x>width || x<0)mx=mx *-1;
  if (y>height || y<0)my=my *-1;
  if (c>width || c<0)mc=mc *-1;
  if (v>height || v<0)mv=mv *-1;
  if (b>width || b<0)mb=mb *-1;
  if (n>height || n<0)mn=mn *-1;
  if (q>width || q<0)mq=mq *-1;
  if (w>height || w<0)mw=mw *-1;
  if (e>width || e<0)me=me *-1;
  if (r>height || r<0)mr=mr *-1;
  if (t>width || t<0)mt=mt *-1;
  if (u>height || u<0)mu=mu *-1;
  if (i>width || i<0)mi=mi *-1;
  if (o>height || o<0)mo=mo *-1;
}



