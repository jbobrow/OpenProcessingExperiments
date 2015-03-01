
void setup() {
background(255);
size(500,500);
noStroke();
}

float g = 250;
float h = 250;

Float a = 250.0;
float b = 250.0;

float c = 250;
float d = 250;

float e = 250;
float f = 250;

float kX = 2.5;
float kY = 2.5;
float lX = 2.5;
float lY = 2.5;
float mX = 2.5;
float mY = 2.5;
float nX = 2.5;
float nY = 2.5;



void draw() {
 background(255, 220);

// Rechts unten grau
g = g + kX;
h = h + kY;

fill(60, 180);
ellipse(g, h, 40, 40);

if (g> width - 20 || h> height - 20 || g < width/2 || h < height/2) {
kX =  kX * -1;
kY = kY  * -1;
}

// links unten rot
a = a + lX;
b = b -lY;


ellipse(a, b, 40, 40);

if (a< 20 || b>height - 20 || a > width/2 || b < height/2) {
lX =  lX * -1;
lY = lY * -1;
}

// links oben grün
c = c - mX;
d = d - mY;


ellipse(c, d, 40, 40);

if (c< 20 || d < 20 || c > width/2 || d > height/2) {
mX =  mX * -1;
mY = mY * -1;
}

// links oben blau
e = e + nX;
f = f - nY;


ellipse(e, f, 40, 40);

if (e>width-20 || f < 20 || e < width/2 || f > height/2) {
nX = nX * -1;
nY = nY * -1;
}


}


void mouseClicked() {
 if (mouseButton == LEFT) {
   kY = kY * 1.5;
  lY = lY * 1.5;
  mY = mY * 1.5;
  nY = nY * 1.5;
  kX = kX * 1.5;
  lX = lX * 1.5;
  mX = mX * 1.5;
  nX = nX * 1.5;
 }
 else {
  kY = kY / 1.5;
  lY = lY / 1.5;
  mY = mY / 1.5;
  nY = nY / 1.5;
  kX = kX / 1.5;
  lX = lX / 1.5;
  mX = mX / 1.5;
  nX = nX / 1.5;
 }
}
