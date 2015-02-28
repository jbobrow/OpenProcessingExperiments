
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
  size(1920,1080);//tamaño de pantalla
  background(240);//color de fondo
  smooth();    //suavizado
  
  
}


    
void draw() {
  // background(255);
  //Cada vez que se ejecuta draw() nuevos numero aleatorios son introducidos en las variables
  





}
void mouseMoved() {
  }
  void mouseDragged() {

    
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(40);
  diam = random(255);
  x = random(width+100);
  y = random(height-100);

  // usamos variables para dibujar la elipse
  noStroke(); //quitamos el borde
  // ellipse(x,y,diam,diam);//dibujamos la elipse
  
  line(mouseX,mouseY,pmouseX,pmouseY);
  fill(r,g,b,a);//rellenamos con el valor de las 
  rect(mouseX-50,mouseY-50,100,100);
  noFill();
  fill(240);
  
  ellipse(mouseX,mouseY,15,15);
  ellipse(mouseX+50,mouseY+50,10,10);
  ellipse(mouseX+50,mouseY-50,10,10);
  ellipse(mouseX-50,mouseY+50,10,10);
  ellipse(mouseX-50,mouseY-50,10,10);
  fill(r,g,b,a);

  fill(245);

  
}

 


  

void keyPressed() {
  background(245);
  
}


