
/* Its a wonderfull world is an interactive game which seeks to
improve the capabilityes of the user to eliminate the disturbing bugs 
of the daily life

Please sit confortable and exterminates the plague 
dragging the mouse to hunt the flies and kill them with pressing  
the left button

Press R to run 
Press S to reiniciate

*/

// global Variables 
PImage x;
PImage y;
PImage z;
PImage a;
PImage b;
float w = 0;
float h = 100;
float w1 = 0;
float h1 = 100;
float w2 = 0;
float h2 = 0;
float angulo = 0;
int R= 220;


/* setup () 
Descargo las imagenes y establezco la velocidad de movimiento
del personaje*/

void setup () {
  size (800,700);
  x = loadImage ("fondo1.jpg");
  y = loadImage ("fondo2.jpg");
  z = loadImage ("Mosca para colorear pintar.gif");
  a = loadImage ("matamoscas.png");
  b = loadImage ("mancha.png");
  frameRate (8);
}

// draw ()

void draw (){
// Establezco las condiciones en las que se mostraran las 
// imagenes del fondo / interaccion con el teclado 1
 if (key == 'S' ||key =='s') {
    image (x,0,0,800,700);
  } else {
    image (y,0,0,800,700);
  }
  
 // Agrego el insecticida y lo ato al movimiento del cursor
  mouseDragged (); 
  w1 = mouseX;
  h1 = mouseY;
  image (a,w1-80,h1-50,100,100);

 // Establezco las condiciones en las que se mostraran las 
 // imagenes del fondo / interaccion con el teclado 2
  
    if (key == 'R' ||key =='r') {
    move ();
    display ();
    } else {
    image (x,0,0,800,700);
  }
  
  // Agrego la mancha de sangre y lo condiciono al mouse
  if (mousePressed == true) {
  w2 = mouseX;
  h2 = mouseY;
  image (b,w/2,h/3,400,400);
  } 
}

// Establezco el movimiento y el personaje
    void move () {
    w = width/2.5 + R * cos (angulo) + random (130);
    h = height/2.5 + R * sin (angulo)+ random (130);
    angulo = angulo+0.15;
    
    if (w> width) {
    w = 0;
    if (h> height ){
    h = 0;
      }
    }
}
void display () {
  image (z,w,h,50,50);  
 }
 

    

  
     


