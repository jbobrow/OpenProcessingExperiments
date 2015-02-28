
char k= (char)((int) random(26)+65); 

void setup() {
  size(500, 500);  
  colorMode(HSB);
  smooth();
  noStroke();

  spirale();
}

void spirale() {
  background(0);  
  // translate(width/2, height/2); not in JS !?
  int trans= (int) random(100)+30; // transparency
  int sz= (int) random(120)+10;  // size
  int cshift = (int) random(256); // shift all colors
  int  hi= (int) random(256); // first color
  int  ha= (int) random(256); // last color
  if (hi>ha) { // switch colors if first > last
    int inb = hi;
    hi = ha;
    ha = inb;
  }
  int noS= (int) random(1000, 5000); // number of ellipses
  float  noR= random(6)*TWO_PI; // number of basic-rotations

  int  noLS= (int)((float)noS * random(0.5-0.9));

  float  ws= noR / noLS; // rotation

  float r=15; // initial size
  float  rs= (float)400/noS; // size increase
  float w=0; // initial angle
  
  for (int i=0; i<noS;i++) {
   float x= cos(w)*r+width/2; // for JS, add to translate into the middl
  float  y= sin(w)*r+height/2;
    float f= (float)i / noLS;
    color c= color((cshift+lerp(hi, ha, f))%256, 250, 250, trans);
    fill(c);
    ellipse(x, y, sz, sz);
    w+= ws;   
    r+= rs;

    if (x+sz<0 || x-sz>width || y+sz <0 || y-sz>height) // getout if off the screen
      break;
  }
}

void mousePressed() {
  if (mouseButton==RIGHT)
    saveFrame("p"+k+"##.png");
  spirale();
}

void draw() {
}



