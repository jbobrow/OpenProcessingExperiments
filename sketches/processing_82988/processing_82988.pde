
float[] x = new float[10000];
float[] circulos = new float[500];
float[] puntos = new float[500];

void setup() {
 
  size(2000, 1500);
  background(0);
  noStroke();


  for (int i = 0; i < x.length; i++) {
    x[i] = random(-2000, 2000);
  }
}

void draw() {

  for (int i = 0; i < x.length; i++) { //Casi blanco
    x[i] += 0.5;
    float y = i *0.5;
    fill(189, 230, 248, 80);
    ellipse(x[i], y, 6, 6);
  }
  for (int i = 0; i < x.length; i++) {//azul
    x[i] += 0.5;
    float y = i *0.6;
    fill(32, 50, 135, 80);
    ellipse(x[i], y, 5, 5);
  }
  for (int i = 0; i < x.length; i++) { //negro
    x[i] += 0.6;
    float y = i *0.6;
    fill(0, 100);
    ellipse(x[i], y, 7, 7);
  }
  for (int i = 0; i < x.length; i++) { //celeste
    x[i] += 0.5;
    float y = i *0.7;
    fill(66, 180, 232, 80);
    ellipse(x[i], y, 7, 7);
  }

  for (int a = 0; a < circulos.length; a++) {
    fill(255, 80); 
    ellipse(width/2+random(-1000, 1000), height/2 + random(-800, 800), 10, 10);
  }
  for (int b = 0; b < puntos.length; b++) {
    fill(255, 180); 
    ellipse(width/2+random(-1200, 1200), height/2 + random(-1000, 1000), 3, 3);
  }
 if (keyPressed) {
    saveFrame("##.tiff");
  }
}
