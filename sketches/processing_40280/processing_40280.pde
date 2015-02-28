
//Statue dedicated to Andrea Palladio in Piazzetta Palladio in Vicenza
//Photograph is my own

int pixl = 100000;//number of pixels to generate the image

float[] x = new float[pixl];
float[] y = new float[pixl];
PImage Palladio;

void setup() {
  size(331, 300);
  Palladio = loadImage("Palladio.JPG"); //loads photograph
  stroke(0); //black

  //array
  for (int r=0; r< pixl; r++) {
    x[r] = random(width);
    y[r] = random(height);
  }
}

void draw() {
  background(255); //white background
  for (int r = 0; r< pixl; r++) {
    color c = Palladio.get(int(x[r]), int(y[r]));
    float b = brightness (c) / 250.0;
    float speed = pow(b, 2) + .01; //speed is related to brightness
    x[r] += speed;

    //restart
    if (x[r]> width) {
      x[r]=0;
      y[r]=random(height);
    }
    point(x[r], y[r]);
  }
}


