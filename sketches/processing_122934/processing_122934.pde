
PImage imga;  
int xa=20, ya=200, wa, ha;
String msj = "";
  
void setup() {
  size(350, 450);
   imga = loadImage("http://www.colaco.info/BotonAmarillo%20copy.gif");

    
}
  
void draw() {
  wa = imga.width*0.8;
  ha = imga.height*0.8;
  image(imga, xa, ya, wa, ha);
  fill(0);
  text(msj, xa, ya+20);
}
  
void mouseClicked() {
    int x=mouseX, y=mouseY;
    if (x>=xa && y>=ya && x<=xa+wa && y<=ya+ha ) {
        msj = "mal";
    }
}

