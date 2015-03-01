
/*Ejercicio Vectores: Hacer un ’buble-shooter’ sencillo (sólo
lanzador de bolas*/

PVector raton, center;
boolean shoot = false;
float vel = 0.001;
float incX, incY;


void setup() {
  size(438,350);
  smooth();
} 

void draw() {
  background(255,222,173,0);
  
  // Two PVectors, one for the mouse location and one for the center of the window.
  raton = new PVector(mouseX,mouseY);
  center = new PVector(100,300);
  
  // PVector subtraction!
  raton.sub(center);
  // In this example, after the vector is normalized it is 
  // multiplied by 50 so that it is viewable onscreen.  
  // Note that no matter where the mouse is, the vector will 
  // have same length (50), due to the normalization process.
  raton.normalize();
  raton.mult(50);
  
  // Draw a line to represent the vector.
  
  translate(50,300);
  strokeWeight(10);
  stroke(160,32,240,255);
  line(0,0,raton.x,raton.y);
  
  
  if(mousePressed) { // recibe la llamada al evento de ratón y pone a verdadero la variable shoot
    shoot = true;
  }
  
  if(shoot == true && (incX < 700 || incY > 350)){
    incX += vel + raton.x;
    incY += vel + raton.y;
    
    
    fill(160,32,240,255);
    ellipse(raton.x + incX, raton.y + incY, 10, 10);
  }else{
    shoot = false;
    incX=0.0;
    incY=0.0;
  }
}




