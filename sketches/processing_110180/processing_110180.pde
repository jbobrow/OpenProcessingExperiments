
//basado en http://artegenerativo.laad.com.mx/genart/eduardoh/3.html

//Dibuja cuadros de tamaño aleatorios
//Dibuja lineas desde las esquinas hasta el cuadro dibujado
//Dibuja una cruz de color aleatorio en la mitad del cuadro
//Dibuja un cuadro semi transparente para hacer desaparecer lo dibujado antes
//Al dar click el cuadro empieza a segir al mouse

float vel=50; 
float movx=0;
float movy=2;
bool followMouse = true;

void setup() {
  size(800, 400);
  frameRate(5);
  smooth();
}

void draw() {
  //oculta el cuadro anterior
  noStroke();
  fill(255, 70);
  rect(0, 0, width, height);
  
  //gris aleatorio
  float col = random(30, 60);
  fill(25, col);
  stroke(0, 10);
  
  //elige el tamaño del cuadro
  float tamx = random(10, 40);
  float tamy = random(10, 40);
  
  //mueve hacia adelante (o hacia atras)
  float incx = noise(vel);
  movx += vel+incx;   
  //movx = random(width);
  movy = random(height);  
  
  //seguimos el mouse
  if(followMouse){
    movx = mouseX - (tamx/2);
    movy = mouseY - (tamy/2);
  }
  
  //dibuja el cuadro principal  
  rect(movx, movy, tamx, tamy); 
  
  //dibuja las lineas desde las esquinas
  stroke(0, random(50));  
  line(0, 0, movx, movy);
  line(width, 0, movx+tamx, movy);
  line(width, height, movx+tamx, movy+tamy);
  line(0, height, movx, movy+tamy);
  pushMatrix();
  
  //dibuja la cruz en la mitad
  stroke(random(255),random(255),random(255));
  translate(movx+(tamx/2), movy+(tamy/2));
  line(-10,0,10,0);
  line(0,-10,0,10);
  popMatrix();
  
  //si se cuando llega al final del eje 'x' se devuelve
  if ((movx > width) || (movx < 0)) {
    vel = -vel;
  }
}

void mousePressed(){
  background(255);
  followMouse = !followMouse;
}
