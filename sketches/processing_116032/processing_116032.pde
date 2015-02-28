
float lar = 600;
float cor = 0;

void linhas(float qx, float qy, boolean dir, float lar){
  stroke(0,100,200);
  strokeWeight(1);
  pushMatrix();
  pushStyle();
  translate(qx,qy);
  
  // verticais
  if(dir == true){
    for (float x1 = 0; x1 <= lar; x1 += 5){
      line(x1, 0, x1, lar);
    }
  // horitonzais
  }else{
    for (float y1 = 0; y1 <= lar; y1 += 5){
      line(0, y1, lar, y1);
    }
  }
  
  popStyle();
  popMatrix();
}

void setup(){
  size(600,600);
  background(cor); 
}

void draw(){
  background(cor);
  for (float qx = 0 ; qx <= width ; qx = qx + lar){ //varre horizontal    
  for (float qy = 0 ; qy <= height ; qy = qy + lar){ //varre vertical
    linhas(qx, qy, random(0,1)>0.5?true:false, lar); //desenha módulo e sorteia direção
    }
  }
  noLoop();
}

void keyPressed(){
  lar = lar/2; // divide largura do módulo pela metade
  //cor += 30; // adiciona cinza no fundo
  redraw();
}
