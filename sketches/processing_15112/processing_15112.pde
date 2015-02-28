


float r; //declaramos variable tipo decimal r
float g;//declaramos variable tipo decimal g
float b;//declaramos variable tipo decimal b
float a;//declaramos variable tipo decimal a

float diam;//declaramos variable tipo decimal diam
float x;//declaramos variable tipo decimal x
float y;//declaramos variable tipo decimal y

void setup() {
  size(1920,1080);//tamaño de pantalla
  background(100);//color de fondo
  smooth();    //suavizado
  noCursor();
}

void draw() {
  // background(255);
  //Cada vez que se ejecuta draw() nuevos numero aleatorios son introducidos en las variables
  r = random(255);
  g = random(150);
  b = random(75);
  a = random(35);
  diam = random(50);
  x = random(width+200);
  y = random(height-50);

 
  noStroke(); 
 
  ellipse(mouseX,mouseY,width/10,height/10);
 
  fill(r,g,b,a);//rellenamos con el valor de las variables
ellipse(mouseX,mouseY,10,10);
}
  
  
  


  


