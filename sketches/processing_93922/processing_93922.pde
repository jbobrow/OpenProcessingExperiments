
/* 
 Joan Soler-Adillon
 Realitat Virtual || Realidad Virtual - Processing
 Màster en Arts Digitals, UPF
 http://www.joan.cat/
 
 Basado en:
 http://www.fundacionmaturen.com/images/tira gris.gif 
 */

int numeroBolas = 1;

//creamos un array de posiciones y otro de velocidades con ARRAYLIST
ArrayList posiciones = new ArrayList();
ArrayList velocidades = new ArrayList();

//... y tamaño con int
int sz = 15;

void setup() {
  size(500,200);
  //inicializamos los PVector:
  for(int i = 0; i<numeroBolas; i++) {
    posiciones.add(new PVector(width/2, height/2));
    velocidades.add(new PVector(random(.5,5),random(.5,5)));
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
  for(int i = 0; i<posiciones.size(); i++) {
    PVector p = (PVector) posiciones.get(i);
    PVector v = (PVector) velocidades.get(i);
    p.add(v);

    //dibujo
    ellipse(p.x,p.y,sz,sz);

    //comprobamos límites y invertimos velocidad si hace falta:
    if((p.x<0)||(p.x>width)) {
      v.x = -v.x;
    }
    if((p.y<0)||(p.y>height)) {
      v.y = -v.y;
    }
  }
}

/////// Y ahora podemos añadir elementos dinámicamente:

void mousePressed(){
      posiciones.add(new PVector(width/2, height/2));
    velocidades.add(new PVector(random(.5,5),random(.5,5)));
}



