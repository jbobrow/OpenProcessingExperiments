
PImage Kittiya;
int[][] Werte;
float Winkel = 0;

void setup() {
  size(600, 600, P3D);
  background(10);
  smooth();

  Kittiya = loadImage("Kittiya.png");
  Werte = new int[Kittiya.width][Kittiya.height];
  for (int y = 0; y < Kittiya.height; y++) {
    for (int x = 0; x < Kittiya.width; x++) {

      // Fläche
      color pixel = Kittiya.get(x, y);
      Werte[x][y] = int(brightness(pixel));
    }
  }
}

void draw() {
  float i=1;
  while (i<width) {
    stroke (1);

    // Drehung-Winkel
    rotate(360/50);
    // Position (0.9 beste Zahl)
    i=i+0.9;
  }

 // Ausrichtung
  translate(width/2, 30, -130);
  // Bewegung
  rotateY(Winkel*3); 
  // Geschwindigkeit
  Winkel += 0.005;
  // Verteilung
  translate(-Kittiya.width/255, 255, -255);

  // Animation
  for (int y = 0; y < Kittiya.height; y++) {
    for (int x = 0; x < Kittiya.width; x++) {
      // Schatten
      stroke(Werte[x][y]);
      point(x, y, -Werte[x][y]);
    }
  }
}


