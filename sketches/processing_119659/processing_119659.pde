
//para tomarlo como ejenplo //

PImage img;  // Declare variable "a" of type PImage
int xb=100, yb=50, wb, hb; // tamaño imagen
String mensaje = "PULSAR BOTON";
 
void setup() {
  size(640, 360);
   img = loadImage("http://www.wpclipart.com/blanks/buttons/glossy_buttons/.cache/glossy_button_blank_aqua_rectangle.png");  // Load the image into the program 
  background(0);
  frameRate(10);
}
 
void draw() {
  wb = img.width*0.8;
  hb = img.height*0.8;
  image(img, xb, yb, wb, hb);
  fill(0);
  text(mensaje, xb+5, yb+25);
}
 
void mouseClicked() {
    int x=mouseX, y=mouseY;
    if (x>=xb && y>=yb && x<=xb+wb && y<=yb+hb ) {
        mensaje = "BOTON OPRIMIDO";
    }
}
