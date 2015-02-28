
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
float speed = 1;
float angulo = 0;
int R= 150;


// setup ()
void setup () {
  size (800,640);
  x = loadImage ("fondo1.jpg");
  y = loadImage ("fondo2.jpg");
  z = loadImage ("Mosca para colorear pintar.gif");
  a = loadImage ("matamoscas.png");
  b = loadImage ("mancha.png");
}

 // draw ()

void draw (){
 
 if (key == 'S' ||key =='s') {
    image (x,0,0,800,640);
  } else {
    image (y,0,0,800,640);
  }
  mouseDragged (); 
  w1 = mouseX;
  h1 = mouseY;
  image (a,w1,h1,100,100);
  
    if (key == 'R' ||key =='r') {
    move ();
    display ();
    } else {
    image (x,0,0,800,640);
  }
  if (mousePressed == true) {
  w2 = mouseX;
  h2 = mouseY;
  image (b,w/2,h/3,400,400);
  }
}
void move () {
    w = width/2 + R * cos (angulo);
    h = height/2 + R * sin (angulo);
    angulo = angulo+0.05;
    
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
 

    

  
     



