

int N = 21;
float sz = 30;
float[] posX = new float[N];
float[] posY = new float[N];

PVector[] pos = new PVector[N*N];

int r;
int g;
int b;
int code;

void setup() {

  size(600, 600);
  colorMode(HSB, 255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  //textMode(CENTER);
  for (int coorx = 0; coorx < N; coorx++) {

    posX[coorx] = sz*coorx;

    for (int coory = 0; coory < N; coory++) {
      int i = (coory*N) + coorx;   
      posY[coory] = sz*coory;
      pos[i] = new PVector(posX[coorx], posY[coory]);
    }
  }
}

void draw() {

  background(255);

  for (int coorx = 0; coorx < N; coorx++) {

    for (int coory = 0; coory < N; coory++) {

      r = int((frameCount+coorx) *(mouseX/60)) % 255;
      g = 50+(int((frameCount+coory)  * (mouseY/60)) % 205);
      b = 200;
      code = 38+int((frameCount+(coorx*35)) * coory *(mouseX/6)) % 128;
      
      fill(r, g, b, 75+code);
      noStroke();
      rect(posX[coorx], posY[coory], sz, sz);
      
      fill(255);
      text(char(code), posX[coorx], posY[coory]);
      
      stroke(0,code);
      int x = int((frameCount+coorx)*(mouseX/6)) % 600;
      int y = (int((frameCount+coory)*(mouseY/6)) % 600);
      line(width/2, height/2, x, y);
    }
  }
}



