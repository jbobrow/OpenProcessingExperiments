
/**
 * Esfera
 * by David Pena.  
 * 
 * adapted by Jasmine Ehrhardt
 *
 * 
 */

PShape sphere;

int cuantos = 20000;
hair[] lista ;
float radio = 100;
float rx = 0;
float ry =0;

void setup() {
  size(824, 568, P3D);
  stroke(100);
  smooth();

  sphere = createShape(SPHERE, 100);

  lista = new hair[cuantos];
  for (int i = 0; i < lista.length; i++) {
    lista[i] = new hair();
  }
  noiseDetail(10);
  frameRate(30);
}

void draw() {
  background(#FFFFFF);
  
  float rxp = (mouseX-(width/1)) * 0.005;
  float ryp = (mouseY-(height/2)) * 0.005;
  rx = rx*0.9 + rxp*0.1;
  ry = ry*0.8 + ryp*0.2;


  translate(mouseX, mouseY);
  rotateY(ry);
  rotateX(rx);
  noStroke();
  shape(sphere);
  fill(0);
  
  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }
  if (mousePressed) {
    background(0);
    ellipse(mouseY, mouseX, 23, 23);
    ellipse(mouseY, mouseX, 58, 58);
    ellipse(mouseX, mouseY, 20, 20);
    ellipse(mouseX, mouseY, 60, 60);
    
    
    
      
  } else {
    fill(#FFFFFF);
 
  }
}

class hair
{
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float smash = random(1.15, 1.2);
  float theta = asin(z/radio);

  hair() { // the hair 
    z = random(-radio, radio);
    phi = random(TWO_PI);
    smash = random(1.15, 1.2);
    theta = asin(z/radio);
  }

void dibujar() {

    float off = (noise(millis() * 0.001, sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0013, sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * smash;
    float yb = yo * smash;
    float zb = zo * smash;

    strokeWeight(2);
    beginShape(LINES);
    stroke(1);
    vertex(x, y, z);
    stroke(200, 150);
    vertex(xb, yb, zb);
    endShape();
}
}



