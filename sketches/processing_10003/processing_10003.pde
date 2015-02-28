
//Miguel vilachá 2010
float  angulo = 10;
int pedo=100 ;
void setup() 
{
  background(155,240,252);

  frameRate(30); 
  size(900,600);
  smooth(); 
  //noCursor();
}

void draw() {
  dibujarLinea();
}

void keyPressed() {
  switch(key) {
  case '+': 
    pedo++;
    break;
  case '-': 
    pedo--;
    break;

  case 'q': 
    println("endRecord");
    endRecord();
    break;
  case 's': 
    println("BEGIN RECORD");
    beginRecord(PDF, "Lines.pdf"); 
    break;
  }
}
void mouseDragged() {
  println("ddddm:"+pedo);
  dibujarPelotas();
}// void fill... todo un crack :) por que cojones lleva mallusculas noFill
void mouseMoved() {
  noFill();
  //el alpha me funciona como opacidad
  stroke(5,10);
  //referencia triangulos
  triangle(random(mouseY),random(height),map(mouseY,0,mouseX,width,50),map(300,200,mouseY,mouseY,50),random(width),random(height));
}
void dibujarLinea() {
  if (mouseX != 8) {

    pushMatrix();
    angulo =  angulo+ PI/12;
    stroke(0,30);
    strokeWeight(2);
    translate(mouseX,mouseY);
    rotate(360);
    // juguemos un poco con el ramdom
    line (random(mouseY),random(mouseX),random(width),random(height));
    popMatrix();
  }
}
//ahora son triangulos 
void dibujarPelotas() {
  noStroke();
  fill(devuelveColor());
  float tampon = map(mouseY,2,height,1,pedo);
  // triangulo culo
  triangle(mouseX,tampon, tampon,mouseY, tampon,tampon);
}
//por que no cambia el color
color devuelveColor() {
  float rojo = 55;
  float verde = random(100,255);
  float azul = 200;
  return color(rojo,verde,azul);
}



