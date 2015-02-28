

// luca sassone
// luglio 2010

//-------------------------------------------------------------------------------------

class cStella {
  float px;
  float py;
  float pz;
  float alfa;
  float dealfa;
  int col;
  int lum;
  
  cStella () {
    Random();
  }
  
  void Random() {
    px = 50 / random(0.5, 2) - 24.9;
    float r = px + 0.9;
    py = 1 / random(-r, r);
    if (abs(py) > 5) py = 0;
    pz = 0;
    int sgn = int(random(0, 2)) * 2 - 1;
    int qua = int(random(0, 4));
    alfa = sgn * (1 / random(1, 10) - 0.1) * PI / 4 + float(qua) * HALF_PI;
    dealfa = 10*0.05 / px;
    col = int(random(0, 255));
    lum = int(random(10, 255));
  }
  
  void Draw() {
    noStroke();
    fill(0, 255, 255);
    pushMatrix();
    rotateY(alfa);
    translate(px, py, pz);

    if(lum > 100) {    
      float rad = (float)(lum-100) / 200.0;
      beginShape(QUADS);
      texture(img2);
      vertex(-rad, 0, -rad, 0, 0);
      vertex(-rad, 0,  rad, 0, 1);
      vertex( rad, 0,  rad, 1, 1);
      vertex( rad, 0, -rad, 1, 0);
      endShape();
    }  
    
//    stroke(col, 50, 255, lum);
//    point(0, 0, 0);
    popMatrix();    
    alfa -= dealfa;
  }
}

//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

int nrste = 10000;
cStella [] stella = new cStella[nrste];

PImage img = createImage(100, 100, ALPHA);
PImage img2 = createImage(10, 10, ALPHA);
float beta = 0;

//-------------------------------------------------------------------------------------

void setup() {
  size(640, 480, P3D);
  colorMode(HSB);

  camera(0, 100*3, 1000, // eyeX, eyeY, eyeZ
         0, 0, 0, // centerX, centerY, centerZ
         -0.4, -1, 0); // upX, upY, upZ
         
  float cameraY = height/2.0;
  float fov = 0.08;
  float cameraZ = cameraY / tan(fov / 2.0);
  perspective(fov, float(width)/float(height), cameraZ/10.0, cameraZ*10.0);

         
  for (int i=0; i<nrste; i++) {
    stella[i] = new cStella();
  }
  
  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      float v;
      v = 1 - sqrt(pow(x-img.width/2, 2) + pow(y-img.height/2, 2)) / (img.width/2);
      if (v < 0) v = 0;
      v = 1 * pow(v, 2);
      v *= 0.5 + 0.5*noise(0.5*x, 0.5*y);
      v = constrain(v, 0, 1);
      img.set(x, y, int(255 * v));
    }
  }
  
  for (int y=0; y<img2.height; y++) {
    for (int x=0; x<img2.width; x++) {
      float v;
      v = 1 - sqrt(pow(x-img2.width/2, 2) + pow(y-img2.height/2, 2)) / (img2.width/2);
      if (v < 0) v = 0;
      v = 0.5 * v;
      img2.set(x, y, int(255 * v));
    }
  }
  
  textureMode(NORMALIZED);
}

//-------------------------------------------------------------------------------------

void draw () {
  background(0, 0, 0);  
  for (int i=0; i<nrste; i++) {
    stella[i].Draw();
  }
}

