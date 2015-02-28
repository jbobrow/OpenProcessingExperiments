
/*
A simple "star field", with a nice color palette.
https://kuler.adobe.com/#themeID/2328390

Made by @ramayac
*/
Punto[] estrellas1 = new Punto[11];
Punto[] estrellas2 = new Punto[33];

Punto[] satelite = new Punto[1]; //satelite
Punto[] planet = new Punto[1]; //sol
Punto[] estrellas3 = new Punto[155]; //bg

class Punto {
  //posicion
  float x, y;
  //tamaño, velocidad, color, alpha
  float t, v; color c; int b;
  
  Punto(float x, float y, float t, float v, color c, int b){
    this.x = x;  this.y = y;
    this.t = t;  this.v = v;
    this.c = c;  this.b = b;
  }
  
  Punto(float x, float y, float t, float v, color c){
    this.x = x;  this.y = y;
    this.t = t;  this.v = v;
    this.c = c;
  }
  
  void draw(){
    x=x-v;
    if(x < -t*2){
      x = width + t * random(t);
    }
    
    fill(c, b);
    ellipse(x, y, t, t);
  }
}

void setup(){
  size(400,400);
  noStroke();
  smooth();
  frameRate(24);
  
  inicializar(estrellas1, 0.90, 10,  #FA4913, 125);
  inicializar(estrellas2, 0.75, 5,   #FE8333, 180);
  inicializar(estrellas3, 0.25, 2,   #B878C6, 150);
  inicializar(satelite,   0.10, 100, #E1CAAB);
  inicializar(planet,     0.01, 500, #17455C);
}

void inicializar(final Punto[] arr, float v, float t, color c){
  inicializar(arr, v, t, c, 255);
}

void inicializar(final Punto[] arr, float v, float t, color c, int b){
  for(int i = 0; i < arr.length; i++){
    float x = random(-50, width+50);
    float y = random(10, height-10);
    arr[i] = new Punto(x, y, t, v, c, b);
  }
}

void dibujar(final Punto[] arr){
for(int i = 0; i < arr.length; i++){
    arr[i].draw();
  }
}

void draw(){
  background(#012326);
  
  //dibujemos las estrellas
  dibujar(estrellas3);
  dibujar(planet);
  dibujar(estrellas2);
  dibujar(satelite);
  dibujar(estrellas1);
}
