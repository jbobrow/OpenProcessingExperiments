
PImage mona;
PFont font;

void setup() {
size(800, 600);
font= loadFont ("Acacia23-18.vlw");
textFont (font);

mona = loadImage ("mona.jpg");
image (mona, 0,0,800,600);

}
void draw() {
 fill (0);
 text ("MARCEL DUCHAMP,  1919",290, 540, 600,500);
 text ("Ready-Made",350, 570, 600,500);
     

if (mousePressed == true) {
  strokeWeight (8);
smooth ();
line(mouseX, mouseY, pmouseX, pmouseY);

}
}
  void keyPressed() {
 // saveFrame("1.JPG");
   image (mona, 0,0,800,600);
}


