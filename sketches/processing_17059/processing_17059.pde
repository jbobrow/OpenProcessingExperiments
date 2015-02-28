
float angulo = 0.0; //para que giren
PImage copito;
Copo[] copos = new Copo[10000];

int totalcopos = 0;

void setup() {
  size(800,600);
  smooth();

copito = loadImage("copito.png");
}

void draw() {
  fill(220,227,226,150); //le da la estela
  rect(0,0,width, height);
  
  angulo = angulo + 0.005; //para que giren

  copos[totalcopos] = new Copo();
  totalcopos++ ;

  if (totalcopos >= copos.length) {
    totalcopos = 200;   // si se terminan, volver a empezar
  }

  for (int i = 0; i < totalcopos; i++ ) {
    copos[i].nevar();
    copos[i].mostrar();
  }

}
class Copo {
  float x,y;
  float velocidad; 
  color c; 
  float r;    

  Copo() {
    r = random (3,100);  //tamaño de los copos
    y = random (height+50)-50;    //posicion
    x = -r*50;         
    velocidad = random(0,5);   //velocidades diferentes _ le da profundidad
    c = color(random (220,255),random(100,255)); //color y transparencia
    

  }

  void nevar() {
    x+= velocidad;
    y+= velocidad/7;   //random(2,10);   //empujarlas
  }

  void mostrar() {
   
    fill(c);
    noStroke();
    imageMode(CENTER);
    rotate(angulo*0.01);
    image(copito,x ,y  , r, r);
     
  }}

