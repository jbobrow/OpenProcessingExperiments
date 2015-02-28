
int hw;
int hh;

float r;
float a = 1.5;

int es = 20;
int n = 170;

float x;
float y;

int counter = 0;
int get_point = 4;

int c;

void setup() {
  size(400, 400);
  background(254);

  smooth();

  hw = width/2;
  hh = height/2;

  //noLoop();

  noStroke();

  frameRate(10);
}


void draw() {
  background(254);
  flower(); 
  paper();
}

void flower() {
  for (int t = 1; t < 450;t++) {
    r = sin(a*t); 

    x = r * cos(t);
    y = r * sin(t);

    noStroke();
    fill(255);
    ellipse(n*x+hw, n*y+hh, es, es);
  }
}

void paper() {  
  for (int i = 0; i < 5000;i++) {
    float rect_size = random(5, 10);

    int rx = (int)random(width);
    int ry = (int)random(height);
    c = get(rx, ry);

    if (c == -1) {
      if (i % 5 == 0) {
        fill(192);
      }
      else if (i % 5 == 1) {
        fill(255, 215, 0);
      }
      else {
        fill(240, 50, 50);//234
      }
      pushMatrix();
      translate(rx, ry);
      rotate(random(TWO_PI));
      rect(0, 0, rect_size, rect_size);
      popMatrix();
    }
  }
}


