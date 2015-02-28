

Gota[] gotas = new Gota[1000]; //Declaracion de variable TIPO arreglo o 'array'
//que se llama 'gotas' y contiene 1000 elementos tipo 'Gota'

//variable para saber cuantas gotas han salido, cuando llega a mil comienza nuevamente de 0.
int totalgotas = 0;
//nueva variable para saber cuantas gotas han salido

void setup() {
  size(1000,800);
  smooth();
}

void draw() {
  //background(0);
  fill (0,100);
  rect (0,0, width, height);
  // Iniciar el aray .las gotas:
  gotas[totalgotas] = new Gota();
  // Sumar al numero de gotas: Esto equivale la frase:
  // "totalgotas =  totalgotas+1;"
  totalgotas++ ;
  // si llegamos al final de las gotas...
  if (totalgotas >= gotas.length) {
    totalgotas = 0; //empezar de nuevo
  }

  // hacer llover y mostrar
  for (int i = 0; i < totalgotas; i++ ) {
    //for loop para otorgar el verbo 'llover' y 'mostrar' a todas las gotas
    //y a cada una, una por una...
    gotas[i].llover();
    gotas[i].mostrar();
    gotas[i].rebotar();
  }

}
class Gota {
  float x,y;   // Variables de ubicacion de las gotas
  float velocidadY; 
   float velocidadX;// velocidad
  color c; //color de las gotas
  float r;     // el radio de la gota

  Gota() {
    r = 8;                 // todas las gotas son del mismo tamanio
    x = random (width);     // empezar con una ubicacion 'random' dentro del 'width'
    y = -r*4;              // comenzar mas arriba de el campo ,
    //para que parezcan que caen desde mas alla.
  velocidadY= random (1,10);
  velocidadX = random (1,10);   // elegir una velocidad random entre 1 y 5
    c = color(50,100,150); // Color de las gotas
  }

  // mover la gota hacia abajo
  void llover() {
    // acelerar velocidad
    y += velocidadY;
    x += velocidadX;//dos variables de velocidad
  }

 // mostrar-dibujar las gotas
  void mostrar() {
    fill(c);
    noStroke();
    ellipse(x ,y  , 20, 20);
    fill (100,c,random (1,200));
     rect(x ,y  , 20, 20);
  }
  void rebotar (){ 
  if (x>= width || x <=0 ){
 velocidadX = velocidadX *-1;
}

 // if (y>= height  || y <=0 ){
// velocidadY = velocidadY *-1;
//}
  
}}




