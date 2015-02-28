
float ATTRACTION = -3;
float FRICTION = 0.8;
int ballCount = 100;
int Fin = 20;
boolean OnMouse = false;

float[] X = new float[ballCount];
float[] Y = new float[ballCount];
float[] Spx = new float[ballCount];
float[] Spy = new float[ballCount];
float[] Radius = new float[ballCount];
float[] Ang = new float[ballCount];

int j = 1;
int ObjCount = 0;
boolean[] Obj = new boolean[ballCount];

float Cx, Cy;
float Sp_x, Sp_y;
float sz = 40;
float SpeedRate = random(0.001, 0.003);
boolean OnMouse1 = false;
boolean OnDrag1 = false;

void setup() {
  size(400, 400);
  colorMode(HSB, ballCount);
  background(ballCount - 1);
  frameRate(5);

  Cx = width / 2;
  Cy = height - sz/2;

  for (int i=0; i < ballCount; i++) {
    X[i] = Cx;
    Y[i] = Cy;
    Spx[i] = random(-20, 20);
    Spy[i] = 10;
    Radius[i] = random(10, 20);
    Obj[i] = true;
  }
}

void draw() {
  fadeToWhite();
  rectMode(CENTER);

  for (int i = 0; i < j; i++) {
    noStroke();

    moveBalls(i, ObjCount, Cx, Cy);

    checkOnMouse(i, Cx, Cy);  
    if (OnMouse && mousePressed) {
      Obj[i] = false;
      ObjCount += 1;
      bunishEllipse(i);
    }
    if (Obj[i]) ellipse(X[i], Y[i], Radius[i]*2, Radius[i]*2);

    checkOnMouse1(i, Cx, Cy);  
    if (OnDrag1) {
      Cx = mouseX;
      Cy = mouseY;
      for (int k=j-1; k<ballCount; k++) {
        X[k] = Cx;
        Y[k] = Cy;
      }
    }
    if (ObjCount > Fin) {
      Sp_x = (mouseX - Cx) * SpeedRate;
      Sp_y = (mouseY - Cy) * SpeedRate;
      Cx += Sp_x;
      Cy += Sp_y;
    }
    rect(Cx, Cy, sz, sz);

    if (ObjCount <= Fin) {
      if (dist(Cx, Cy, X[j-1], Y[j-1]) > 100) j += 1;
    }
    else {
      if (Ang[j-1] > 180) j += 1;
    }
    if (j > ballCount) j = ballCount;
  }
}


void moveBalls(int i, int ObjCount, float Cx, float Cy) {
  int r = 150;
  int fir = 5;
  int sec = 10;

  if (ObjCount <= fir) {
    Spy[i] = Spy[i] + ATTRACTION;
    X[i] = X[i] + Spx[i];
    Y[i] = Y[i] + Spy[i];
  }
  else if (ObjCount > fir && ObjCount <= sec) {
    X[i] = X[i] + Spx[i];
    Y[i] = Y[i] + Spy[i] + random(-5, 5);
  }
  else if (ObjCount > sec && ObjCount <= Fin) {
    Ang[i] += random(30);
    X[i] = Cx + ( r * cos(radians(Ang[i])) * random(0.8, 1.2));
    Y[i] = Cy + ( r * sin(radians(Ang[i])) * random(0.8, 1.2) );
  }
  else if (ObjCount > Fin) {
    Ang[i] += random(30);
    X[i] = Cx + ( r*2/3 * cos(radians(Ang[i])) * random(0.8, 1.2));
    Y[i] = Cy + ( r*2/3 * sin(radians(Ang[i])) * random(0.8, 1.2) );
  }

  bounce(i);
}

void bounce(int i) {
  float bounceMinX = Radius[i];
  float bounceMaxX = width - Radius[i];
  float bounceMinY = Radius[i];
  float bounceMaxY = height - Radius[i];

  if (X[i] < bounceMinX || X[i] > bounceMaxX) {
    Spx[i] = -Spx[i] * FRICTION;
    if (abs(Spx[i]) < 1) Spx[i] = 0;
    if (X[i] < bounceMinX) X[i] = bounceMinX - (X[i] - bounceMinX);
    if (X[i] > bounceMaxX) X[i] = bounceMaxX - (X[i] - bounceMaxX);
  }

  if (Y[i] < bounceMinY || Y[i] > bounceMaxY) {
    Spy[i] = -Spy[i] * FRICTION;
    if (abs(Spy[i]) < ATTRACTION) Spy[i] = 0;
    if (Y[i] < bounceMinY) Y[i] = bounceMinY - (Y[i] - bounceMinY);
    if (Y[i] > bounceMaxY) Y[i] = bounceMaxY - (Y[i] - bounceMaxY);
  }
}

void checkOnMouse(int i, float Cx, float Cy) {
  if ( dist(mouseX, mouseY, X[i], Y[i]) < Radius[i] &&
    !( (Cx - 20)<mouseX && (Cx + 20)>mouseX &&
    (Cy - 20)<mouseY    && (Cy + 20)>mouseY) ) {
    OnMouse = true;
    fill(i, ballCount*0.8, ballCount-1);
  }
  else {
    OnMouse = false;
    fill(i, ballCount*0.5, ballCount-1);
  }
}

void checkOnMouse1(int i, float Cx, float Cy) {
  if ( (Cx - 20)<mouseX && (Cx + 20)>mouseX &&
    (Cy - 20)<mouseY && (Cy + 20)>mouseY) {
    OnMouse1 = true;
    fill(i, ballCount*0.8, ballCount-1);
  }
  else {
    OnMouse1 = false;
    fill(i, ballCount*0.5, ballCount-1);
  }
}

void mousePressed() {
  if (OnMouse1) OnDrag1 = true;
}

void mouseReleased() {
  OnDrag1 = false;
}

void bunishEllipse(int i) {
  fill(i, ballCount*0.8, ballCount-1);
  float x = X[i];
  float y = Y[i];

  for (int j=0; j<12; j++) {
    x += Radius[i] * cos(radians(30*j));
    y += Radius[i] * sin(radians(30*j));
    ellipse(x, y, Radius[i]/2, Radius[i]/2);
  }
}

void fadeToWhite() {
  noStroke();
  fill(ObjCount, ballCount * 0.2, ballCount - 1);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void keyPressed() {
  switch(key) {
  case ' ':            //リセット
    ballCount = 100;
    j = 1;
    ObjCount = 0;

    setup();

    break;
  }
}
