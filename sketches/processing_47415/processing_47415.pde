
/* 
* "Circulos"
* A quick draft inspired by this image: http://goo.gl/XiJTm
* Colors aren't as cool as the original image, I'll leave it as a homework to you ;)
* Coded by: @ramayac
*/

int TAMANYO = 32;

class Circulo {
  int x, y;
  float w = random(0, TAMANYO);
  float h = TAMANYO;
  
  float escala = random(0, TAMANYO);

  color c;
 
  Circulo(int _x, int _y, color _c){
    x = _x;
    y = _y;
    c = _c;
  }
  
  Circulo(int _x, int _y, float _w, float _h, color _c){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }
  
  void varSizes(){
    escala += 0.05;
    float v = sin(escala)*TAMANYO;
    v = constrain(v, -TAMANYO, TAMANYO);
    w = v;
    //println("width: " + w + ", v: " + v);
  }
  
  void draw(){
   varSizes();      
   noStroke();
   fill(c);
   ellipse(x, y, w, h); 
  }
}

int bloquesX = 640 / TAMANYO;
int bloquesY = 480 / TAMANYO;
Circulo[][] circulos = new Circulo[bloquesX][bloquesY];

void setup(){
  colorMode(HSB, 100);
  
  color[] colores = new color[40];
  for (int i = 0; i < 40; i++) {
      colores[i] = color(i+30, 48, 100, 80);
  }
  
  size(640, 480); 
  for(int i = 0; i < bloquesX; i++){
    for(int j = 0; j < bloquesY; j++){
      int seleccion = (int)random(0,40);
      color c = colores[seleccion];
      circulos[i][j] = new Circulo(i*TAMANYO+(TAMANYO/2), j*TAMANYO+(TAMANYO/2), c);
    }
  }
  
  //colorMode(RGB, 100);
  smooth();
  frameRate(25);
}

void draw(){
  background(#ffffff);
  
  for(int i = 0; i < bloquesX; i++){
    for(int j = 0; j < bloquesY; j++){
      circulos[i][j].draw();
    }
  }
}

