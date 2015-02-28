
float L1, x, y, tamanho, intx, inty;
boolean espera;
void setup() {
  // size(displayWidth, displayHeight);
  size(900, 450);
  frameRate(20);
  background(255);
  L1=25;
  tamanho=40;
  intx=(width-floor(width/tamanho)*(tamanho))/2;
  inty=(height-floor(height/(tamanho))*(tamanho))/2;
  x=intx;
  y=inty;
  espera=false;
}

void draw() {
  noStroke();

  if (x+2*tamanho>width && !espera) {
    y=y+tamanho;
    x=intx;
  }

  if (y+2*tamanho>height && !espera) {
    y=inty;
    tamanho = random(20, 150);
    intx=(width-floor(width/(2+tamanho))*(2+tamanho))/2;
    inty=(height-floor(height/(2+tamanho))*(2+tamanho))/2;
    x=intx;
    y=inty;
    espera=true;
  }
  if (!espera) {
    bola();
    x=x+tamanho;
  } 
  else {
    if (random(1)<.05) {
      espera = false;
      background(255);
    }
  }
}




void bola() {
  translate (x+tamanho/2, y+tamanho/2);
  fill(255);
  rect(0, 0, tamanho, tamanho);
  fill(0);
  float qual= random(4);
  if (qual<1) {
    arc( 0, 0, 2*tamanho, 2*tamanho, 0, PI/2);
  }
  else if (qual<2) {
    arc( tamanho, 0, 2*tamanho, 2*tamanho, PI/2, PI);
  }
  else if (qual<3) {
    arc( tamanho, tamanho, 2*tamanho, 2*tamanho, PI, 3*PI/2);
  }
  else if (qual<4) {
    arc( 0, tamanho, 2*tamanho, 2*tamanho, 3*PI/2, TWO_PI);
  }
}

void keyPressed() {
  //save("bezier"+random(100)+".jpg");
}

