
//variales cantidad y tamaño
int Nbolas = 20;
int sizeW = 20;
int sizeH = 20;
//varialbes posicion
float posicionX[] = new float[Nbolas];
float posicionY[] = new float[Nbolas];
float posicionDX[] = new float[Nbolas];
float posicionDY[] = new float[Nbolas];
//bola blanca
float posicionXb = 400;
float posicionYb = 200;
//varialbes velocidad bola blanca
float velocidadX = 4;
float velocidadY = 4;
//imagen fondo
PImage foto;

void setup() {
  size(600, 400);
  smooth();
  foto = loadImage("mesabillar.png");

  for (int i = 0; i < Nbolas; i ++) {
    posicionX[i] = 400; 
    posicionY[i] = 200;
    posicionDX[i] = random(2, 3);
    posicionDY[i] = random(2, 3);
  }
}

void draw() {
  background(0);
  image(foto, 0, 0);
  fill(255);
  ellipse(posicionXb, posicionYb, sizeW, sizeH);

  posicionXb = posicionXb - velocidadX;
  posicionYb = posicionYb - velocidadY;

  // cambio de sentido horizontal
  if ((posicionXb > width - (sizeW/2+50)) || (posicionXb <= 0 + (sizeW/2+50))) {
    velocidadX = -velocidadX;
  }

  // cambio de sentido vertical
  if ((posicionYb > height - (sizeH/2+50)) || (posicionYb <= 0 +(sizeH/2+50))) {
    velocidadY = -velocidadY;
  }

  for (int i = 0; i < Nbolas; i=i+1) {
    fill(155);
    ellipse(posicionX[i], posicionY[i], sizeW, sizeH);

    if (posicionX[i] >= width - (sizeW/2+50)) posicionDX[i] = -posicionDX[i];
    if (posicionX[i] <= (sizeW/2+50)) posicionDX[i] = -posicionDX[i]; 

    posicionX[i] += posicionDX[i];

    if (posicionY[i] >= height - (sizeH/2+50)) posicionDY[i] = -posicionDY[i];
    if (posicionY[i] <= (sizeH/2+50)) posicionDY[i] = -posicionDY[i];

    posicionY[i] += posicionDY[i];
  }
}



