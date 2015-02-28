
color G = color(100,123,175,50);
//int n;
int x = 0;
int y = 0;
int count = 0;
int num = 350;
DriftC[] drifter = new DriftC[num];

void setup() {
  size(800, 450);
  background(0);
  //set drifter's positions
  for (int i = 0 ; i < num ; i++) {
    drifter[i] = new DriftC(x, y, 1, G);
    y+=1;
    x = int(random(0, width/2));
    
  }
}

void draw() {
  //draw the texture!
  for (int i = 0; i<num;i++) {
    drifter[i].drawCloud();
    //    float a = drifter[i].x+20;
    //    float b = drifter[i].y;
    //    strokeWeight(1);
    //    stroke(200,100,0,50);
    //    line(drifter[i].x,drifter[i].y,a,b);
  }
}

class DriftC {

  float x, y, scaleC;
  // x --> position x
  // y --> position y
  // scaleC --> size of the cloud
  color c;
  // c --> color

  DriftC(float _x, float _y, float _scaleC, color _c) {
    x = _x;
    y = _y;
    c = _c;
    scaleC = random((_scaleC-0.05), (_scaleC+0.05));
    // random scale
  }

  void drawCloud() {
    drifting();
    render();
  }

  // cloud drifting
  void drifting() {
    x +=1;  // moves right
    y += random(-0.5, 0.5); // moves up and down

    if (x > width+90) {
      x = random(0-90);
    }  // once it hits wall, reappears from left again
  }

  // print cloud
  void render() {
    cloud(x, y, scaleC, c);
  }

  // cloud function
  void cloud(float x, float y, float sz, color c) {

    noStroke();
    fill(c);
    ellipse(x, y, sz, sz);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  color getC() {
    return c;
  }

  float getS() {
    return scaleC;
  }
}
