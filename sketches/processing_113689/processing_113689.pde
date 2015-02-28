
class DriftC {

  float x;
  float y;
  float size;
  color c;
  float spdx=2;
  float spdy=2;
  boolean direction;

  DriftC(float _x, float _y, float _size, color _c) {
    x = _x;
    y = _y;
    c = _c;
    size = 4;//random((_size-0.05), (_size+0.05));
    direction = true;

    // random scale
  }

  void drawCloud() {

    driftingX();
    driftingY();
    render();
  }

  void move(boolean direction) {
    if (direction) {
      driftingX();
    }
    else driftingY();
  }


  // cloud drifting
  void driftingX() {
    x += spdx;  // moves right
    y += random(-0.5, 0.5); // moves up and down

    if (x > width || x < 0) {
      spdx = -spdx;
    }  
    if (y > height || y < 0) {
      spdy = -spdy;
    }
  }
  void driftingY() {
    y += spdy;  // moves down
    x += random(-0.5, 0.5); // moves left and right

    if (x > width || x < 0 ) {
      spdx = -spdx;
    }  

    if (y > height || y < 0) {
      spdy = -spdy;
    }
  }

  // print cloud
  void render() {
    cloud(x, y, size, c);
  }

  // cloud function
  void cloud(float x, float y, float sz, color c) {
    noStroke();
    fill(c);
    ellipse(x, y, sz, sz);
  }

  void collision(DriftC other) {
    other.direction = !other.direction;
  }

  void collisionY(DriftC other) {
    if (dist(x, y, other.x, other.y) < size) {
      other.x = y;
      other.y = x;
      other.spdy = spdy;
      other.spdx = spdx;
    }
  }
  void collisionX(DriftC other) {
    if (dist(x, y, other.x, other.y) < size) {
      other.x = y+10;
      other.y = x+10;
      other.spdy = -spdy;
      other.spdx = -spdx;
    }
  }
}


color R = color(230, 50);
color G = color(100,123,175, 150);
//int n;
int x = 0;
int y = 0;
int count = 0;

int num = 100;
DriftC[] drifter = new DriftC[num];
DriftC[] drifter2 = new DriftC[num];

boolean driftX = true;
boolean driftY = false;

void setup() {

  size(1100, 600);
  background(20);
  for (int i = 0 ; i < num ; i++) {
    drifter[i] = new DriftC(x, y, 1, G);
    drifter[i].direction = driftX;
    y+=5;
    x = int(random(0, width/2));
  }
  for (int i = 0 ; i < num ; i++) {
    drifter2[i] = new DriftC(x, y, 1, R);
    drifter2[i].direction = driftY;
    x+=5;
    y = int(random(0, height/2));
  }
}


void draw() {
  //background(0);
  for (int i = 0; i<num;i++) {
    drifter[i].move(driftX);
    //drifter[i].driftingY();
    drifter[i].render();
  
    drifter2[i].move(driftY);
    //drifter2[i].driftingX();
    drifter2[i].render();
    for (int j = 0;j<num;j++) {
      drifter[i].collisionX(drifter2[j]);
      drifter2[i].collisionX(drifter[j]);
    }
    //for (int j = 0;j<num;j++) {

      //drifter2[i].collisionX(drifter[i]);
    //}
  }
}



