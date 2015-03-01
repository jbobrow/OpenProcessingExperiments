
//TP 4 Collage de imagenes y texto, modificaciones de escala, rotacion y texto de acuerdo a la interaccion del usuario

//declaracion de variables
int numImg = 5; //numero de frames
PImage[] imagen = new PImage [numImg]; //creacion del array imagen
int inicio = 1; //frame de inicio
//declaracion de variables para la interaccion con el usuario
float angle = 0.0; 
String texto1 = "esto no es un programa";
PFont font; 

void setup() {
  size(600, 600); 
  smooth();

  //iniciacion del array de imagenes
  for (int i = 1; i <imagen.length; i++) { //este for solo limita el array, hace que cuando llegue a 5, salga del for y no quiera seguir cargando mas imagenes(ya que el array no las tiene)
    String nombre = (i + ".jpg"); //recorre la serie y llena el array nada mas
    imagen[i] = loadImage (nombre);//en que posicion del array cargas la imagen

    //iniciacion de la fuente
    font = loadFont ("fuente.vlw");
    textFont (font);
  }
  frameRate (7);  //reduccion a 7 frames por segundo
}
void draw() {
  background(255);
  translate(width/2, height/2);

  if (mousePressed == true) { //si se presiona el mouse 

      scale( random (0.5, 1)); // la escala varia entre 0.5 y 2.0

    rotate (angle);

    angle=(random (0.1, 6)); //se rota en un angulo variable entre 0.1 y -0.1
  }
  translate(0, 0);
  imageMode(CENTER);
  image (imagen [inicio], 0, 0);  //comienza la secuencia de imagenes a funcionar 
  inicio++;
  if (inicio  >= imagen.length) {
    inicio = 1; //regreso a frame 1
  }

  if (keyPressed) { //si se presiona una tecla

    fill(0);
    textSize(56);
    text(texto1, 70, height/2, 600, 100); //aparece una linea de texto
  }
}



