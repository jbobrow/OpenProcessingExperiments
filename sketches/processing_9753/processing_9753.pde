
PImage img;
PImage pel;
float x,y; // Variables for image location
float rot; // A variable for image rotation
void setup(){
  size (825, 140);
  img = loadImage("encabezado_armado.png");
  pel = loadImage ("Martin_Rugby.gif");
}
void draw(){
  background(83, 97, 142);
  image(img, 0, 0, 825, 140);
  
 translate(x,y);
rotate(rot);
image(pel,0,0,50,50); // Draw image
x += 3.0;
rot += 0.01;
if (x > width) {
x = 0;
}
}


