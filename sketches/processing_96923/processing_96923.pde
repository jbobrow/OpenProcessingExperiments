
import processing.opengl.*;

int numero = 250; // número de puntos a unir
float speed = 2.5;

float[] x = new float[numero]; 
float[] y = new float[numero];
float[] z = new float[numero]; // coordenadas de cada punto

void setup() {
  size(720, 720, OPENGL); // tamaño del canvas
  fill(255, 255, 255, 60); // color y transparecia del relleno de los puntos
  smooth();
  noStroke();

  for (int i = 0; i < x.length; i++) { //asigna valores random a los arrays de x
    x[i] = random(0, width);
  }
  for (int i = 0; i < y.length; i++) { //asigna valores random a los arrays de y
    y[i] = random(0, width);
  }
  for (int i = 0; i < z.length; i++) { //asigna valores random a los arrays de z
    z[i] = random(-width/2, width/2);
  }
}

void draw() {

  directionalLight(255, 0, 0, 1400, 0, 0);
  directionalLight(0, 255, 0, 0, 1400, 0);
  directionalLight(0, 0, 255, 0, 0, 1400);
  directionalLight(255, 0, 0, -1400, 0, 0);
  directionalLight(0, 255, 0, 0, -1400, 0);
  directionalLight(0, 0, 255, 0, 0, -1400); // 6 luces     que otorgan color a la figura

  background(0);

  float camZ = (height/2.0) / tan(PI*60.0 / 360.0);
  camera(mouseX, mouseY, camZ, // Camera location
  width/2.0, height/2.0, 0, // Camera target
  0, 1, 0); // Camera orientation

  if (mousePressed) {
    for (int i = 0; i < x.length; i++) {
      x[i] += random(-speed, speed);
    }
    for (int i = 0; i < y.length; i++) {
      y[i] += random(-speed, speed);
    }
    for (int i = 0; i < z.length; i++) {
      z[i] += random(-speed, speed);
    }
  }



  beginShape(TRIANGLE_STRIP);

  for (int i = 0; i< x.length; i++) {
    vertex(x[i], y[i], z[i]);
  }
  endShape();
}



