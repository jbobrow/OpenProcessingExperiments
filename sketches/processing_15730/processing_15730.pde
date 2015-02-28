
Gota[] gotas = new Gota[10000];

int totalgotas = 0;

void setup() {
  size(400,600);
  smooth();
}

void draw() {
 // background(200);
 fill(175,102);
    rect(0,0,width, height);

  gotas[totalgotas] = new Gota();
  // Sumar al numero de gotas: Esto equivale la frase:
  // "totalgotas =  totalgotas+1;"
  totalgotas++ ;

  if (totalgotas >= gotas.length) {
    totalgotas = 200;   // si se terminan, volver a empezar
  }

  // hacer llover y mostrar
  for (int i = 0; i < totalgotas; i++ ) {
    gotas[i].llover();
    gotas[i].mostrar();
  }

}
class Gota {
  float x,y;
  float velocidad; 
  color c; 
  float r;    

  Gota() {
    r = random (3,20);  
    y = random (height+50)-50;    
    x = -r*4;         
    velocidad = random(0,5);  
    c = color(random (220,255),random(100,255)); 
    

  }


  void llover() {
    x+= velocidad;
    y+= velocidad/7;   //random(2,10);   //empujarlas
  }

  void mostrar() {
   
    fill(c);
    noStroke();
    ellipse(x ,y  , r, r);
     
  }}
