

class Particle {
  float x = 0, y = 0, vx = 0, vy = 0;
  int maxDist = 0, lifeSpan = 0, col = 0;
  boolean live = false;

  Particle(float ix, float iy, int id, int ic) {
    x = ix;
    y = iy;
    maxDist = id;
    col = ic;
  }

}


//float HALFPI = PI / 2, SIXTEENTHS = PI / 16, THIRTYSECONDS = PI / 32;
int NUMSHOTS = 1024, maxRange = 0;
float OX = 0, OY = 0;//, GRAV = 4.7, gunangle = 0;
boolean staron = true;




Particle[] spray;


void setup() {
  size(800, 600, P2D);


  maxRange = width * height;

  OX = width / 2;
  OY = height / 2;
  
  spray = new Particle[NUMSHOTS];

  for (int i=0; i<NUMSHOTS; i++) {
    spray[i] = new Particle(OX, OY, 800, color(255));
  }

  //frameRate(1000);
}

void draw() {

  float tmpang = 0;


  background(0);

  for(int i=0; i<NUMSHOTS; i++) {

    if (!(spray[i].live)) {
      if (staron) {
        tmpang = random(1) * TWO_PI;
        spray[i].vx = random(2) * cos(tmpang);
        spray[i].vy = random(2) * sin(tmpang);

        spray[i].x = OX;
        spray[i].y = OY - 1;
        spray[i].lifeSpan = 0;
        spray[i].col = color((int)random(127) + 128, (int)random(127) + 128, (int)random(127) + 128);
        spray[i].live = true;
      }
      
    } else {
      spray[i].x = spray[i].x + spray[i].vx;
      spray[i].y = spray[i].y + spray[i].vy;

      int offs = (int)(spray[i].y * width + spray[i].x);

      if ((offs >= 0) && (offs < maxRange)) {
        stroke(spray[i].col);
        point(spray[i].x, spray[i].y);
      } else {
        spray[i].live = false;
      }
      
      spray[i].lifeSpan = (int)(abs(spray[i].x - OX) + abs(spray[i].y - OY));

      if (spray[i].lifeSpan > spray[i].maxDist) {
        spray[i].live = false;
      }
      
    }

  }
}


void mousePressed() {
  staron = false;
}

void mouseReleased() {
  staron = true;
}



