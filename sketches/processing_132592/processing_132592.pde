
float d, grosor; 

 // distancia y grosor

void setup() {
  size(640, 360); // pantalla completa
  smooth(); // suavizado (anti-alisaing)
  background(255); // fondo de color blanco
  stroke(255, 100);
  strokeCap(PROJECT);
}

void draw() {
  if (mousePressed) {
    // velocidad = distancia / tiempo
    /* calcula distancia entre
       la posición actual del mouse y la posición anterior */
    d = dist(mouseX, mouseY, pmouseX, pmouseY); 
    grosor = map(d, 0, 100, 1, 20);
   
    keyPressed();  // strokeWeight(grosor)
    line(mouseX, mouseY, pmouseX, pmouseY);
    keyPressed(); // el color inicial de la línea es negro
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
  stroke (255); 
 }
  if (key == 'g') { // GUARDAR ARCHIVO
    saveFrame("img/######.jpg");
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


