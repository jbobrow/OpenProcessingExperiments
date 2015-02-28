
//Dedicated to my Dad.
float mdp, k, emdp, t = 0;
boolean mau, wmau;
void setup() {
  size(768, 512);
  stroke(255);
  strokeWeight(1);
  smooth();
  colorMode(HSB);
  mau = true;
}
void draw() {
    if(mousePressed) { if(!wmau) mau = !mau; wmau = true; t = 0; } else wmau = false;
    if(keyPressed&&mau) frameRate(9); else frameRate(60);
  background(0);
  for(int i = 0; i < 1; i++)
    recu(mouseX-width/2, mouseY-height/2, 700+i, mouseX-width/2, mouseY-height/2);
  t++;
  k = 10+sin(t/300+emdp/30)*5;
  mdp = dist(mouseX, mouseY, pmouseX, pmouseY);
  emdp += mdp;
  emdp /= 1.1;
}
//It's all one line :P
void recu(int x, int y, float id, float px, float py) {
  if(!mau) point(x+width/2, y+height/2); else
  line(x+width/2, y+height/2, px+width/2, py+height/2);
  float r = 0; if(mau) r = id*id*sin(t/50000); else r = id;
  int nx = int(x+k*sin(r)*mix(1, 4*sin((id+t/10)/30), 0.1));
  int ny = int(y+k*cos(r)*mix(1, 4*sin((id+t/10)/30), 0.1));
    if(id>0) recu(nx, ny, id-0.7, x, y);
}
float mix(float x, float y, float a) { return x*(1-a)+y*a; }

