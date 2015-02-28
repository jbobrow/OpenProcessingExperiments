
rec[] recs = new rec[150];

void setup() {
  size(300,600);
  smooth();
  for (int i = 0; i < recs.length; i ++ ) {
    recs[i] = new rec(color(i*3),0,i*4,i/20.0); 
  }
}

void draw() {
  background(255);
  for (int i = 0; i < recs.length; i ++ ) {
    recs[i].moure();
    recs[i].dibuixa();
  }
}
class rec { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  rec(color c_, float xpos_, float ypos_, float xspeed_) {
    c = c_;
    xpos = xpos_;
    ypos = ypos_;
    xspeed = xspeed_;
  }

  void dibuixa() {
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(xpos,ypos,20,10);
  }

  void moure() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}


