

/*
TUNELES 0.1
Prototipo para Encuentro 26K
Medialab Prado Madrid
http://wiki.medialab-prado.es/index.php/26k_pixeles
Marco A. Velasco
*/

// contador de tiempo
float i=1;
// base de calculo para el color
float j=1;
// gris de fondo
int fondoC = 230;

void setup(){
size(192,157);
background(255);
smooth();

}

void draw(){

  // cada paso desde i = 1 hasta i = 33*width es un "tunel"
  // a velocidad creciente (x 1.05)
  // en vez de i++ que seria a velocidad constante
  if (i<=33*width) {
    i=1.05*i;
      }
   else{ i=1;
   
  // al finalizar el tunel calcula 
  // una nueva base de calculo para el color
    j = random(1,20);}

    // pinta el fondo para no ver el fotograma anterior
    background(fondoC);   
    // rellena cada circulo del color del fondo
    fill(fondoC);
    
    // dibuja circulos del tunel
    // probablemente se pudiese meter un "if" para no dibujar uno a uno
    // color = base de calculo / numero distinto para cada circulo
    // grosor de linea = paso i / numero distinto para cada circulo
    // tamaño = paso i / numero distinto para cada circulo
    stroke(j*12);
    strokeWeight(i/10);
    ellipse (width/2, height/2, i, i);
    stroke(j*10);
    strokeWeight(i/20);
    ellipse (width/2, height/2, i/1.5, i/1.5);
    stroke(j*9);
    strokeWeight(i/7);
    ellipse (width/2, height/2, i/2.3, i/2.3);
    stroke(j*7);
    strokeWeight(i/20);
    ellipse (width/2, height/2, i/5, i/5);
    stroke(j*5);
    strokeWeight(i/30);
    ellipse (width/2, height/2, i/10, i/10);
    stroke(j*3);
    strokeWeight(i/100);
    ellipse (width/2, height/2, i/20, i/20);
    stroke(j*2);
    
    // dibuja punto central
    strokeWeight(1);
    ellipse (width/2, height/2, 2, 2);    
  
} 
                
