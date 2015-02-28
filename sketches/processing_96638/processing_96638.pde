
Line[] line = new Line[400+1];

int count;

void setup() {
  frameRate(5);
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  rectMode(CENTER);

  for (int i = 0; i < line.length;i++) {
    line[i] = new Line();
  }

  noStroke();
  //noLoop();
}

void draw() {
  background(0);
  
  pushMatrix();
  //translate(width/2, height/2);
  for (int p = 0;p < 20;p++) {
    for (int q = 0;q < 20;q++) {
      line[count].display(p*25, q*25);
      count++;
      if (count > 400) {
        count = 0;
      }
    }
  }
  

  popMatrix();
}

class Line {
  float hue;
  //  float x;
  //  float y;
  float w = random(50);
  int h = 2;
  float t;


  Line() {
    hue = random(360);
    select_rad();
  }

  void display(float x, float y) {
    pushMatrix();
    translate(x, y);
    rotate(radians(t));
    fill(hue, 100, 100);
    rect(0, 0, w, h);
    popMatrix();
  }


  void select_rad() {
    if (random(1) >= 0.5) {
      t = 0;
    }
    else {
      t = 90;
    }
  }
}



