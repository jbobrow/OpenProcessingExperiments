
// coded by Joaku De Sotavento
// joaquindiazescultor@gmail.com
// the code will be commented
// if you liked please send a comment

  int numPuntos = 300;
  int numCentros = 10;

  PVector[] puntos = new PVector[numPuntos];
  PVector[] centros = new PVector[numCentros];
  PVector[] indicePunt = new PVector[numPuntos];
  PVector[] newCentros = new PVector[numCentros];

  PVector[] indice;
  
  int x = 0;
  int y = 0;
  
  boolean reset = true;
  
  int rojo;
  int verde;
  int azul;

void setup() {
  size(800, 600);
  smooth();
  strokeWeight(5);
  background(255);
  frameRate(2);




  for (int i = 0; i < puntos.length; i++) {
    int x = int(random(width));
    int y = int(random(height));
    stroke(random(255), random(255), random(255));
    point(x, y);
    puntos[i] = new PVector(x, y);
  }

  for (int k = 0; k < centros.length; k++) {
    noFill();
    stroke(50, 255, 50, 100);
    int cX = int(random(width));
    int cY = int(random(height));
    ellipse(cX, cY, 30, 30);
    centros[k] = new PVector(cX, cY);
  }

  for (int n = 0; n < puntos.length; n++) {
    stroke(255, 50, 10, 50);
    strokeWeight(1);
    float distancia = 0;
    Float distMin = dist(0, 0, width, height);

    for (int j = 0; j < centros.length; j++) {
      line(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y); 
      distancia = dist(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y);
      if (distancia < distMin) {
        distMin = distancia;
        indicePunt[n] = new PVector(centros[j].x, centros[j].y);
      }
    }
  }


  for (int i = 0; i < newCentros.length; i++) {
    int _numeroPuntos = 0;
    float x = 0;
    float y = 0;
    for (int j = 0; j < puntos.length; j++) {
      if ((indicePunt[j].x == centros[i].x ) && (indicePunt[j].y == centros[i].y)) {
        x = x + puntos[j].x;
        y = y + puntos[j].y;
        _numeroPuntos++;
      }
    }
    x = x / _numeroPuntos;
    y = y / _numeroPuntos;
    newCentros[i] = new PVector(x, y);
  }

  fill(255, 75);
  rect(0, 0, width, height);


  for (int k = 0; k < newCentros.length; k++) {
    noFill();
    strokeWeight(5);
    int rojo = int (random(255));
    int verde = int (random(255));
    int azul = int (random(255));

    stroke(rojo, verde, azul);
    ellipse(newCentros[k].x, newCentros[k].y, 15, 15);
  }

  for (int n = 0; n < puntos.length; n++) {
    float distancia = 0;
    Float distMin = dist(0, 0, width, height);

    for (int j = 0; j < newCentros.length; j++) {
      distancia = dist(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y);
      if (distancia < distMin) {
        distMin = distancia;
        indicePunt[n] = new PVector (newCentros[j].x, newCentros[j].y);
      }
    }
  }

  for (int i = 0; i < newCentros.length; i++) {
        int _rojo = int(random(255));
        int _verde = int(random(255));
        int _azul = int(random(255));
   
    for (int j = 0; j < puntos.length; j++) {
      if ((indicePunt[j].x == newCentros[i].x ) && (indicePunt[j].y == newCentros[i].y)) {
        stroke(_rojo, _verde, _azul);
        strokeWeight(2);
        line(puntos[j].x, puntos[j].y, newCentros[i].x, newCentros[i].y);
      }
    }
  }


  //// finaliza algoritmo
}

void draw() {
  
  background(0);
  
  if(reset){
  
  for (int i = 0; i < puntos.length; i++) {
    
    
     x = int(random(width));
     y = int(random(height));
    
    rojo = int (random(255));
    verde = int (random(255));
    azul = int (random(255));
    
    stroke(rojo, verde, azul);
    point(x, y);
    puntos[i] = new PVector(x, y);
    reset = false;
  }
  }else{
    for (int i = 0; i < puntos.length; i++) {
    
    
     x = x++;
     y = y++;
    
    stroke(rojo, verde, azul);
    point(x, y);
    puntos[i] = new PVector(x, y);
  }
  }
reset=true;
  for (int k = 0; k < centros.length; k++) {
    noFill();
    stroke(50, 255, 50, 100);
    int cX = int(random(width));
    int cY = int(random(height));
    ellipse(cX, cY, 30, 30);
    centros[k] = new PVector(cX, cY);
  }

  for (int n = 0; n < puntos.length; n++) {
    stroke(255, 50, 10, 50);
    strokeWeight(1);
    float distancia = 0;
    Float distMin = dist(0, 0, width, height);

    for (int j = 0; j < centros.length; j++) {
      line(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y); 
      distancia = dist(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y);
      if (distancia < distMin) {
        distMin = distancia;
        indicePunt[n] = new PVector(centros[j].x, centros[j].y);
      }
    }
  }


  for (int i = 0; i < newCentros.length; i++) {
    int _numeroPuntos = 0;
    float x = 0;
    float y = 0;
    for (int j = 0; j < puntos.length; j++) {
      if ((indicePunt[j].x == centros[i].x ) && (indicePunt[j].y == centros[i].y)) {
        x = x + puntos[j].x;
        y = y + puntos[j].y;
        _numeroPuntos++;
      }
    }
    x = x / _numeroPuntos;
    y = y / _numeroPuntos;
    newCentros[i] = new PVector(x, y);
  }

  fill(255, 75);
  rect(0, 0, width, height);


  for (int k = 0; k < newCentros.length; k++) {
    noFill();
    strokeWeight(5);
    int rojo = int (random(255));
    int verde = int (random(255));
    int azul = int (random(255));

    stroke(rojo, verde, azul);
    ellipse(newCentros[k].x, newCentros[k].y, 15, 15);
  }

  for (int n = 0; n < puntos.length; n++) {
    float distancia = 0;
    Float distMin = dist(0, 0, width, height);

    for (int j = 0; j < newCentros.length; j++) {
      distancia = dist(puntos[n].x, puntos[n].y, centros[j].x, centros[j].y);
      if (distancia < distMin) {
        distMin = distancia;
        indicePunt[n] = new PVector (newCentros[j].x, newCentros[j].y);
      }
    }
  }

  for (int i = 0; i < newCentros.length; i++) {
        int _rojo = int(random(255));
        int _verde = int(random(255));
        int _azul = int(random(255));
   
    for (int j = 0; j < puntos.length; j++) {
      if ((indicePunt[j].x == newCentros[i].x ) && (indicePunt[j].y == newCentros[i].y)) {
        stroke(_rojo, _verde, _azul);
        strokeWeight(2);
        line(puntos[j].x, puntos[j].y, newCentros[i].x, newCentros[i].y);
      }
    }
  }
///delay(9000);
}



