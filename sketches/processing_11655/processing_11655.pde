
int y = 0;
int x = 0;


int r1 = 10;
int g1 = 0;
int b1 = 10;

int r2 = 0;
int b2 = 0;
int g2 = 255;

void setup() {
  size(500,500);
  background(0);
  frameRate(8);
  smooth();
}

void draw(){
 
  //cambia stroke vertical
  stroke(r2,g2,b2);
  g2-=1.09;
  
  //lineas interferencia
  line(x,y,500,height);
  line(0,500,500,y);
  //incrementa
  x =+3;
  
  //linea horizontal
  line(0,y,width,y);
  // incrementa
  y += 3;
  
  
}

