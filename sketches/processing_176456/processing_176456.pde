
float X = 30;//posicion X
float Y = 30;//posicion Y

float rad = 30; //grandaria del circulo

float velX = 1.5;//velocidad 1
float velY = 1.5;//Velocidad 2

float dirX = 4.0; //De izquierda/derecha
float dirY = 1.5; //De arriba/abajo

float color1,color2,color3; //Declaración colores

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);//Modo de la elipse escogido
  
  //Colores random comienzo
  color1= random(255);
  color2= random(255);
  color3= random(255);
 fill(color1,color2,color3);  
}

void draw() {

//background(0,0,0); //Fondo negro
background(mouseX,mouseY,255);//Al mover el ratón se cambia de color

ellipse(X, Y, rad, rad);//Circulo en la posición de las variables.
 
X += velX*dirX; //Hacer que la redonda se mueva de izquierda a derecha

if (X + rad > width || X - rad < 0 ) { //Si se cumple alguna de las condiciones
      dirX = -dirX; //Hacer que rebote (parte izquierda/derecha)
 
  //Cambiar color
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
  fill(color1,color2,color3);

}
Y += velY*dirY; //Hacer que la redonda se mueva de arriba a abajo

if (Y + rad > height || Y - rad < 0 ) {//Si se cumple alguna de las condiciones
    dirY = -dirY;//Hacer que rebote (parte arriba/abajo)
 
  //Cambiar color
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
  fill(color1,color2,color3); 
}
  } //Final codigo



