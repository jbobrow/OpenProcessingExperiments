
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 4-7: Filling variables with random values
/*

 ied 08-09
 sesion_3_funciones_logica_y_control
 Modo continuo. La funcion draw se ejecuta segun el FrameRate. Tantas veces como 
 fotograma por segundo tengamos
 todo lo que esté dentro de draw se va a ejecutar repetidamente, también de arriba a abajo, hasta que paremos el programa
 */

float r; //declaramos variable tipo decimal r
float g;//declaramos variable tipo decimal g
float b;//declaramos variable tipo decimal b
float a;//declaramos variable tipo decimal a

float diam;//declaramos variable tipo decimal diam
float x;//declaramos variable tipo decimal x
float y;//declaramos variable tipo decimal y


void setup() {
  size(500,500);//tamaño de pantalla

  smooth();    //suavizado
  noCursor();
  frameRate(30);
}

void draw() {
  // background(255);
  //Cada vez que se ejecuta draw() nuevos numero aleatorios son introducidos en las variables
 
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(200);
  diam = random(20);
  x = random(width);
  y = random(height);

background(r,g,b,a);//color de fondo
  // usamos variables para dibujar la elipse
  noStroke(); //quitamos el borde
  // ellipse(x,y,diam,diam);//dibujamos la elipse
  stroke(0,0,0,20);
  line(mouseX,mouseY,width/1,height/1);
 
  
  fill(r,b,a);
 ellipse(mouseX,mouseY,50,50);//ellipse grande
  fill(g,b,a);//rellenamos con el valor de las variables

 ellipse(mouseX,mouseY,25,25); //ellipse pequeña
 
 
 
 
}




