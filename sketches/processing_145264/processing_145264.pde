
/*
Taller de programación IXD Veritas
Helberth Delgado
Tarea 02
Spiral Finobacci
Basado en el que Laura creó
*/

float radius, t, center, circle;
  
void setup() {
  background(0);
  size(500, 500);
  smooth();
  center = (width+height)/50;
  circle = 10;
 
}
 
void draw(){
 strokeWeight(0.05);
 noFill();
 pushMatrix();
 scale(2);
 for (int n = 1; n<300; n++){
    radius = sqrt(n);
    t = 2 * (PI/90) * n;
    colorMode(HSB);
    stroke(#FF2424,200);
    ellipse(radius*cos(t)+center, radius*sin(t)+center, circle, circle); 
    circle = circle + 0.3;
     
  }
 popMatrix();  
}
