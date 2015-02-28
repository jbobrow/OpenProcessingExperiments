

Gota[] gotas = new Gota[1000]; //Declaracion de variable TIPO arreglo o 'array'
//que se llama 'gotas' y contiene 1000 elementos tipo 'Gota'

int totalgotas = 0;
//nueva variable para saber cuantas gotas han salido

void setup() {
  size(1000,800);
  smooth();
}

void draw() {
  background(0);
  // Iniciar las gotas:
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
  }

}
class Gota {
  float x,y;   // Variables de ubicacion de las gotas
  float velocidad; // velocidad
  color c; //color de las gotas
  float r;     // el radio de la gota

  Gota() {
    r = 8;                 // todas las gotas son del mismo tamanio
    x = random (width);     // empezar con una ubicacion 'random' dentro del 'width'
    y = -r*4;              // comenzar mas arriba de el campo , 
    //para que parezcan que caen desde mas alla.
    velocidad = random(1,10);   // elegir una velocidad random entre 1 y 5
    c = color(50,100,150); // Color de las gotas
  }

  // mover la gota hacia abajo
  void llover() {
    // acelerar velocidad
    y += velocidad; 
    x+=velocidad/4;//empujandolas un poco hacia la derecha
  }

 // mostrar-dibujar las gotas
  void mostrar() {
    fill(10,689,98,90);
    noStroke();
   rect(x,y,49,89);
   fill(x,909,y);
   ellipse(x,y,59,89);
  }
}




