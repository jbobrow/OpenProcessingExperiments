
void setup () {
  size (ancho, alto);
  background(#FFFFFF);
  frameRate(100);
  smooth();
}

int alto = 500;
int ancho = 1000;

float x1 = 0;
float x2 = 0;

float y1 = alto-200;
float y2 = alto-200;

int cont = 0;

void draw () {
    x2 += random(10);
    y2 += random(-10, 9.5);
    stroke(50);
    line(x1,y1,x2,y2);
    stroke(100);
    line(x1,y1+10,x2,y2+10);
    stroke(150);
    line(x1,y1+20,x2,y2+20);
    stroke(random(200));
    line(x1,y1+2,x2,y2+2);
    x1 = x2;
    y1 = y2;
    if (x1 >= ancho)    {
      clear();
      cont++;
    }
    if(cont == 20){
      noLoop();
    }
}

void clear () {
  x1 = 0;
  x2 = 0;
  y1 = random(alto/2,alto);
  y2 = random(alto/2,alto);
  filter(BLUR, 0.8);
}

void keyPressed() { 
  if(key == 'b' || key == 'B') {
    filter(BLUR, 2);
  }
  if(key == 'p' || key == 'P') {
    filter(POSTERIZE, 8);
  } 
  if(key == 'r' || key == 'R') {
    background(255);
  }
} 



