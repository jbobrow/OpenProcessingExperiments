
//declaració
float quadrat = 40;
float mida = 10;
int gotes = 20;
float R = 255;
float G = 150;
float B = 145;



//Matrius
float[] posiciox = new float[gotes];
float[] posicioy = new float[gotes];
float[] velocitatx = new float[gotes];
float[] velocitaty= new float[gotes];

void setup() {
  size(500, 800);
  background (255);
  for (int i = 0; i<gotes; i++) {
    posiciox[i] = width/2;
    posicioy[i] = 0;
    velocitatx[i] = 4;
    velocitaty[i] = random (1, 30);
  }
}

void draw() {

  for (int i = 0; i<gotes; i++) {
    posiciox[i] = posiciox[i] + velocitatx[i];
    posicioy[i] = posicioy[i] + velocitaty[i];

    if (posiciox[i]>width || posiciox[i]<0) {
      velocitatx[i] = -velocitatx[i];
    }
    if (posicioy[i]>height || posicioy[i] < 0) {
      velocitaty[i] = -velocitaty[i];
    }
            // traçat
    fill (0);
    stroke (0);
    rect (posiciox[i], posicioy[i], mida/8, mida);
  }
}
//goma de borrar
void mouseReleased () {
  shapeMode (CENTER);
  noStroke ();
  fill(255);
  rect (mouseX, mouseY, quadrat, quadrat
    );
}


