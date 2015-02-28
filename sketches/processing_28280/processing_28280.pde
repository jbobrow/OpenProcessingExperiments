


void setup(){
  size(600,600);
  smooth();
  
}

void draw(){
  background(192);
  
  // rejilla
  stroke(255,128);
  
  for(int n = 0; n< width; n+=50){
   line(0,n,width,n);
   line(n,0,n,height);
  }
  
  nOsosEnCuadrado(63);
 
}

void unOso(float osoX, float osoY, float osoW, color osoC){
  // dibuja un oso
  fill(osoC);
  noStroke();
  // la cara
  ellipse(osoX,osoY,osoW,osoW);
  //las orejas
  ellipse(osoX-(osoW/3),osoY-(osoW/3),osoW/3,osoW/3);
  ellipse(osoX+(osoW/3),osoY-(osoW/3),osoW/3,osoW/3);
  // los ojos
  fill(255);
  ellipse(osoX-(osoW/6),osoY-(osoW/6),osoW/10,osoW/10);
  ellipse(osoX+(osoW/6),osoY-(osoW/6),osoW/10,osoW/10);
  fill(osoC);
  ellipse(osoX-(osoW/6),osoY-(osoW/6),osoW/20,osoW/20);
  ellipse(osoX+(osoW/6),osoY-(osoW/6),osoW/20,osoW/20);
  // morro
  fill(255);
  ellipse(osoX,osoY + (osoW/6),osoW/5,osoW/5);
}


void nOsosEnCuadrado(int cuantos){
  float lado = sqrt(cuantos);
  int ladoN = ceil(lado);
  float osoW = height/ladoN;
  
  for(int fila = 0; fila< ladoN; fila++){
    for(int columna = 0; columna<ladoN; columna++){
      int contaOsos = (fila*ladoN)+columna;
      
      if(contaOsos< cuantos){
        unOso((columna*osoW)+(osoW/2),(fila*osoW)+(osoW/2),osoW*0.9, color(0));
      }
       
    }
  }
}

void mousePressed(){
  saveFrame("oso.png");
}

