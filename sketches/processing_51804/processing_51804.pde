
//Ayako Matsuda
//DESMA 28 Interactivity Workshop 4

PShape redfish;
PShape demekin;
PShape rbfish;
PShape twofish;
PShape smallfish;

void setup()
{
  size (600, 400);
  smooth();

  redfish = loadShape ("goldfish.svg");
  demekin = loadShape("demekin.svg");
  rbfish = loadShape("2colorkingyo.svg");
  twofish = loadShape("masakisan.svg");
  smallfish = loadShape("1masaki.svg");

  frameRate(1);
  shapeMode(CENTER);
}

void draw()
{
  background (255);

  //RED FISH
  float rx = random (width);
  float ry = random (height);

  rotate (PI/5);
  shape (redfish, rx, ry, 100, 100);

  float ex = random (width);
  float ey = random (height);
  rotate (-PI/5);
  shape (redfish, ex, ey, 100, 100);

  float dx = random (width);
  float dy = random (height);
  shape (redfish, dx, dy, 100, 100);

  //DEMEKIN
  float bx = random (width);
  float by = random (height);
  shape (demekin, bx, by, 100, 100);

  float lx = random (width);
  float ly = random (height);
  shape (demekin, lx, ly, 100, 100);

  float demx = random (width);
  float demy = random (height);
  shape (demekin, demx, demy, 100, 100);

  //RED AND BLACK FISH
  float rbx = random (width);
  float rby = random (height);
  shape (rbfish, rbx, rby, 100, 100);

  float rax = random (width);
  float ray = random (height);
  shape (rbfish, rax, ray, 100, 100);

  //TWO FISH
  float twox = random (width);
  float twoy = random (height);
  shape (twofish, twox, twoy, 100, 100);

  float tx = random (width);
  float ty = random (height);
  shape (twofish, tx, ty, 100, 100);

  float wx = random (width);
  float wy = random (height);
  shape (twofish, wx, wy, 100, 100);

  //SMALL FISH
  float smallx = random (width);
  float smally = random (height);
  shape (smallfish, smallx, smally, 100, 100 );

  float sx = random (width);
  float sy = random (height);
  shape (smallfish, sx, sy, 100, 100 );

  float smx = random (width);
  float smy = random (height);
  shape (smallfish, smx, smy, 100, 100 );

  float smax = random (width);
  float smay = random (height);
  shape (smallfish, smax, smay, 100, 100 );

  float smalx = random (width);
  float smaly = random (height);
  shape (smallfish, smalx, smaly, 100, 100 );

  float mmx = random (width);
  float mmy = random (height);
  shape (smallfish, mmx, mmy, 100, 100 );

stroke (150);
  float bluecolor = 255;
  for (int i=1400; i>0; i= i/2)
  { 
    fill(170, 255, 255, 25);
    ellipse (600, 400, i, i);
  }
}


