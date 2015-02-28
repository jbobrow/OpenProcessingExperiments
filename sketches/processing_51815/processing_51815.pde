
int cuantos = 40;
float velocidad = 0;
float ypos;
float [] y = new float [cuantos];
float [] x= new float[cuantos];

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  inicializar();
}

void draw() {

  PImage a;
  a = loadImage ("01.jpg");
  image (a, 0, 0);

  fill(255, 30);
  rect(0, 0, width, height);
  fill(166,203,201);
  
  if (ypos<1000) {
    velocidad += 5.0;
  }
  else {
    velocidad=0;
    inicializar();
  }
  for (int i= 0; i<x.length ; i++) {
    ypos = y[i]+velocidad;
    ellipse(random(10, 40)+x[i], ypos, i, i);
  }
}

void inicializar() {
  for (int i = 0; i<x.length ; i++) {
    x[i] = random(0, width);
    y[i] = random(-1000, 0);
  }
}


