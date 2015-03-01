
/* 
 Soportes y Tecnologias / TP1
 ------------------------------------------------------
 Mariana Lombard
 ------------------------------------------------------
 Version libre de Process 18 (Software 6) de Casey REAS
 https://vimeo.com/63471218
 */


Quad[] miQuad;//objetos del tipo Quad
int cantidad = 1000;

void setup() {
  size(600, 600);
  background(255);
  frameRate(10);
  miQuad = new Quad [cantidad];
  for ( int i=0; i<miQuad.length; i++ ) {
    miQuad[i] = new Quad();
  }
}


void draw() {

  fill(255, 5);
  rect(0, 0, width, height);

  for ( int i=0; i < 5; i++) {
    miQuad[i].dibujar_lineas();
  }
  for ( int j=0; j < random (cantidad); j++ ) {
    miQuad[j].mover();
    miQuad[j].dibujar();
  }
  for ( int k=0; k < cantidad; k++ ) {
    miQuad[k].cambiar_color();
  }
}

//defino la clase
class Quad 
{
  //atributos
  PVector pos1; 
  PVector pos2;
  PVector pos3;
  PVector pos4;
  PVector velcolor; //atributos de color
  color gris;
  PVector c;
  color nuevo_color;

  float x; //atributos de movimiento
  float y;
  float dirx;
  float diry;
  float direccion;
  float vel;
  float amplitud;


  //constructor
  Quad() {  
    pos1 = new PVector(random (10, 15), random (40, 50));
    pos2 = new PVector(random (20, 35), random (25, 55));
    pos3 = new PVector(random (10, 37), random (45, 65));
    pos4 = new PVector(random (30, 50), random (65, 100));

    gris = color (random(75, 255)); //inicializo atributos de color
    c = new PVector (random(198, 255), random(150, 255), random (0, 255));
    nuevo_color = color (c.x, c.y, c.z);
    velcolor = new PVector (1, 1, 1);


    x=random(width); //inicializo atributos de movimiento
    y=random(height);
    direccion = random(-TWO_PI, TWO_PI);
    vel = 2;
    amplitud = radians (15);
  }

  //metodos

  void dibujar() {
   
    pushMatrix();
    translate(x, y);
    rotate(direccion);
    noStroke();  
    fill(gris);
    beginShape();
    vertex(pos1.x, pos1.y);
    vertex(pos2.x, pos2.y);
    vertex(pos3.x, pos3.y);
    vertex(pos4.x, pos4.y);
    endShape();
    popMatrix();
  }

  void dibujar_lineas() {
    pushMatrix();
    translate (x, y) ;
    rotate(random (direccion)-(direccion));
    strokeWeight(random(1, 5));
    stroke(255);
    noFill();
    beginShape();
    vertex(width, height);
    bezierVertex(pos1.x+15, pos1.y+50, pos2.x+80, pos2.y+100, pos3.x+140, pos3.y+15);
    endShape();
    popMatrix();
  }

  void mover () {
    direccion += random(-(amplitud), (amplitud));
    dirx = vel * cos( direccion );//nueva direccion
    diry = vel  * sin( direccion );//nueva direccion
    x = x+dirx;
    y = y+diry;
    limite();
  }

  void cambiar_color() {
    c.add(velcolor);
    nuevo_color = color (c.x, c.y, c.z);
    if ( (c.x>255) || (c.x<0) &&(c.y>255) || (c.y<0) &&(c.z>255) || (c.z<0) ) {
      velcolor.x *= -1;
      velcolor.y *= -1;
      velcolor.z *= -1;
      pushMatrix();
      translate(x*4, y*4);
      rotate(random (direccion)-(direccion));
      noStroke();  
      fill(nuevo_color);
      beginShape();
      vertex(pos1.x, pos1.y);
      vertex(pos2.x, pos2.y);
      vertex(pos3.x, pos3.y);
      vertex(pos4.x, pos4.y);
      endShape();
      popMatrix();
    }
  }

  void limite() {
    //Limites de la pantalla
    if (x<0) {
      x=width;
    }
    if (x>width) {
      x=0;
    }

    if (y<0) {
      y=height;
    }
    if (y>height) {
      y=0;
    }
  }
}



