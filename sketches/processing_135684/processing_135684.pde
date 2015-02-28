

float i = 0;
void setup() {
  size(800, 800);
  }
void draw() {
  //background(0);
  i=i+0.02;
  noCursor();
  float vel = 0;
  float posicionX = 300*sin(i);
  float posicionY = 300*cos(i);

  float otraPosicionX = 50*sin(i*15);
  float otraPosicionY = 50*cos(i*15);
  //pendiente
  float grueso = 30;


  //centro
  fill(255, 0, 0);
  ellipse((width/2)+posicionX, (width/2)+posicionY, 60, 60);
  //centro mas pequeño
  ellipse((width/2)+posicionX, (width/2)+posicionY, 30, 30);
  //derecha abajo
  fill(0);
  ellipse((width/1)+posicionX, (width/1)+posicionY, 20, 20); 
  //izquierda abajo
  fill(0);
  ellipse((width/30)+posicionX, (height)+posicionY, 20, 20); 

  //izquierda
  fill(0);
  ellipse(width/1+posicionX, height/25+posicionY, 20, 20);
  //derecha
  fill(0);
  ellipse(width/30+posicionX, height/50+posicionY, 20, 20);
  //pequeños
  ellipse(width/2, 400, width/7, height/7);
  fill(255, 0, 0);
  ellipse(width/2, 400, width/9, height/9);
  fill(0);
  ellipse(width/2, 400, width/13, height/13);
  fill (255, 0, 0); 
  ellipse(width/2, 400, width/50, height/50);

  fill(0, 2);
  rect(0, 0, width, height);// cuadrado que cubre toda la pantalla
  fill(30, 50, 255);// relleno blanco
  vel = dist(mouseX, mouseY, pmouseX, pmouseY); // calcula la velocidad del cursor y la graba en la variable
  println(vel); // escribe la velocidad en la pantalla negra
  ellipse(mouseX, mouseY, vel, vel); // elipses que siguen al cursor y con tamaño dependiendo de la velocida
}
