
/*
Proceso 2
Un sketch sencillo para visualizar el calculo de la distancia euclideana, con objetos.
Made by: @ramayac
*/

class Esfera{
  PVector punto;
  float radio;
  
  Esfera(float x, float y){
    punto = new PVector(x, y);
    radio = random(30, 50);
  }
  
  float getX(){
    return punto.x;
  }
  
  float getY(){
    return punto.y;
  }
  
  float distancia(Esfera e){
    return punto.dist(e.punto);
  }
  
  void update(){
    float nx = random(-getX(), getX());
    float ny = random(-getY(), getY());
    PVector dir = new PVector(nx, ny);
    dir.normalize();
    punto.add(dir);
  }
  
  void draw(){
    stroke(255);
    strokeWeight(2.5);
    point(getX(), getY());
    
    noStroke();
    if(radio <= 40) {
      fill(100, 150);
    } else {
      fill(100, 100);
    }
    ellipse(getX(), getY(), radio, radio);
  }
}

Esfera[] esferas = new Esfera[25];

int UMBRAL = 60;

void setup(){
  size(500, 300);
  
  iniciar();
  smooth();
  frameRate(24);
  //noLoop();
}

void iniciar(){
  for(int i = 0; i < esferas.length; i++){
    esferas[i] = new Esfera(random(50,width-50), random(50,height-50));
  }
}

void draw(){
  background(51);
  
  for(int i = 0; i < esferas.length; i++){
    esferas[i].update();    
    esferas[i].draw();
  }
  
  //Para cada elemento hay que dibujar una linea
  stroke(200, 100);
  strokeWeight(1);
  //TODO: optimizar.
  for(int i = 0; i < esferas.length; i++){
    Esfera e1 = esferas[i];
    for(int j = 0; j < esferas.length; j++){
      Esfera e2 = esferas[j];
      float d = e1.distancia(e2);
      if(d <= UMBRAL){
        line(e1.getX(), e1.getY(), e2.getX(), e2.getY());
      }
    }
  }
  
}

void mousePressed(){
  iniciar();
  redraw();
}
