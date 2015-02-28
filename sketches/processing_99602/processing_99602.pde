
/*
Un sketch sencillo para visualizar el calculo de la distancia euclideana. 
Made by: @ramayac
*/

PVector[] puntos = new PVector[20];

int UMBRAL = 75;

void setup(){
  size(500, 300);
  
  iniciar();
  smooth();
  //frameRate(24);
  noLoop();
}

void iniciar(){
  for(int i = 0; i < puntos.length; i++){
    puntos[i] = new PVector(random(50,width-50), random(50,height-50));
  }
}

void draw(){
  background(51);
  
  for(int i = 0; i < puntos.length; i++){
    float x = puntos[i].x;
    float y = puntos[i].y;
    
    stroke(255);
    strokeWeight(5);
    point(x, y);
    
    noStroke();
    fill(100, 100);
    ellipse(x, y, 50, 50);
  }
  
  //Para cada elemento hay que dibujar una linea
  stroke(200, 100);
  strokeWeight(1);
  //TODO: optimizar.
  for(int i = 0; i < puntos.length; i++){
    PVector pv1 = puntos[i];
    for(int j = 0; j < puntos.length; j++){
      PVector pv2 = puntos[j];
      float d = dist(pv1.x, pv1.y, pv2.x, pv2.y);
      if(d <= UMBRAL){
        line(pv1.x, pv1.y, pv2.x, pv2.y);
      }
    }
  }
  
}

void mousePressed(){
  iniciar();
  redraw();
}
