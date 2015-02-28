
void setup () {
  size (500,350);
  background (0,150,50);
  fill (255);
  int diam;
  diam = 20;
  
 
}

void draw() {
  
  fill (70,50,30);
  stroke(255,0,0);
  dibujarCirculo (300,8);
  dibujarCirculo (328,8);

}

void dibujarCirculo (int diam, int niv) {
  ellipse (width/2+diam,height/2, diam,diam );
  
  if(niv >1){
    niv--;
    dibujarCirculo (diam/2,niv);
    dibujarCirculo (40,niv);
    dibujarCirculo (10,niv); 
}
    
//void dibujarCirculo2 (int diam, int niv) {
  ellipse (width+diam,height, diam,diam );
  
  if(niv >1){
    niv--;
    dibujarCirculo(diam/2,niv);
    dibujarCirculo(40,niv);
    dibujarCirculo (10,niv); 
  
  
  }
  
}
