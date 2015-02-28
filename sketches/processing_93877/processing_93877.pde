
color c1 = #1787CB; //Primary color 1
color b1 = #C4C4C4; //Backround color 1

// Arrays of coordinates [x y]
float[][] center; //Corners of the hexagon in the center
float[][] ring1; // Centers of 6 hexagons
float[][] ring2; // Centers of 12 hexagons

float a = 0;

void setup() {
  size(600, 600);
  background(b1); 
  stroke(c1);
  noFill();
  strokeWeight(2);
  
  center = createHexagon(300, 300, 50, 0);
  ring1  = createHexagon(300, 300, 100, -30);
  
  // Ring 2 is made by combining to hexagons with different
  // rotations
  ring2  = zipHexagons(
    createHexagon(300, 300, 175, -60), 
    createHexagon(300, 300, 200, -30)
  );
}

void draw() {
  background(b1);
  
  //draw the hexagon in the center 
  int seconds = (minute() % 10) * 60 + second();
  int centervalue = (int) (map(seconds, 0, 600, 30, 255)); // 0-600 s -> 0-255 alpha channel
  centervalue *= abs(cos(radians(a))); //pulsation
  fill(c1, centervalue);
  drawHexagon(center); // zeichnen ring 1
  a += 1.5;
  
  drawRing(ring1, minute() / 10);
  drawRing(ring2, hour() % 12);
}

// Gives the coordinates of all corners  
float[][] createHexagon(float x, float y, float r, int rotation) {
  float[][] hexagon = new float[6][2]; 
  int teil = 360 / 6;
  for (int i = 0; i < 6; i++) {
    int a = teil * i; 
    hexagon[i][0] = cos(radians(a + rotation)) * r + x;
    hexagon[i][1] = sin(radians(a + rotation)) * r + y;
  } 
  return hexagon;
}

void drawHexagon(float[][] hexagon) {
  beginShape();
  for(int i = 0; i < 7; i++) {
    float x = hexagon[i % 6][0];
    float y = hexagon[i % 6][1];
    vertex(x, y);
  }
  endShape(CLOSE);
}
void drawRing(float[][] ring, int value) {
  int itemvalue;
  for(int i = 0; i < ring.length; i++) {
    if (i < value) itemvalue = 255;
    else itemvalue = 0;
    float x = ring[i][0];
    float y = ring[i][1]; 
    float[][] hexagon = createHexagon(x, y, 50, 0);
    fill(c1, itemvalue);
    drawHexagon(hexagon);
  }
}
// zips two hexagons
float[][] zipHexagons(float[][] a, float[][] b) {
  float[][] result = new float[12][2];
  for (int i = 0, j=0; i < 12; i+=2, j++) {
   result[i] = a[j];
   result[i+1] = b[j];
  }
  return result;
}


