
int maxCnt;
int halfH, halfW;
float slice;
particle p[];
slider s[];
checkbox c[];

void setup() {
  size(600,400);
  background(0);
  smooth();
  textSize(11);
  colorMode(HSB);
  
  //setup particles
  maxCnt = 800;
  slice = random(1000);
  p = new particle[maxCnt];
  for (int i=0; i<maxCnt; i++)
    p[i] = new particle();
  
  //setup controls
  s = new slider[5];
  c = new checkbox[2];
  s[0] = new slider(10, 30, 150, 10, "Particle Count", .5);
  s[1] = new slider(10, 70, 150, 10, "Flocking", .7);
  s[2] = new slider(10, 110, 150, 10, "Speed", .9);
  s[3] = new slider(10, 150, 150, 10, "Color", .11);
  c[0] = new checkbox(10, 190, 10, "Glow Effect", true);
  c[1] = new checkbox(10, 230, 10, "Trailing Effect", true);
}

void draw() {
  if(c[1].val) {
    noStroke();
    fill(0,0,0,60);
    rect(0,0,width,height);
  } else background(0);
  
  //check particles
  for (int i=0; i<s[0].val*800; i++)
    p[i].check(pow(500,s[1].val), s[2].val*4.0, int(s[3].val*255), c[0].val);
  
  //check controls
  s[0].check(s[0].val*800);
  s[1].check(pow(500, s[1].val));
  s[2].check(s[2].val*4.0);
  s[3].check(s[3].val*255.0);
  c[0].check();
  c[1].check();
}

class particle {
  PVector pos = new PVector(random(width), random(height));
  PVector vel = new PVector(0,0);
  
  void check(float clump, float spd, int clr, boolean bGlow) {
    float x = noise(pos.x/clump, pos.y/clump, slice)*width;
    float y = noise(pos.x/clump, pos.y/clump, 100-slice)*height;
    PVector tmp = new PVector(x, y);
    PVector acc = PVector.sub(tmp, pos);
    acc.normalize();
    acc.mult(.2);
    vel.add(acc); vel.limit(spd); 
    pos.add(vel);
    int offset = 100;
    if(bGlow) {
      noStroke();
      fill(clr,255,255,5);
      ellipse(pos.x+offset, pos.y, 10,10);
    }
    stroke(clr,255,255);    
    point(pos.x+offset, pos.y);
    slice+=.00005;
  }
}

class slider {
  int posX, posY, w, sz;
  String lbl;
  float val;
  
  slider(int _posX, int _posY, int _w, int _sz, String _lbl, float _val) {
    posX = _posX; posY = _posY;
    w = _w; sz = _sz;
    lbl = _lbl;
    val = _val;
  }
  void check(float dispVal) {
    color f = 0; color s = 128;
    int x = posX + int(w * val);
    if (mouseY > posY - sz && mouseY < posY + sz*2 && mouseX > posX && mouseX < posX + w + sz) {
      f = 64; s = 255;
      if (mousePressed) x = constrain(mouseX, posX, posX+w);
    }
    val = (x - posX) / float(w);
    stroke(s); fill(f);
    line(posX, posY + sz*0.5, posX + w + sz, posY + sz*0.5);
    rect(posX + w*val, posY, sz, sz);
    fill(s);
    textAlign(LEFT, CENTER);
    text(lbl, posX, posY-sz);
    textAlign(RIGHT, CENTER);
    text(nfc(dispVal,2), posX+w+sz, posY-sz);
  }  
}

class checkbox {
  int posX, posY, sz;
  String lbl;
  boolean val, hot;
  checkbox(int _posX, int _posY, int _sz, String _lbl, boolean _val) {
    posX = _posX; posY = _posY; sz = _sz;
    lbl = _lbl;
    val = _val;
  }
  void check() {
    color f = 0; color s = 128;
    if (mouseY > posY - sz && mouseY < posY + sz*2 && mouseX > posX - sz && mouseX < posX + sz*2) {
      f = 64; s = 255;
      if(mousePressed) hot = true;
      else if(hot) {
        val = !val;
        hot = false;
      }
    } else hot = false;
    stroke(s); fill(f);
    rect(posX, posY, sz, sz);
    if (val) {
      strokeWeight(2);
      line(posX,posY, posX+sz,posY+sz);
      line(posX+sz,posY, posX,posY+sz);
      strokeWeight(1);
    }
    fill(s);
    textAlign(LEFT, CENTER);
    text(lbl, posX, posY-sz);
  }
}

