
// modificando


float  angulo = 500;  ///pausinho do sol
int tamanio=20 ;  ///tamanho bolinhas para desenhar
void setup() 

//setup basico
{
  background(254,224,56);
  frameRate(30); 
  size(700,400);
  smooth();
  noCursor();
}

 //acao
void draw() {
  dibujarLinea();
}

///preset PDF

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

//bolas fundo
void mouseDragged() {
  println("ddddm:"+tamanio);
  dibujarPelotas();
}

void mouseMoved() {
  fill(random(255),100);
  noStroke();
  ellipse(random(width),random(height),map(mouseX,10,width,0,10),map(mouseX,10,width,0,50));
}


//bolas com tracos
void dibujarLinea() {
  if (mouseX != 10) {

    pushMatrix();
    angulo =  angulo+ PI/12;
    stroke(0,50);
    strokeWeight(2);
    translate(mouseX,mouseY);
    rotate(angulo);
    line(0,0,50,50);
    popMatrix();
  }
  
  
  /// dibujando com las pelotas
}
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tam = map(mouseY,200,height,200,tamanio);
  ellipse(mouseX,mouseY, tam,tam);
}
color devuelveColor() {
  float rojo = random (0,100);
  float verde = random(0,100);
  float azul = 50;
  return color(rojo,verde,azul);
}


