
/**
 * Extrusion. 
 * 
 * Converts a flat image into spatial data points and rotates the points
 * around the center.
 */


PImage a, b;
PFont carito;
boolean onetime = true;
int[][] aPixels;
int[][] values;
float angle;
float posX;
float posY;
float posZ;
float vel;

void setup() {
  size(800, 600, P3D);
  carito = loadFont("Kartika-50.vlw");
  textFont(carito,10);
  aPixels = new int[width][height];
  values = new int[width][height];
  noFill();
  posZ = 220.0;
  vel = 2.0;
  
  // Load the image into a new array
  // Extract the values and store in an array
  b = loadImage ("fondo.jpg");
  
  a = loadImage("images.jpg");
  a.loadPixels();
  for (int i = 0; i < a.height; i++) {
    for (int j = 0; j < a.width; j++) {
      aPixels[j][i] = a.pixels[i*a.width + j];
      values[j][i] = int(blue(aPixels[j][i]));
    }
  }
}

// Control de velocidad de camara
void keyReleased() {
  if (key == '+') {
    vel += 1;
  }
  if (key == '-') {
    vel -= 1;
  }
}

void draw() {
  float m = millis();
  if (m < 10000){
    image (b, 0, 0, width, height);
  }else{
  background (255);
  translate(width/2, height/2, 0);
  scale(2.0);
  

  // Controles de movimiento de camara
  if(keyPressed) {
    if (key == CODED) {
      if(keyCode == UP) {
        posY -= vel;
      }
      if (keyCode == DOWN) {
        posY += vel;
      }
      if (keyCode == LEFT) {
        posX -= vel;
      }
      if (keyCode == RIGHT) {
        posX += vel;
      }
      if (keyCode == SHIFT) {
        posZ -= vel;
      }
      if (keyCode == CONTROL) {
        posZ += vel;
      }
    }
  }

  camera(posX, posY, posZ, // eyeX, eyeY, eyeZ
  0.0, 0.0, -150.0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ  camera
  // Display the image mass

    for (int i = 0; i < a.height; i +=3) {
      for (int j = 0; j < a.width; j +=3) {
        stroke(values[j][i], 100);
        strokeWeight(2);
        line(j-a.width/2, i-a.height/2, -values[j][i], j-a.width/2, i-a.height/2, -values[j][i]-10);
      }
    }
  }
}
 


