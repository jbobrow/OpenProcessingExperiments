
Gota[] gotas = new Gota[1000];
//nueva variable para saber cuantas gotas tenemos
//cuando lleguemos al final
int totalgotas = 0;

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  //background(0);
  fill(255,30);
rect(0,0,width,height);
  // Iniciar las gotas:
  gotas[totalgotas] = new Gota();

  // Sumar al numero de gotas:
  totalgotas++ ;

  // si llegamos al final de las gotas...
  if (totalgotas >= gotas.length) {
    totalgotas = 0; //empezar de nuevo
  }

  // hacer llover y mostrar
  for (int i = 0; i < totalgotas; i++ ) { // 
    gotas[i].llover();
    gotas[i].mostrar();
    gotas[i].rebotar();
  }

}
class Gota{
  float x,y;
  float velocidadY;
  float velocidadX;
  color c;
  float r;
  Gota(){
    r=8;
    x=random(width);
    y=-r*4;
    velocidadY=random(1,10);
    velocidadX=random(1,10);
    c=color(50,100,150);
  }
  void llover(){
    y+=velocidadY;
    x+=velocidadX;
  }
  void rebotar(){
    if(y>=height){
      velocidadY=velocidadY*-1;
    }
  if(x>=width){
  velocidadX=velocidadX*-1;
  }
if(y<=0){
  velocidadY=velocidadX*+1;
}
}
      
  void mostrar(){
    fill(c);
    noStroke();
    for(int i=2;i<r;i++){
      ellipse(x,y+i*4,i*2,i*2);
    }}}

