
Gota[] gotas = new Gota[1000];
//nueva variable para saber cuantas gotas van y para empezar de nuevo el array
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
  for (int i = 0; i < totalgotas; i++ ) { // New! We no longer move
//and display all drops, but rather only the “totalDrops” that are
//currently present in the game.
    gotas[i].llover();
    gotas[i].mostrar();
    gotas[i].volver();
  }
 
}
 
class Gota {
 
  float x,y;   // Variables de ubicacion de las gotas
  float velocidad; // velocidad
  color c;
  float r;     // el radio de la gota
 
  Gota() {
    r = 8;                 // todas las gotas son del mismo tamano
    x = random(width);     // empezar con una ubicacion 'random' dentro del 'width'
    y = -r*4;              // comenzar mas arriba de el campo
    velocidad = random(1,10);   // elegir una velocidad random entre 1 y 5
    c = color(210,210,50); // Color de las gotas
  }
 
  // mover la gota hacia abajo
  void llover() {
    // acelerar velocidad
    y += velocidad;
    x+=velocidad/4;//empujandolas un poco hacia la derecha
  }
  void volver(){
    
   if ((x>width)|| (x<0)||(y
>height)
)
   {
        
    velocidad=velocidad* -1; 
   } 
  }
 
 // mostrar-dibujar las gotas
  void mostrar() {
    fill(c);
    //noStroke();
    
    ellipse (x,y,20,36);
   fill(200);
      ellipse(x,y,28,random (12));
      fill(50);
      ellipse(x,y,8,8);

     // fill(random(c));
   
    
  }


  }



