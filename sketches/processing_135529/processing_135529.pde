
Punto pepito, felipe; // Declare the object
void setup() {
size(750, 750);
smooth();
background(200); //Black
pepito = new Punto(100,50, 50, 40); // Construct the object
felipe = new Punto(80, 50, 10, 100);
}
void draw() {
  translate(mouseX, mouseY);
  pepito.display();
  felipe.display();
}
class Punto {
float x, y, diameter, co;
Punto(float xpos, float ypos, float dia, float cool) {
x = xpos; // Assign 50 to x
y = ypos; // Assign 33 to y
diameter = dia; // Assign 30 to diameter
co = cool;
}
void display() {
  fill(co);
ellipse(mouseX, mouseY, diameter, diameter);
ellipse(diameter, diameter, mouseX, mouseY);
}
}
void keyPressed() { // PRIMERO LOS COLORES 
   if (key == '1') {  
   stroke(#FF0000); // ROJO
 }
 if (key == '2') {
   stroke(#0006FF); // AZÚL
 }
 if (key == '3') {
   stroke(#0BFF00);  // VERDE
 }
 if (key == '4') {   // AMARILLO
   stroke(#FFE600);
 }
   if (key == '0'){ // el 0 pretendía funcionar como goma de borrar, pero al parecer hay que seguir perfeccionandolo XD
  stroke (200); 
 }
  if (key == ' ') { // BORRAR
    background(0);
  }
  if (key == '6') {
    strokeWeight(8);
  }
  if (key == '7') {
    strokeWeight(12);
  }
  if (key == '8') {
    strokeWeight(20);
  }
}
