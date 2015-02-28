
//matrix
color cFondo;
float angulo;
float incremento;

void setup () {
  size(600,600);
  smooth ();
  cFondo = color(0);
angulo = 0;
incremento = 1;

}

void draw () {
  background (cFondo);
  angulo +=incremento;
  if (angulo >20){
    incremento = -1;
    }
  if (angulo <0){
  incremento = +1;
  }
  
  
  matriz(64);
  //comecocos(200,200,300);
}

void mousePressed(){
   incremento = 0;
  angulo = 0;
  
}

void mouseReleased(){
  incremento = 1;
  
}

void matriz (int cuantos){
  float lado = sqrt (cuantos);
  int ladoN = ceil (lado);
  float ancho = width / ladoN;
  
  fill (128,0,0);
  
  for (int n = 0; n<cuantos; n++) {
  float fila = (n/ladoN);
  float columna = n % ladoN;
  float anchoE = map(n,0,cuantos, ancho/10, ancho);
  //ellipse (x,y,ancho,alto);
  //ellipse ((columna*ancho)+ancho/2,(fila*ancho)+ancho/2,anchoE, anchoE);
  //TamañoPupila
  float tp = map(n,0,cuantos, 10,80);
  //AnguloOjo
  float aj = map(n,0,cuantos, 0,360);
  //color

    //ojo ((columna*ancho)+ancho/2,(fila*ancho)+ancho/2,ancho, aj,20,tp, color (128,0,0));
comecocos ((columna*ancho)+ancho/2,(fila*ancho)+ancho/2,ancho);
  }

}

void comecocos(float cocoX, float cocoY, float cocoW){
  //dibujauncoco
fill(252,252,10);
noStroke();
//cuerpo
ellipse (cocoX,cocoY,cocoW,cocoW);
//ojo
fill (255);
ellipse (cocoX+(cocoW/4),cocoY-(cocoW/4),cocoW/4,cocoW/4);
//pupila
fill (0);
ellipse (cocoX+(cocoW/4),cocoY-(cocoW/4),cocoW/8,cocoW/8);



// boca
strokeWeight(2);
stroke(cFondo);
fill(cFondo);
arc(cocoX,cocoY,cocoW,cocoW,radians(angulo*-1),radians(angulo));
}

void ojo (float x, float y, float w, float a, float r, float t, color mario) {
//blancoojos
stroke (0);
strokeWeight(1);
fill(mario);

ellipse (x,y,w,w);
// pupila
fill (0);
//ellipse (x,y, (w/100)*t, (w/100)*t);
//movil
float xp = x + cos(radians(a))*((w/200)*r);
float yp = y + sin(radians(a))*((w/200)*r);


ellipse (xp,yp,(w/100)*t,(w/100)*t);
}

