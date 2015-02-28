
import processing.opengl.*;

PImage fondo;
PImage perro; //este nombre tb puede ser img, cada cual le asigna un nombre
PImage per1;  //persona sola
PImage per2;  //pareja
PImage gale; //galeria para fondo

float rotx = PI/4;
float roty = PI/4;

void setup()
{
 
  size(1000, 420, OPENGL);
  perro = loadImage("foto.jpg");
  fondo = loadImage("fondo.jpg");
  per1 = loadImage("per1.png");
  per2 = loadImage("per2.png");
  gale = loadImage("gale.png");
  textureMode(NORMALIZED);
  fill(255);
  stroke(color(44,48,32));
}

void draw() 
{
 background(gale);
 noStroke();
 translate(width/2.0, height/2.0, -300);
 
 //nos permiten llamas a las variables y rotar el objeto
 rotateX(rotx);
 rotateY(rotx);
 scale(90);
 lights();
 pointLight(150, 10, 0, 200, 0, 10);
 pointLight(150, 100, 0, -200, 0, 0);
 //le da la textura al cuba y ademas llama la función que
 //se llama Texturedcube
 Texturedcube (perro);
  Texturedcube1 (fondo);
  Texturedcube2 (per1);
  Texturedcube3 (per2);
 // Texturedcube4 (gale);

 
 
}

//esta funcion dibuja el objero
void Texturedcube(PImage perro) {
  beginShape(QUADS);
  texture(perro);
  
// +Z cara frente
//valores x y z en el caso de -1 corresponde a un
//valor de -50 porciento del total de la imagen
//es decir los dos primeros valores del primer púnto
// grafican en X en Y en la posicion 100, 100




// -Z cara atras


// +X cara derecha
vertex (5, -1, 1, 0, 0);
vertex (5, -1, -1, 1, 0);
vertex (5, 1, -1, 1, 1);
vertex (5, 1, 1, 0, 1);

//cetro

vertex (0, -1, -1, 0, 0);
vertex (0, -1, 1, 1, 0);
vertex (0, 1, 1, 1, 1);
vertex (0, 1, -1, 0, 1);



//-X cara izquierda
vertex (-5, -1, -1, 0, 0);
vertex (-5, -1, 1, 1, 0);
vertex (-5, 1, 1, 1, 1);
vertex (-5, 1, -1, 0, 1);

endShape();
}



//imágen atras

void Texturedcube1(PImage fondo) {
  beginShape(QUADS);
  texture(fondo);

vertex (5, -1, -1, 0, 0);
vertex (-5, -1, -1, 1, 0);
vertex (-5, 1, -1, 1, 1);
vertex (5, 1, -1, 0, 1);

endShape();
}


//persona 1 


void Texturedcube2(PImage per1) {
  beginShape(QUADS);
  texture(per1);
   //translate(width/2.0, height/1.0, 100); //(queria poner esto para poder tener mejor control sobre la  persona pero no aparece)

vertex (3, -1, 1, 0, 0);
vertex (3, -1, -1, 1, 0);
vertex (3, 1, -1, 1, 1);
vertex (3, 1, 1, 0, 1);

endShape();
}


//persona 2

void Texturedcube3(PImage per2) {
  beginShape(QUADS);
  texture(per2);
  
vertex (-3, -1, 1, 0, 0);
vertex (-3, -1, -1, 1, 0);
vertex (-3, 1, -1, 1, 1);
vertex (-3, 1, 1, 0, 1);

endShape();
}




void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  rotx += (mouseX-pmouseX) * rate;

}



