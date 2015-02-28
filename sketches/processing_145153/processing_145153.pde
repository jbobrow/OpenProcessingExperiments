
//Dibujare un angry bird que se movera con una vel inicial. 
//El dibujo chocara con sus limites en la ventana.
//Cuando se clique en la ventana se cambiara la posicion del dibujo
//a la del mouse, la velocidad y la medida de las pupilas.
//El color de fondo variara en funcion de la posicion del dibujo 
//y variara a la misma velocidad que el movimiento del dibujo.
int posX, posY, velX, velY;
int a,b;
int ojoDerecho, ojoIzquierdo;
int rojo, verde, azul;

void setup(){
  size(600,600);
  a = width;
  b = height;
  noCursor();
   
  //Inicializo posición X e Y
  posX = a/2;
  posY = b/2; 
  //Defino velocidad
  //distinta velX y velY para que no se mueva en diagonal
  velX = 1;
  velY = 3;
  //Defino la medida de las pupilas inicial
  ojoDerecho = 20;
  ojoIzquierdo = 20;
  //Defino colores que varien
  rojo = 0; 
  verde = 0;
  azul = 0;
}

void draw(){
  background(rojo,verde,azul);
  
  //Se ejecuta el dibujo
  dibuixarAngry(posX, posY); 
  //Actualizo la posicion del dibujo en funcion de vel
  posX = posX+velX;
  posY = posY+velY; 
  //Choque con las paredes en sus limites
  if(((posX)+120) >= a || (posX-120) <= 0){
    velX = velX * -1;
  }
  if(((posY)+120) >= height || (posY-115) <= 0){
    velY = velY * -1;
  } 
 //Actualizo color de fondo en funcion de la aceleracion y vel
 rojo = rojo+velY;
 verde = verde+velX;
 azul = azul+velX; 
}

//Evento de click mousepressed()
void mousePressed() {
  //Se ejecuta el dibujo segun posicion del raton
  posX = mouseX;
  posY = mouseY;
  //Estos if son para evitar que cuando clickamos 
  //en los bordes de la pantalla (distancia de 120)
  //el muñeco entre en un bucle de *-1 debido a que 
  //la position siempre estaria fuera de la ventana
  if(posX <= 120){ posX = 121; }
  if(posX >= (width - 120)){ posX = width - 121; }
  if(posY <= 120){ posY = 121; }
  if(posY >= (height - 120)){ posY = height - 121; }
  //Se genera una velocidad nueva random
  velX = random(2,9);
  velY = random(2,9);
  //Se genera un tamaño de pupila nuevo random
  ojoDerecho = random(10,70);
  ojoIzquierdo = random(10,70);
  
}

//Dibujo
void dibuixarAngry(int a, int b){
  fill(255); //ojos
  stroke(0);
  strokeWeight(7);
  ellipse(a-50,b-15,100,100);
  ellipse(a+50,b-15,100,100);
  fill(0);  //pupilas
  ellipse(a-40,b-15, ojoDerecho, ojoDerecho);
  ellipse(a+30,b-15, ojoIzquierdo, ojoIzquierdo);
  fill(0);  //cejas
  quad(a-120,b-70,a,b-30,a,b-50,a-105,b-110);
  quad(a+120,b-60,a,b-30,a,b-50,a+105,b-90);
  strokeWeight(5);  //boca
  fill(255,196,0);
  triangle(a-80,b+60,a,b,a+100,b+80);
  fill(234,173,40);
  triangle(a-75,b+63,a,b+120,a+80,b+80);
}


