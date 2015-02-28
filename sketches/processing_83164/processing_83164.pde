
float[][] cola;
float[] currP1 = null;
float[] currP2 = null;
float[] currP3 = null;

boolean listo = false;

void setup() {
  size(800, 600);
  background(0);
  strokeWeight(1.5);
  stroke(255);
  noFill();
  smooth();

  cola = new float[0][2];
}

void draw() {
  if (currP1 != null && currP2 != null && currP3 != null) {
    sierpinskyLoco(currP1, currP2, currP3, 3);

    currP1 = null;
    currP2 = null;
    currP3 = null;
    listo = true;
  }
  if (listo) {
    float[] p1 = poll();
    float[] p2 = poll();
    float[] p3 = poll();

    dibujaTriangulo(p1, p2, p3);
    listo = cola.length != 0;
  }
}

void sierpinskyLoco(float[] p1, float[] p2, float[] p3, int n) {
  if (n != 0) {
    addLast(p1);
    addLast(p2);
    addLast(p3);

    float[] rand1 = enMedioRandom(p1[0], p1[1], p2[0], p2[1]);
    float[] rand2 = enMedioRandom(p2[0], p2[1], p3[0], p3[1]);
    float[] rand3 = enMedioRandom(p3[0], p3[1], p1[0], p1[1]);

    addLast(rand1);
    addLast(rand2);
    addLast(rand3);

    //Mete otros 3 triagulos
    //Interior 1
    sierpinskyLoco(p1, rand1, rand3, n - 1);

    //Interior 2
    sierpinskyLoco(rand1, p2, rand2, n - 1);

    //Interior 3
    sierpinskyLoco(rand3, rand2, p3, n - 1);
  }
}

void dibujaTriangulo(float[] p1, float[] p2, float[] p3) {
  line(p1[0], p1[1], p2[0], p2[1]);
  line(p2[0], p2[1], p3[0], p3[1]);
  line(p3[0], p3[1], p1[0], p1[1]);

  fill(255);
  ellipse(p1[0], p1[1], 3, 3);
  ellipse(p2[0], p2[1], 3, 3); 
  ellipse(p3[0], p3[1], 3, 3); 
  noFill();
}

float[] enMedioRandom(float x1, float y1, float x2, float y2) {
  float[] nuevoPunto = new float[2];
  float pendiente = (y2 - y1) / (x2 - x1);
  float b = (-1 * pendiente * x1) + y1;

  if (x1 < x2) {
    nuevoPunto[0] = random(x1, x2);
  } 
  else {
    nuevoPunto[0] = random(x2, x1);
  }
  nuevoPunto[1] = pendiente * nuevoPunto[0] + b;

  return nuevoPunto;
}

float[] poll() {
  float[][] newCola = new float[cola.length - 1][2];
  float[] toPoll = cola[0];
  
  for(int i = 1; i < cola.length; i++) {
    newCola[i - 1] = cola[i];  
  }
  
  cola = newCola;
  return toPoll;
}

void addLast(float[] nuevo) {
  cola = (float[][]) append(cola, nuevo);
}

void keyPressed() {
  if (key == 'c') {
    background(0);
    cola = new float[0][2];
    currP1 = new float[2];
    currP1[0] = random((width / 4), 3 * (width / 4));
    currP1[1] = random(0, (height / 4));
    
    currP2 = new float[2];
    currP2[0] = random(0, (width / 4));
    currP2[1] = random((height / 4), 3 * (height / 4));
    
    currP3 = new float[2];
    currP3[0] = random((width / 2), 3 * (width / 4));
    currP3[1] = random((height / 4), 3 * (height / 4));
  } 
  else if (key == 's') {
    saveFrame();
  }
}



