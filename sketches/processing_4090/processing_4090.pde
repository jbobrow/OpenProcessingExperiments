
/**VIVIANA ACEVEDO - 25 DE AGOSTO DEL 2009 
FISIÓN ATÓMICA
Película basada en un sketch interactivo, 
en ella aparecen unas esferas que se desplazan
por todo el espacio tridimensional, de diferentes
tonos azulados y violetas.
Mientras pasa el tiempo estas esferas parecidas a átomos 
sufren algo muy parecido a la fisión nuclear
desde su interior y constantemente aparecen rayos de luz 
que las atraviesan semejando su pronta destrucción.
A la vez el espacio se va volviendo lentamente más y más oscuro, 
hasta un profundo negro.
___
El sketch interactivo funciona de acuerdo a la sensibilidad del mouse,
las esferas se posicionarán donde él esté.
Mientras más rápido se deslize el mouse por el paño
más separación tendrán las esferas, 
las luces y oscuridad se generan solos.
Al apretar el mouse se termina de grabar la película
(Esas funciones irán comentadas para que corra mejor)
Y al hacer click empieza un espacio nuevo.
___
En sus inicios el .pde venía con música, pero espero poder editar el video 
e ahí incorporarla, ya que intenté en OPENPROCESSING y el sistema colapsaba,
mucha información muy pesada. 
*/


//import processing.video.*; //Importar un video de processing

//MovieMaker mm; //La hacedora de películas se llamará mm

float r, R; //Defino floats para noise

void setup(){ //El lienzo que no cambia durante toda la pelicula

  size(500,500,P3D);  //Tamaño y 3era dimensión
//mm = new MovieMaker(this, width, height, "drawingFINFIN.mov",30, MovieMaker.H263, MovieMaker.LOSSLESS);
  background(204);
 //Hace una película sacada de este sketch, con este alto, ancho, de la más alta calidad, y con tal nombre
  background(206,228,232,10); //Color de Fondo Celeste
  smooth(); //Suavizado
  stroke(0); //Con las líneas más delgadas 
  r= 0; //r partirá de 0 e irá aumentando  gradualmente
} 

void draw(){  //Lo que dibuja

  r+=0.01; //se agrega 0.01 cada vez que se realiza el dibuja 
  //mm.addFrame(); //valor de la película, de sacar una foto cada vez que se completa el void del dibujo
  R= noise(r)*3;  //R será un valor sacado del noise y multiplicado por 3
  stroke(1,1,1,1); //Líneas celestes
  lights();//Luces para resaltar el volumen de las esferas
  translate(mouseX,mouseY,mouseY);  //Que gire persiguiendo el mouse
  rotateX(random(1,200));  //
  rotateY(100); // Que sus ejes giren dentro de un valor, fijo para Y y cambiante en X
  fill(random(50,100),random(50,100),random(50,200),128);   //  Gama de colores aleatorios con bases azules y verdes
  sphere(R*7);  //El tamaño aleatorio de la esfera dentro de un rango definido por noise
  fill(206,228,0,-100); //Rellenar de color negro
  rect(0,0,500, 500); // El cuadrado que cubre poco a poco el lienzo de color negro


}


void keyPressed(){ //Si aprieto una tecla, todo de nuevo
  setup();
}

/*void mousePressed(){ //Si aprieto el mouse se termina de grabar la película
  mm.finish();
  // Cuando Processing ejecute la última frase (mousePressed) la película tendrá fin y se cerrará la ventana
  exit();
}

*/

