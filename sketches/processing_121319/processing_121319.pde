

/**
 * Esfera
 * by David Pena.  
 * 
 * Distribucion aleatoria uniforme sobre la superficie de una esfera. 
 */
int cuantos = 16000;
Pelo[] lista ;
float radio = 200;
float rx = 0;
float ry =0;
void setup() {
  size(2000, 1000, P3D);
  radio = height/4;
  lista = new Pelo[cuantos];
  for (int i = 0; i < lista.length; i++) {
    lista[i] = new Pelo();
  }
  noiseDetail(5);
}
void draw() {
  background(255,10,10);
  
  float rxp = (mouseX-(width/2)) * 0.005;
  float ryp = (mouseY-(height/2)) * 0.005;
  rx = rx*0.9 + rxp*0.1;
  ry = ry*0.9 + ryp*0.1;
  translate(width/2, height/2);
  rotateY(rx);
  rotateX(ry);
  fill(121,233,245);
  noStroke();
  sphere(radio);
  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }
}
class Pelo
{
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float largo = random(4.3, 1.5);
  float theta = asin(z/radio);
  Pelo() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.5, 4.3);
    theta = asin(z/radio);
  }
  void dibujar() {
    float off = (noise(millis() * 0.0005, sin(phi))-0.5) * 3;
    float offb = (noise(millis() * 0.0007, sin(z) * 0.01)-0.5) * 3;
    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);
    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);
    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;
    strokeWeight(1);
    beginShape(LINES);
    stroke(48,139,206);
    vertex(x, y, z);
    stroke(200, 100);
    vertex(xb, yb, zb);
    endShape();
  }
}
