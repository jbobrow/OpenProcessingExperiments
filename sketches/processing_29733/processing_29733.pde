
float grados;
float angulo;


void setup(){
  size (600,600);
  smooth();
  grados = 90.0;
  angulo =0;
  
}
void draw(){
background (128);
noStroke();
matriz (100);
angulo += 3;

  
}
void buzo (float buzoX,float buzoY,float buzoW,color miColor,float a, float buzoB){
//buzo

fill(miColor);
ellipse (buzoX, buzoY+ (buzoW/4), buzoW/2, buzoW/2);
rect (buzoX - (buzoW/8), buzoY- (buzoW/8)- (buzoW/11),buzoW/10,buzoW/4);

//circulo catalejo
ellipse (buzoX-(buzoW/8),buzoY -(buzoW/4),buzoW/5,buzoW/5);

//pupila buzo
fill (255);
 float xp= buzoX-(buzoW/8) + (cos(radians(a))* buzoW/16);
 float yp= buzoY-(buzoW/4) + (sin(radians(a))* buzoW/16);

ellipse (xp,yp,buzoB,buzoB);

//ellipse (buzoX-(buzoW/6),buzoY -(buzoW/4),buzoW/15,buzoW/15);




ellipse (buzoX+(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
ellipse (buzoX-(buzoW/6),buzoY+(buzoW/4),buzoW/4,buzoW/4);
fill(0);
rect (buzoX+(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);
rect (buzoX-(buzoW/6),buzoY+(buzoW/6),buzoW/10,buzoW/10);

}
void matriz (int cuantos){
  float lado = sqrt (cuantos);  
  int ladoN = ceil (lado);
  float ancho = width/ladoN;
  
  fill (128,0,0);
  
  for (int n = 0; n<cuantos; n++){
  float fila = ceil (n/ladoN) ;
  float columna = n % ladoN; // el resto d ela división por
  
//float Mradio = map (n,0,cuantos,0,50);
//float Mpupila = map (n,0,cuantos,100,10);
//float Mangulo = map (n,0,cuantos,0,360);
//float miColor = map (columna,0,ladoN,50,255);

float miT = map (fila,0,ladoN,255,10);
float miW = map (n,0,cuantos, ancho/10,ancho*2);
 float miColor = map (fila,0,ladoN,0,255);
 
 float miB = map(columna, 0, ladoN, ancho/8,ancho/2);
//buzo ((columna*ancho) + ancho/2,(fila*ancho)+ ancho/2,ancho,Mangulo,Mradio,Mpupila,color (0,0,miColor,miT));
buzo((columna*ancho)+ ancho/2, (fila*ancho)+ancho/2,ancho*0.9,color(128,255,0,miT), angulo, miB );
}
}

