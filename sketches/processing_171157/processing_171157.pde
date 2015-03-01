
ArrayList positions;
float time = 0;

int xfreq1 = (int)random(1, 10);
int yfreq1 = (int)random(1, 10);
int zfreq1 = (int)random(1, 10);
int xfreq2 = (int)random(1, 10);
int yfreq2 = (int)random(1, 10);
int zfreq2 = (int)random(1, 10);

float xamp1 = random(50, 150);
float yamp1 = random(50, 150);
float zamp1 = random(50, 150);
float xamp2 = random(50, 150);
float yamp2 = random(50, 150);
float zamp2 = random(50, 150);

float xpos = 300;
float ypos = 300;
float zpos = 300;

int cycles = 0;
int colorControl = 1;

boolean fancyColors = true;

boolean checkReset() {
  if (((xpos > 0 && positions.get(positions.size()-3) < 0)
    || (xpos < 0 && positions.get(positions.size()-3) > 0)) &&
    ((ypos > 0 && positions.get(positions.size()-2) < 0)
    || (ypos < 0 && positions.get(positions.size()-2) > 0)) &&
    ((zpos > 0 && positions.get(positions.size()-1) < 0)
    || (zpos < 0 && positions.get(positions.size()-1) > 0))) {
    return true;
  }
  return false;
}

void reset() {
  time = 0;
  xfreq1 = (int)random(1, 10);
  yfreq1 = (int)random(1, 10);
  zfreq1 = (int)random(1, 10);
  xfreq2 = (int)random(1, 10);
  yfreq2 = (int)random(1, 10);
  zfreq2 = (int)random(1, 10);
  xamp1 = random(50, 150);
  yamp1 = random(50, 150);
  zamp1 = random(50, 150);
  xamp2 = random(50, 150);
  yamp2 = random(50, 150);
  zamp2 = random(50, 150);
  xpos = 300;
  ypos = 300;
  zpos = 300;
  cycles = 0;
  colorControl = 1;
  positions = new ArrayList();
  positions.add(0);
  positions.add(0);
  positions.add(0);
  xpos = xamp1*sin(xfreq1*time)+xamp2*sin(xfreq2*time);
  ypos = yamp1*sin(yfreq1*time)+yamp2*sin(yfreq2*time);
  zpos = zamp1*sin(zfreq1*time)+zamp2*sin(zfreq2*time);
}

void keyPressed() {
  fancyColors = !fancyColors;
}

void grow(float gain) {
  xamp1 += gain;
  yamp1 += gain;
  zamp1 += gain;
  xamp2 += gain;
  yamp2 += gain;
  zamp2 += gain;
}

void setup() {
  size(800, 800, P3D);
  positions = new ArrayList();
  positions.add(0);
  positions.add(0);
  positions.add(0);
  frameRate(30);
}

void draw() {
  lights();
  background(0);

  translate(400, 400);
  rotateY(radians(30*time));
  rotateX(radians(37*time));

  grow(.015);

  xpos = xamp1*sin(xfreq1*time)+xamp2*sin(xfreq2*time);
  ypos = yamp1*sin(yfreq1*time)+yamp2*sin(yfreq2*time);
  zpos = zamp1*sin(zfreq1*time)+zamp2*sin(zfreq2*time);

  if (checkReset()) {
    ++cycles;
  }
  if (cycles > 7) {
    reset();
  }

  positions.add(xpos);
  positions.add(ypos);
  positions.add(zpos);

  if (mousePressed) {
    colorControl += 10;
  }

  for (int i=0; i<positions.size ()-3; i+=3) {
    if (positions.size()-i < 50) {
      strokeWeight((52-(positions.size()-i))*.15);
    } else {
      strokeWeight(1);
    }
    if (fancyColors) {
      stroke(cos(radians(2*i+colorControl))*200, sin(radians(3*i))*200, sin(radians(5*i+colorControl))*200);
    } else {
      stroke(255);
    }
    line((float)positions.get(i), (float)positions.get(i+1), (float)positions.get(i+2), 
    (float)positions.get(i+3), (float)positions.get(i+4), (float)positions.get(i+5));
  }

  time+=.02;
}



