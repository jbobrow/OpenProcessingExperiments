
Paint[] paints = new Paint[50];

void setup() {
  size(350, 350);
  colorMode(HSB, 360, 100, 100);
  background(360);
  //noLoop();

  for (int i = 0; i < paints.length; i++) {
    paints[i] = new Paint();
  }
}


void draw() {
  //background(360);
  fill(360, 30);
  noStroke();
  rect(0, 0, width, height);

  for (int i = 0; i < paints.length; i++) {
    paints[i].move();
    paints[i].display();
  }
}

class Paint {
  float[] R = new float[100];
  float x = random(width);
  float y = random(height);
  float amp = random(1, 5);
  color[] c = new color[3];
  color mycolor;

  float t = random(TWO_PI);

  Paint() {
    for (int i = 0; i < R.length; i++) {
      R[i] = random(5, 10) * amp;
    }

    c[0] = color(296, 50, 80);
    c[1] = color(181, 50, 80);
    c[2] = color(58, 50, 80);

    mycolor = c[(int)random(3)];
  }

  void move() {
    y += 1;
    t += 0.05;
    if (y > height+ 10 * amp * 2) {
      y = -10*amp;
    }
  }

  void display() {
    noStroke();
    fill(mycolor, 120);
    beginShape();

    //curveVertex(width/2+R[0]*cos(radians(360*0/R.length)), height/2+R[0]*sin(radians(360*0/R.length)));
    curveVertex(x+(R[0]*abs(sin(t)))*cos(radians(360*0/R.length)), y+R[0]*abs(sin(t))*sin(radians(360*0/R.length)));

    for (int i = 0; i < R.length; i++) {

      curveVertex(x+R[i]*abs(sin(t))*cos(radians(360*i/R.length)), y+R[i]*abs(sin(t))*sin(radians(360*i/R.length)));
    }
    //  curveVertex(width/2+R[0]*cos(radians(360*0/R.length)), height/2+R[0]*sin(radians(360*0/R.length)));
    curveVertex(x+R[1]*abs(sin(t))*cos(radians(360*1/R.length)), y+R[1]*abs(sin(t))*sin(radians(360*1/R.length)));

    endShape();
  }
}



