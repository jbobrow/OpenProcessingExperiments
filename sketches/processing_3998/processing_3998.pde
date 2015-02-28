
/**PaulinaOrellana_PROYECTO_LC0_25_08_09

Sketch basado en "Strings" por Drew Ratliff
Ellpises en movimiento en función del seno, conseno y del mouse.
Al presinar espacio se crean mas circulos y con delete se borran.
Al presionar las fechas izquierda y derecha disminuye o aumenta 
velocidad del movimiento de las elipses y con las flechas hacia arriba
y abajo se expanden o contraen. Todo esto permite crear variables
formas.*/



float angle = 0.5; //ángulo
float speed = .05; //velocidad
float range = 300; //rango
int num = 1;   //número inicial de circulos
boolean dir = true; 

 
circulo[] circulos; //arreglo de objetos
 
void setup() { 
  smooth(); 
  size (750,500); 
  circulos = new circulo[500]; 
   
  for(int i = 0; i < 500; i++) { 
   circulos[i] = new circulo(int(random(width)),int(random(width))); 
    
  } 
 
} 
 
 void draw () { 
  background(#F4D8FF);
  randomSeed(5); 
  translate(0,height/2);
  for(int i = 0; i < num; i++) { 
  circulos[i].display(); 
  } 
  angle += speed; 
  println(dir); 
} 
 class circulo { 
  float b1x; 
  float b1y; 
  float b2x; 
  float b2y; 
  float sinval; 
  float cosval; 
  circulo(float x1, float x2) { 
   b1x = x1; 
   b2x = x2; 
} 
void display() { //seno y coseno
     sinval = sin(random(angle));
    cosval = cos(random(angle)); 
    float b1y = (sinval * range); 
    float b2y = (cosval *range);
    strokeWeight(0.3);
   noFill(); 
   ellipse(b1x,b1y,mouseX,mouseY);  //en función del mouse
} 
} 

 
void keyPressed() { //en función del teclado
    if (key == BACKSPACE) { 
    if (num > 2) { 
    num = num - 2; 
    } 
  } 
    if (key == ' ') { 
    if (num < 150) { 
      num = num + 2; 
    } 
  } 
    if (key == CODED) { 
    if (keyCode == RIGHT) { 
    if(speed < .15) { 
    speed = speed + .002; 
          } 
        } 
     else if (keyCode == LEFT) { 
     if(speed > 0) { 
     speed = speed - .002; 
      } 
      } 
      else if (keyCode == UP) { 
      if (range < 600) { 
          range = range + 6; 
          } 
        } 
        else if(keyCode == DOWN) { 
          if (range > 60) { 
          range = range - 5; 
          } 
        } 
    } 
} 


