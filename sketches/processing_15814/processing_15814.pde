
//Código Gotas:



Gota[] gotas = new Gota[500]; //Declaracion de variable TIPO arreglo o 'array'

//que se llama 'gotas' y contiene 1000 elementos tipo 'Gota'



int totalgotas;//esto esta para volver a cero despues que aparecen las 5000

//nueva variable para saber cuantas gotas han salido



void setup() {

  size(1000,800);

  smooth();

}



void draw() {

 // background(0);

 fill (0,50);

 rect (0,0,width, height);

 

  

  // Iniciar las gotas:inicia el array

  gotas[totalgotas] = new Gota();

  // Sumar al numero de gotas: Esto equivale la frase:

  // "totalgotas =  totalgotas+1;"

  totalgotas++ ;// las gotan van aumentando

  // si llegamos al final de las gotas...length es largo (5000)

  if (totalgotas >= gotas.length) {

    totalgotas = 0; //empezar de nuevo

  }



  // hacer llover y mostrar

  for (int i = 0; i < totalgotas; i++ ) { 

    //for loop para otorgar el verbo 'llover' y 'mostrar' a todas las gotas

    //y a cada una, una por una...

    gotas[i].llover();//para que cada gota caiga

    gotas[i].mostrar();// para que cada gora se muestre

 gotas [i].rebotar ();

  }



}

class Gota {

  float x,y;   // Variables de ubicacion de las gotas

  float velocidadY; 

  float velocidadX;// velocidad

  color c; //color de las gotas

  float r;     // el radio de la gota



  Gota() {

    //r = 8;                 // todas las gotas son del mismo tamanio

    x = random (width);     // empezar con una ubicacion 'random' dentro del 'width'

    y = -4;              // comenzar mas arriba de el campo , 

    //para que parezcan que caen desde mas alla.

    velocidadY = random(1,10); 

  velocidadX= random (1,10);  // elegir una velocidad random entre 1 y 5

    c = color(50,100,150); // Color de las gotas

  }



  // mover la gota hacia abajo

  void llover() {

    // acelerar velocidad

    y += velocidadY; 

    x+=velocidadX;//empujandolas un poco hacia la derecha

  }



 // mostrar-dibujar las gotas

  void mostrar() {

    fill(c);

    noStroke();

    ellipse(x ,y  , 9, 9);
    stroke(12,52,158);
    line(x,y,58,21);

  }

  

  void rebotar (){

    if (y>=height){

  velocidadY = velocidadY *-1;

    }

     if (x>=width || x<=0 ){

  velocidadX = velocidadX*-1;

    }

   

  }



    

    

    

    

  

}


