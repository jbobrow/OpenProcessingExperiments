
/*
@description Another sky 
@date 01/06/2013
@author @ramayac
*/

PVector[] puntos = new PVector[24];

int UMBRAL = 50;
int MARGIN = 10;

void setup(){
  size(500, 300);
  
  iniciar();
  smooth();
  frameRate(24);
  noLoop();
}

void iniciar(){
  for(int i = 0; i < puntos.length; i++){
    puntos[i] = new PVector(random(MARGIN,width-MARGIN), random(MARGIN,height-MARGIN));
  }
}

void draw(){
  background(51);
  
  noStroke();
  fill(#FFFF00);
  
  for(int i = 0; i < puntos.length; i++){
    float x = puntos[i].x;
    float y = puntos[i].y;
    float r = random(8, 24);
    ellipse(x, y, r, r);
  }
  
  stroke(#FFFF00);
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
