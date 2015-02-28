
/* 
 Joan Soler-Adillon
 Realitat Virtual || Realidad Virtual - Processing
 Màster en Arts Digitals, UPF
 http://www.joan.cat/
 
 Basado en:
 http://www.fundacionmaturen.com/images/tira gris.gif 
 */

int numeroBolas = 20;

//creamos un array de posiciones y otro de velocidades
PVector[] posiciones = new PVector[numeroBolas];
PVector[] velocidades = new PVector[numeroBolas];

//... y tamaño con int
int sz = 15;

void setup() {
  size(500,200);
  //inicializamos los PVector:
  for(int i = 0; i<numeroBolas; i++) {
    posiciones[i] = new PVector(width/2, height/2);
    velocidades[i] = new PVector(random(.5,5),random(.5,5));
  }
}

void draw() {

  //dibujamos el fondo
  colorMode(RGB, width);
  for(int i=0;i<width;i++) {
    stroke(i);
    line(i,0,i,width);
  }

  noStroke();
  fill(width/2);

  //actualizamos posición
  for(int i = 0; i<numeroBolas; i++) {
    posiciones[i].add(velocidades[i]);

    //dibujo
    ellipse(posiciones[i].x,posiciones[i].y,sz,sz);

    //comprobamos límites y invertimos velocidad si hace falta:
    if((posiciones[i].x<0)||(posiciones[i].x>width)) {
      velocidades[i].x = -velocidades[i].x;
    }
     if((posiciones[i].y<0)||(posiciones[i].y>height)) {
      velocidades[i].y = -velocidades[i].y;
    }
  }
}



