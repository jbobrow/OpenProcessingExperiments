

float terra_rad = 6378.388;
float Gmt = 6.67428E-11 * 5.9736E+24; // costante gravitazione G * massa terrestre

float scala;
float tempo = 0;
int st = 0;

int nr_sat = 2000;
cSatellite [] satellite = new cSatellite[nr_sat];

// -------------------------------------------------------

void setup () {
  size (600, 600);
//  smooth(); // too slow for my machine
  background (0);
  noFill();
  stroke(255);
  ellipseMode(CENTER);
  
  scala = 0.002 * (float)width / terra_rad;  
  for (int i=0; i<nr_sat; i++) {
    satellite[i] = new cSatellite(1000*(i+1));
  }
}

// -------------------------------------------------------

void draw () {
//  background (0);
//  ellipse(width/2, height/2, 2*scala*terra_rad, 2*scala*terra_rad);
  for (int i=0; i<nr_sat; i++) {
    satellite[i]._draw();
  }

  if (st == 3) {
    noStroke();
    fill(0, 1);
    rect(0, 0, width, height);
    stroke(255);
    noFill();
//    filter(BLUR, 1);
    st = 0;
  }

  st++;
  tempo += 100;
}

// -------------------------------------------------------

class cSatellite {
  float quota;
  float alfa0;
  float alfa;
  float ag;
  float va;
  int px0, py0;
  int px, py;
  
  float xp;
  float yp;
  
  cSatellite(float q_) {
    quota = q_ + terra_rad;
    ag = Gmt/(quota*quota*1000000);
    va = sqrt(ag * quota * 1000) / (quota * 1000);
    alfa0 = random(0, TWO_PI);
    alfa = alfa0;
    px = getPX();
    py = getPY();
  }
  
  int getPX() {
    xp = quota * cos(alfa);
    return (int)(0.5*width + scala * xp);
  }
  
  int getPY() {
    yp = quota * sin(alfa);
    return (int)(0.5*height - scala * yp);
  }
  
  void _draw () {
    alfa = alfa0 + va * tempo * 60;
    px0 = px;
    py0 = py;
    px = getPX();
    py = getPY();
    line(px0, py0, px, py);
  }
}


