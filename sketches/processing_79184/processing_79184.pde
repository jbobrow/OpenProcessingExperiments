
float M;
float mX, mY;
Kakera[] kakera = new Kakera[60];

void setup() {
  size(400, 400);
  //size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();


  for (int j = 0; j<kakera.length;j++) {
    kakera[j] = new Kakera();
  }
}

void draw() {
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);

  mX = abs(width/2 - mouseX);
  mY = abs(height/2 - mouseY);
  M = sqrt(mX * mX + mY * mY) / 100;
  
  for (int j = 0; j < kakera.length;j++) {
    kakera[j].move(M);
    kakera[j].display(M);
  }
}

class Kakera {
  float startX;
  float startY;
  float stopX;
  float stopY;
  float x;
  float y;
  float step;
  float pct;
  float theta =random(TWO_PI);

  float s = 0.1;
  float t = random(1);
  float pm = random(1);

  int ch;

  float[] xx = new float[4];
  float[] yy = new float[4];

  float[] plus = new float[8];
  int num = 50;

  Kakera() {
    startX = width/2;
    startY = height/2;

    stopX = width * cos(theta) + width/2;
    stopY = height * sin(theta) + height/2;

    step = random(0.005, 0.01);
    pct = 0.0;

    if (pm >= 0.5) {
      pm = 1;
    }
    else {
      pm = -1;
    }

    for (int i = 0;i < 8; i++) {
      plus[i] = random(-num, num);
    }

    for (int j = 0; j <4;j++) {
      xx[j] = x + plus[j];
      yy[j] = y + plus[j+4];
    }
  }

  void move(float M) {
    //println(M);

    if (pct < 1.0) {
      x = startX + ((stopX - startX)*pct);
      y = startY + ((stopY - startY)*pct);
      pct += step * M;
    }
    else {
      x = startX;
      y = startY;
      pct = 0.0;
      s = 0.1;
    }

    s+=0.01;
  }

  void display(float M) {
    pushMatrix();
    translate(x, y);
    rotate(t*pm);
    fill(ch,30,100,50);
    noStroke();
    quad(xx[0], yy[0], xx[1], yy[1], xx[2], yy[2], xx[3], yy[3]);

    popMatrix();

    t+=step*M*5;
    ch+=1;
    if(ch > 360){
      ch = 0;
    }
  }
}



