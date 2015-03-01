
//Pràctica 4 Taller de Creació de Videojocs UPF 2015
//Realitzat per Eric Sueiro Eglicerio: "Family Meeting"
//#òòléé

// Precarrega fotos //
// @pjs preload= "fons1.jpg" //
// @pjs preload= "fons2.jpg" //
// @pjs preload= "sperm.png" //
// @pjs preload= "ovulo.png" //

PImage fons1;
PImage fons2;
PImage sperm;
PImage ovulo;
boolean click = true;

//Variables utilitzades
int total = 20;
int centreX = 500;
int centreY = 250;
int SpeedOvuloX = 1;
int SpeedOvuloY = 1;
float[] x = new float[total];
float[] y = new float[total];
float[] speedx = new float[total];
float[] speedy = new float[total];

void setup() {
  size (1000, 500);
  frameRate(50);

  fons1 = loadImage ("fons1.jpg");
  fons2 = loadImage ("fons2.jpg");
  sperm = loadImage ("sperm.png");
  ovulo = loadImage ("ovulo.png");

  for (int i=0; i<total; i++) {
    x[i] = random (width);
    y[i] = random (height/2);
    speedx[i] = random (-total/2, total);
    speedy[i] = random (-4, 4);
  }
}

void draw() {
  //Canvi del fons
  if (click == true) {
    image(fons1, 0, 0);
  } else {
    image(fons2, 0, 0);
  }

  //CENSORED
  fill(random(255), random(255), random(255));
  quad (680, 140, 750, 155, 750, 180, 680, 165);

  //Sperm
  for (int i=0; i<total; i++) {
    image(sperm, x[i], y[i], 100, 200); 
    x[i] = x[i] + speedx[i];
    y[i] = y[i] + speedy[i];

    //Ovulo  
    image (ovulo, centreX, centreY, 152, 152);
    centreX = centreX + SpeedOvuloX;
    centreY = centreY + SpeedOvuloY;


    //Rebota bota y en tu cara explota SPERM
    if (x[i] >= width || x[i] <= 0) {
      speedx[i] = -speedx[i];
    }
    if (y[i] >= height || y[i] <= -30) {
      speedy[i] = -speedy[i];
    }

    //Rebota bota y en tu cara explota OVULO
    if (centreX >= width || centreX <= 0) {
      SpeedOvuloX = -SpeedOvuloX;
    }
    if (centreY >= height || centreY <= -30) {
      SpeedOvuloY = -SpeedOvuloY;
    }
  }
}

void mousePressed() {
  //Canvi del fons al clicar
  if (click==true) {
    click = false;
  } else {
    click = true;
  }

  //COME ON
  for (int i=0; i<total; i++) {
    x[i] = mouseX;
    y[i] = mouseY;
  }
}



