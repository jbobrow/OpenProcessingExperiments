
Atom[] atom = new Atom[5];
Atom[] cRays = new Atom[5];
Atom[] proton = new Atom[5];

float[] xc = new float[11];
float[] yc = new float[11];
float[] zc = new float[11];
float[] rc = new float[11];

float x = 50;
float y = 250;

boolean hit = false;

void setup() {
  size(500, 500);
  for (int i = 0;i<5;i++) {
    atom[i] = new Atom(x, y, 50, "Nitrogen", color(50, 0, 200)); 
    cRays[i] = new Atom(x, y-200, 15, "Neutron", color(100, 0, 100));
    proton[i] = new Atom(x, y+50, 15, "Proton", color(100, 0, 0));
    x += 100;
  }
  for (int i = 0; i < xc.length; i++) {
    yc[i] = i*50;
  }
}

void draw() {
  background(0, 140, 255);
  stroke(0); 
  for (int i = 0;i<5;i++) {
    atom[i].render();
  }
  for (int i = 0;i<5;i++) {
    if (millis() >= 1500) {
      if (hit == false) {
        cRays[i].render();
        cRays[i].y+=2;
      }
    }
  }
  //lightning
  if (millis() >= 1000 && millis() <= 2000) {
    stroke(200, 250, 0);
    for (int i = 0; i < 11; i++) {
      xc[i] = 75 + random(-20, 20);
      zc[i] = width/2 + random(-20, 20);
      rc[i] = 425 + random(-20, 20);
    }
    for (int i = 0; i < yc.length-1; i++) {
      line(xc[i], yc[i], xc[i+1], yc[i+1]);
      line(zc[i], yc[i], zc[i+1], yc[i+1]);
      line(rc[i], yc[i], rc[i+1], yc[i+1]);
    }
  }
  for (int i = 0;i<5;i++) {
    if (atom[i].hitTest(cRays[i].x, cRays[i].y)) {
      hit = true;
    }
  }
  if (hit){
   for (int i = 0;i<5;i++) {
     atom[i].name = "Carbon-14";
     proton[i].render();
     proton[i].y ++;
      
   } 
  }
}

class Atom {
  float x, y;
  float s;
  String name;
  color c;


  Atom(float _x, float _y, float _s, String _name, color _c) {
    x = _x;
    y = _y;
    s = _s;
    name = _name;
    c = _c;
  }
  void render() {
    fill(c);
    ellipse(x, y, s, s);
    fill(0);
    textSize(10);
    textAlign(CENTER);
    text(name,x,y-s/2-10); 
    x += random(-.4, .4);
    y += random(-.7, .7);
  }

  boolean hitTest(float mx, float my) {
    if (abs(x - mx) < s/2 && abs(y-my) < s/2) {
      return true;
    }
    else {
      return false;
    }
  }
}



