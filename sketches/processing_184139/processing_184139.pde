
//Declaració de variables de les el·lipses amb matrius
int total = 40;
float [] x = new float [total];
float [] y = new float [total];
float [] vx = new float [total];
float [] vy = new float [total];
float [] mida = new float [total];

//Declaració de les variables del moviment del cometa
float movimentx = 0;
float movimenty = 0;

//Declaració d'imatge
PImage foto;

void setup() {
  //Canvas en estàtic de 600x400
  size (600, 400);

  //Càrrega de la foto del cometa 
  foto = loadImage("cometa05.png");

  //Assignació de valors inicials de posicions, velocitats i mida de les el·lipses en bucle
  for (int i=0; i<total; i++) {
    x[i] = random(25);
    y[i] = random(25);
    vx[i] = random(3, 10);
    vy[i] = random(3, 10);
    mida[i] = random(5, 50);
  }

  //Canvi en la velocitat dels frames 
  frameRate(10);
}

void draw() { 

  //Fons en gradació de blaus aleatori
  background (random(73), random(250), random(248, 255));
  
  //El·lipses sense contorn
  noStroke();

  //Actualització de les posicions i velocitats de les el·lipses 
  for (int i = 0; i <total; i++) { 
    x[i] += vx[i];
    y[i] += vy[i];

    //El·lipses dibuixades segons les variables assignades i de colors aleatoris
    fill (random(255), random(255), random(255));
    ellipse(x[i], y[i], mida[i], mida[i]);

    //Rebot de les el·lipses quan arriben als límits del canvas amb condicionals
    if (x[i] >= width||x[i] <= 0) {
      vx[i] = -vx[i];
    }

    if (y[i] >= height||y[i] <= 0) {
      vy[i] = -vy[i];
    }
  }

  //Moviment del cometa en diagonal que va des de la punta esquerra del canvas fins la dreta i així contínuament. El condicional reinicia la trajectòria
  image(foto, -270+movimentx, -140+movimenty); 
  movimentx = movimentx+11.5;
  movimenty = movimenty+8;
  if (movimenty >= 550) {
    movimentx = 0;
    movimenty = 0;
  }
}

//Canvi aleatori en la mida de les boles quan es prem el ratolí 
void mousePressed() {
  for (int i = 0; i <total; i++) {
    mida[i] = random(50);
  }
}



