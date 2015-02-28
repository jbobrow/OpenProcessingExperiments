

class bolita {
  float velocidadx;
  float velocidady;
  int direccionx=1;
  int direcciony=1;
  int radio;
  color color1;
  float x, y;

  bolita (float x, float y, float vx, float vy, int r, color c)
  {
    this.x = x;
    this.y = y;
    this.velocidadx=vx;
    this.velocidady=vy;
    this.radio=r;
    this.color1=c;
  }

  void mover () {
    x+= velocidadx * direccionx;
    y+= velocidady * direcciony;
    if (x> width || x<0) {
      direccionx= -direccionx;
    }
    if (y>height || y<0) {
      direcciony= -direcciony;
    }
  }

  void dibujar () {
    fill (color1);
    ellipse (x, y, radio, radio);
  }
}


bolita listabolitas []=
new bolita [500];



void setup (){
  size(800, 800);
  for (int i = 0; i <listabolitas.length; i++){
    color c= color(158, random (190), random (146));
  listabolitas [i]=new bolita (random (width), random (height), random (40),8,int (random(50)), c);
  }
   }
   
  
  void draw (){
      background(#667B7C);
  for (int i=0; i<listabolitas.length; i++){
  listabolitas [i].mover();
  listabolitas [i].dibujar ();
   }
}
   


