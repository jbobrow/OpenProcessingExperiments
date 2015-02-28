
Gota[] gotas = new Gota[1000];
//nueva variable para saber cuantas gotas tenemos
//cuando lleguemos al final
int totalgotas = 0;

void setup() {
  size(1000,800);
  smooth();
}

void draw() {
  background(0);

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
  }

}
class Gota{
  float x,y;
  float velocidad;
  color c;
  float r;
  Gota(){
    r=8;
    x=random(width);
    y=-r*4;
    velocidad=random(1,10);
    c=color(50,100,150);
  }
  void llover(){
    y+=velocidad;
    x+=velocidad/4;
  }
  void mostrar(){
    //fill(c);
    stroke(255,0,0);
    for(int i=2;i<r;i++){
       line(x+30,x,y+30,x+10);
       line(x+60,x-i,y-10,x-20);
       noStroke();
      fill(219,51,78);
      ellipse(x-i,y-i,8+i,8+i);
    
    }}}

