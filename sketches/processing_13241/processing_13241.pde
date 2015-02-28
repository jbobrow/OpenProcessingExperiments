
// Click to switch gravity.
//
// I wrote this code in the morning, and in the afternoon in a color 
// lecture they showed "Puddle Painting" by Ian Davenport.  Too 
// similar to ignore.  I changed the dimensions and colors to match.
// http://contemporaryartlinks.blogspot.com/2009/04/ian-davenport.html

import fisica.*;

FWorld world;

int prevX=0;
int prevY=0;

int frame=0;

boolean antigravity=false;

int[] colors = {
  0xFFFFFF9A,0xFFFFFFB7,0xFFEE746B,0xFF852B6F,0xFF633061,0xFFFFFFCC,0xFFFFFFAD,0xFFDA2F6C,0xFFFF916D,0xFFFFFFAE,
  0xFFFFFF8E,0xFF6B7202,0xFFB00712,0xFFFFFF8B,0xFFA06065,0xFFAD6422,0xFFFFFFB4,0xFFFFD676,0xFFFFFFB5,0xFFCC0002,
  0xFFFFFF8B,0xFFFFBA04,0xFF2A7202,0xFF4D0A02,0xFFFFFFB5,0xFFFFFF92,0xFF05254F,0xFFFFFFCF,0xFF332E74,0xFFFFFFCB,
  0xFFFFCB60,0xFFFFFF93,0xFF08102E,0xFFFFFFAF,0xFF035175,0xFFFF8C6B,0xFFFFFF88,0xFFFFB261,0xFF754626,0xFF062A6E,
  0xFFFF9C69,0xFF08252D,0xFF0C0C0F,0xFF4C6777,0xFF494D77,0xFFFFFF86,0xFFFFFF96,0xFF252555,0xFF061145,0xFF00442F,
  0xFF0D2208,0xFF48337F,0xFF2B4C70,0xFFFFCC0C,0xFFFFFF94,0xFF790101,0xFF70487C,0xFFFFFF8F,0xFF4D7203,0xFFFFFF88,
  0xFF4C2305,0xFFFFFF95,0xFF6D4B49,0xFFFFFFAD,0xFFFF8907,0xFFFFFFCF,0xFF0F6B4B,0xFF4B2737,0xFF0F686C,0xFF8B274A,
  0xFF697327,0xFF4F4E50,0xFF270E2C,0xFFFF9373,0xFFFFFFE5,0xFF77440F,0xFFFF992F,0xFF27252F,0xFF2B0807,0xFF4C6E53,
  0xFF2C6A6E,0xFF266A4C,0xFF776E7F,0xFFFFFF8B,0xFFB73673,0xFF241150,0xFFFFFFB7,0xFF0A4556,0xFFFFFFAF,0xFF11722C,
  0xFF247128,0xFFFFFFCE,0xFF53742A,0xFF901145,0xFF4D4F06,0xFF4B0D2B,0xFFFFFF8B,0xFF2C4A4E,0xFF6E2D2F,0xFF7D6C42,
  0xFFCB357C,0xFFFFCD56,0xFFFFFF90,0xFF107303,0xFF742E09,0xFF292605,0xFF4F4A2C,0xFFFF8755,0xFFB52E44,0xFFFF8C53,
  0xFFFFFFB2,0xFF261166,0xFF6C061F,0xFF2B4A2B,0xFFFFFFA6,0xFFC24E36,0xFFB40F3A,0xFFFFFFCB,0xFF324F04,0xFFFFB040,
  0xFFFF8A03,0xFF101159,0xFFFFFF8A,0xFF801165,0xFFFFFFB5,0xFFFFFF84,0xFFFFBE33,0xFF054911};

void setup() {
  size(720,720);
  background(4, 100, 180);
  smooth();

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.remove(world.right);
  world.remove(world.left);
  world.top.setSensor(true);
  world.top.setPosition(width/2, -14);
  world.bottom.setSensor(false);
  world.bottom.setPosition(width/2, height+14);
  world.setGrabbable(false);
  world.setGravity(0,300);
}

void draw() {
  world.step();
  world.draw();

  if (frame == 0) {
    int dropFromY = antigravity ? height+30 : -30;
    addBlob(int(random(-5,width+5)), dropFromY, int(random(25,75)));
    frame = 60;
  }
  frame--;
}

void addBlob(int x, int y, int blobSize) {
  FBlob blob = new FBlob();
  blob.setAsCircle(x, y, blobSize);
  color c = color(colors[int(random(0,colors.length))]);
  blob.setFill(red(c), green(c), blue(c));
  blob.setStroke(0, 10);
  //blob.setNoStroke();
  world.add(blob);
}

void mouseClicked() {
  if (antigravity) {
    antigravity=false;
    world.setGravity(0,300);
    world.top.setSensor(true);
    world.bottom.setSensor(false);
  } else {
    antigravity=true;
    world.setGravity(0,-300);
    world.top.setSensor(false);
    world.bottom.setSensor(true);
  }
}


