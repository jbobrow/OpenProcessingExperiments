
void setup (){
  size (600,600);
  smooth ();
}

void draw () {
  background (192);
  matriz (36);

}

void matriz (int cuantos){
  float lado = sqrt (cuantos);  
  int ladoN = ceil (lado);
  float ancho = width/ladoN;
  
  fill (128,0,0);
  
  for (int n = 0; n<cuantos; n++){
  float fila = ceil (n/ladoN) ;
  float columna = n % ladoN; // el resto de la división por
  
  float miAzul = map (fila,0,ladoN,20,255);
  float miT =map (columna,0,ladoN,20,255);
  float miW = map (n,0,cuantos, ancho/10,ancho*2);
  buzo ((columna*ancho) + ancho/2,(fila*ancho)+ ancho/2,miW,color (0,128,0,miT));//muchos buzos
  } 
}
void buzo (float buzoX,float buzoY,float buzoW,color miAzul){
//buzo

fill(miAzul);
ellipse (buzoX, buzoY+ (buzoW/4), buzoW/2, buzoW/2);
rect (buzoX - (buzoW/8), buzoY- (buzoW/8)- (buzoW/11),buzoW/10,buzoW/4);

ellipse (buzoX-(buzoW/8),buzoY -(buzoW/4),buzoW/5,buzoW/5);
fill (255);
ellipse (buzoX-(buzoW/6),buzoY -(buzoW/4),buzoW/15,buzoW/15);
ellipse (buzoX+(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
ellipse (buzoX-(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
fill(0);
rect (buzoX+(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);
rect (buzoX-(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);

}


