
/* 
 /////////////////////////////////////////////////
 Colectivo MALAB / Sevilla
 www.distopic.es / info@colectivomalab.org
 /////////////////////////////////////////////////
 Ejemplo simple de cómo medir ángulos con vectores
 /////////////////////////////////////////////////
 */

PVector v1 = new PVector(250, 0);
PVector v2 = new PVector(0, 250);
int cuadrante = 1;

void setup() {
  size (501, 501);
}

void draw() {

  // Dibuja Rejilla
  background(200);
  stroke(0);
  for (int n=0; n<11;n++) {
    strokeWeight(0.2);
    line(n*50, 0, n*50, 500);
    line(0, n*50, 500, n*50);
  }

  // Dibuja Ejes
  strokeWeight(3);
  line(250, 0, 250, 500);
  line(0, 250, 500, 250);
  fill(155, 0, 0);
  text("X", 10, 270);
  text("Y", 260, 20);

  // Dibuja vectores
  pushMatrix();
  strokeWeight(4);
  stroke(255);
  translate(250, 250);
  line(0, 0, v1.x, v1.y);
  line(0, 0, v2.x, v2.y);
  popMatrix();

  v2.x= mouseX-250; //mueve el ratón para cambiar el ángulo
  v2.y= mouseY-250; 

  // Cuadrantes
  if (v2.x>=0 && v2.y<0) { 
    cuadrante =1;
  } 
  else if (v2.x>=0 && v2.y>=0) { 
    cuadrante =2;
  } 
  else if (v2.x<0 && v2.y>=0) { 
    cuadrante =3;
  } 
  else {
    cuadrante =4;
  }

  // Saca info a consola
  float a = PVector.angleBetween(v1, v2);
  text(("Ángulo "+int(degrees(a))), mouseX+5, mouseY);
  text(("Cuadrante "+cuadrante), mouseX-85, mouseY);
  //  println("Ángulo de "+degrees(a)+" grados en el "+ cuadrante+" cuadrante"); // Escribe el ángulo
}


