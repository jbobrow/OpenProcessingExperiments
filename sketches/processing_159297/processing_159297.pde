
// Cambiar de modos mediante el click

int a = (50);
float alto = 20;
float ancho = 20;
color negro = color(0, 20);
color verde = #87C3AB;
color amarillo = #FFE99C;
int modo = 0;

void setup() { 
  size(800, 200);
  background(#3C3C3C);
  noStroke();
  smooth();
}

void draw() {
  fill(negro);
  rect(0, 0, width, height);
  if (keyCode==RIGHT) {
    ancho = ancho + 1;
  } 
  else if (keyCode==LEFT) {
    ancho = ancho - 1;
  } 
  else if (keyCode==UP) {
    alto = alto + 1;
  } 
  else if (keyCode==DOWN) {
    alto = alto -1;
  } 
    if (modo == 0) {
    fill(verde);
  } 
  else {
    fill (amarillo);
   }
  println(modo); 
  ellipse(mouseX, mouseY, ancho, alto);
}

void mouseReleased() {
  if (modo == 0) {  
  modo = 1;
  } else {
    modo = 0;
  }
}

