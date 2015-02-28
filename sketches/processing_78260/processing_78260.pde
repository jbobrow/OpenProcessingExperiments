
/* Ejercicio 2
El vampiro ahora se mueve con el mouse y los ojos cambian
de color según la posición del mosue */

void setup() {
// Set the size of the window
size(400,400);
frameRate(30);
}

void draw() {
background(230);
  // smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
    fill (255);
  rect (mouseX,mouseY,90, 100);
  
  strokeWeight(3);
  fill(mouseX,0,0);
  ellipse(mouseX-20,mouseY-20, 10, 10);
  ellipse(mouseX+20,mouseY-20,10, 10); 
  line(mouseX-20, mouseY+20,pmouseX-15,pmouseY+30);
  line(pmouseX-15,pmouseY+30,mouseX-10,mouseY+20);
  line (mouseX+20,mouseY+20,pmouseX+15,pmouseY+30);
  line (pmouseX+15,pmouseY+30,mouseX+10,mouseY+20);
}

void mousePressed() {
  background (255,0,0);
} 


