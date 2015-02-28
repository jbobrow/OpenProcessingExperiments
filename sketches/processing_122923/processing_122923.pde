


PImage img;  // Declare variable "a" of type PImage
int xb=20, yb=400, wb, hb; // tamaÃ±o imagen
String mensaje = "ayuda";
 
void setup() {
  size(350, 450);
   img = loadImage("http://www.ingressioenlanube.com/Imagenes/boton_ayuda.png");  // Load the image into the program 
   
}
 
void draw() {
  wb = img.width*0.8;
  hb = img.height*0.8;
  image(img, xb, yb, wb, hb);
  fill(0);
  text(mensaje, xb+5, yb+25);
  
  switch(pantalla) 
        case 1:
            text("MENU",50,50);       
            break;
        default:
            text("DEMO",100,150);               
            break;
       
}
 
void mouseClicked() {
    int x=mouseX, y=mouseY;
    int pantalla = 1;
    if (x>=xb && y>=yb && x<=xb+wb && y<=yb+hb ) {
    switch(pantalla) {
        case 1:
            pantalla = 1; 
            redraw(ayuda);
            break;
        case 2:
        default
            pantalla = 2;
            redraw(campo electrico 2.0);
            break;
           
    }
}
