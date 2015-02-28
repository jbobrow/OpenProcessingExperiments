
import processing.pdf.*;
//Se definen todas las variables necesarias

//Imagen de fondo
PImage wall;
//Variable para controlar que sticker aparece
PImage sticker;
//Contador para crear un random sobre las stickers, para q no aparezcan siempre por el mismo orden
int contador = 0;
//Numero de stickers que tengamos
int contadorMax = 12;
//Controladores de elemento que queremos dicujar y color
int element;
int colores;
//Tamaño de lo q dibujamos
int tamanio;
//Variables creadas para que no se repitan dos stickers seguidas
int a;
int b;
//Variables para definir los colores
float rojo;
float verde;
float azul;

//Inicializamos las variables
void setup() 
{
  size(1000,600);
  wall = loadImage("wall.jpg");
  background(wall);
  frameRate(15);
  smooth();
  cursor(CROSS);
  imageMode(CENTER);
  sticker = loadImage("st0.png");
  tamanio = width/100;
  colores=1;
}

//Aqui no se hace nada, porque es todo interactivo
void draw()
{

}

//Si el usuario clica aparece una sticker escogida aleatoriamente

void mousePressed(){
  pegarSticker();
}

//Controlamos lo q se introduce por teclado
void keyPressed() {
  
  switch(key) {
 
    case '+': // Aumenta el tamño de lo q dibujamos 
    tamanio++;
    break;
  
  case '-':  // Disminuye el tamaño de lo q dibujamos
    tamanio--;
    break;
    
  case 'c': // Dibujaremos circulos
    element=0;
    break;
    
    case 'r': //Dibujaremos cuadrados
    element=1;
    break;

  case 'x': // Escogemos colores rojos
    colores=1;
    break;
  
  case 'y': //Escogemos colores azules
    colores=2;
    break;
  
  case 'z': //Escogemos colores lilas
    colores=3;
    break;
    
  //Esto sirve para crear un pdf con lo q hemos hecho
  
  case 'q': 
   println("endRecord");
     endRecord();
    break;
    
  case 's': 
    println("BEGIN RECORD");
   beginRecord(PDF, "Lines.pdf"); 
    break;
  }
}


//Cuando el mouse esta pulsado debe reconocer si esta pintando circulos o cuadrados
void mouseDragged() {
  if (element==0) dibujarPelotas();
  if (element==1) dibujarCuadrados();
}

void dibujarPelotas(){ //La funcion que dibuja pelotas
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}

void dibujarCuadrados(){ //La funcion que dibuja cuadrados
  noStroke();
  fill(devuelveColor());
  float tam = random(tamanio);
  quad(mouseX,mouseY,mouseX,mouseY+tam,mouseX+tam,mouseY+tam,mouseX+tam,mouseY);

}

color devuelveColor(){ // La funcio que escoge el color segun se haya pulsado 'x', 'y' o 'z'
  if (colores==1){
  rojo = 255;
  verde = random(100,255);
  azul = 0;
  }
  if (colores==2){
  rojo = 0;
  verde = random(100,255);
  azul = 255;
  }
  if (colores==3){
  rojo = random(100,255);
  verde = 0;
  azul = 255;
  }
  return color(rojo,verde,azul);
}

//Esta funcio pega los stickers en el fondo

 void pegarSticker(){
   a=contador;
   contador=int(random(contadorMax));
   b=contador;
   if (a==b) contador++; // Hasta aqui comprobamos q la nueva sticker no sea igual a la anterior, en dicho caso,
                         //se aumenta uno para q escoja una diferente y no se repitan dos seguidas
   sticker=loadImage("st"+contador+".png"); // Aqui carga la sticker
   image(sticker,mouseX,mouseY);
 }

