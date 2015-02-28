
float  angulo = 0;
int tamanio=100 ;
void setup() 
{
  background(50); //cambio de color de fondo a gris oscuro
  frameRate(30); //velocidad redibujo lineas
  size(800,200); //cambio de tamaño
  smooth(); //suavizado
  noCursor();
}

void draw() {
  dibujarLinea();
}

void keyPressed() {
  switch(key) {
  case '+': 
    tamanio++;
    break;
  case '-': 
    tamanio--;
    break;
  }
}
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
}
void mouseMoved() {
  fill(random(255),100); //color pelotitas de fondo
  noStroke();
  ellipse(random(width),random(height),map(mouseX,0,width,0,50),map(mouseX,0,width,0,50));
}
void dibujarLinea() {
  if (mouseX != 0) {

    pushMatrix();
    angulo =  angulo+ PI/50;
    stroke(0,50);
    strokeWeight(2);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,100,100);
    popMatrix();
  }
}
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,0,height,0,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = 0; //cambio de colores pelotas dibujadas
  float verde = random(0,100);
  float azul = 10;
  return color(rojo,verde,azul);
}


