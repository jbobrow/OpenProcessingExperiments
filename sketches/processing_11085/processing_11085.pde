
// Luca Sassone
// luglio 2010

class cFrammento {
  float px;
  float py;
  float sx;
  float sy;
  float alfax;
  float alfay;
  float alfaz;
  float dealfax;
  float dealfay;
  float dealfaz;
  
  cFrammento() {
    px = random(48, 50);
    sy = 3;
    sx = sy;
    alfax = random(0, TWO_PI);
    alfay = random(0, TWO_PI);
    alfaz = random(0, TWO_PI);
    dealfax = random(-0.002, 0.002);
    dealfaz = random(-0.002, 0.002);
    dealfay = 0.1;
  }
  
  void Draw() {
    pushMatrix();
    rotateX(alfax);
    rotateZ(alfaz);
    rotateY(alfay);
    fill(150, 255, 255);
    noStroke();
    textureMode(NORMALIZED);
    beginShape(QUAD_STRIP);
    texture(img);
    for (int i=0; i<20; i++) {
      float beta = i*sx*2/px;
      vertex(px*cos(beta), -sy, px*sin(beta), float(i)/19, 0);
      vertex(px*cos(beta),  sy, px*sin(beta), float(i)/19, 1);
    }
    endShape();
    popMatrix();    
    alfax += dealfax;
    alfaz += dealfaz;
    alfay += dealfay;
  }
}

//-------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------

int nrquads = 10;
cFrammento [] frammento = new cFrammento[nrquads];

PImage img = createImage(100, 100, ARGB);

//-------------------------------------------------------------------------------------

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  camera(0, 0, 100, // eyeX, eyeY, eyeZ
         0, 0, 0, // centerX, centerY, centerZ
         0, 1, 0); // upX, upY, upZ
  for (int i=0; i<nrquads; i++) {
    frammento[i] = new cFrammento();
  }

  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      float v;
      v = 1 - sqrt(pow(x-img.width/2, 2) + pow(y-img.height/2, 2)) / (img.width/2);
      if (v < 0) v = 0;
      img.set(x, y, color(150, 255, 255, int(255 * v)));
    }
  }

  
}

//-------------------------------------------------------------------------------------

void draw () {
  background(0, 0, 255);
  lights();
  noStroke();
  for (int i=0; i<nrquads; i++) {
    frammento[i].Draw();
  }
}

