
/*
PROYECTO 01 SESION 2 : CONTINUO
 
 Título: Miro
 Nombre: Gerardo Borges
 Fecha:  26/05/2010
 Lugar: Barcelona
 Basado en el example Perspective.
 
 * Perspective. 
 * 
 * Move the mouse left and right to change the field of view (fov).
 * Click to modify the aspect ratio. The perspective() function
 * sets a perspective projection applying foreshortening, making 
 * distant objects appear smaller than closer ones. The parameters 
 * define a viewing volume with the shape of truncated pyramid. 
 * Objects near to the front of the volume appear their actual size, 
 * while farther objects appear smaller. This projection simulates 
 * the perspective of the world more accurately than orthographic projection. 
 * The version of perspective without parameters sets the default 
 * perspective and the version with four parameters allows the programmer 
 * to set the area precisely.
 */

void setup() {
  size(543, 391, P3D);
  noStroke();
}


void draw() {
  lights();
  background(229, 222, 216);
    
    //brochazos
    translate(0, 0, -100);
  PImage a;  // Declare variable "a" of type PImage
  a = loadImage("brocha.png");  // Load the image into the program  
  image(a, 0, 0); 

  float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
//  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/150 + mouseY/float(height) * PI/6);

  translate(0, 0, 200);
  //verdesombra circulo
  noStroke();
  fill(63,77,68,70);
  ellipse (120,22,50,50);
  //verde circulo
  noStroke();
  fill(63,77,68);
  ellipse (120,22,50,50);

  translate(0, 0, -100);
  //azulsombra circulo
  noStroke();
  fill(61,07,175,70);
  ellipse (70,159,50,50);
  //azul circulo
  noStroke();
  fill(61,07,175);
  ellipse (70,159,30,30);

  translate(0, 0, -600);
  //rojo circulo
  noStroke();
  fill(143,54,46);
  ellipse (396,129,30,30);
  
  translate(0, 0, 300);
  //gris1 circulo
  noStroke();
  fill(51,55,56);
  ellipse (451,56,30,30);

  //marron1 circulo
    translate(0, 0, 100);
  noStroke();
  fill(69,66,56);
  ellipse (500,146,30,30);

  //marron2 circulo
  noStroke();
  fill(103,50,40);
  ellipse (124,326,30,30);

  //naranjasombra circulo
    translate(0, 0, -500);
  noStroke();
  fill(170,71,28,70);
  ellipse (366,288,73,73);
  //naranja circulo
  noStroke();
  fill(170,71,28);
  ellipse (366,288,43,43);
  
  translate(0, 0, -900);
  //ROJOBIG circulo
  noStroke();
  fill(200,0,0);
  ellipse (264,96,252,168);
////mancha
//PShape s;
//s = loadShape("mancha.svg");
//shape(s, 390, 70, 160,160);

}


