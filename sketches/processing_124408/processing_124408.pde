
PImage bild;

int cs = 5;

void setup() {
  size(640, 480);
  smooth();
  bild = loadImage("pilze.jpg");
}
void draw() {
  background(0);


  for (int j = 0; j<=height/cs;j++) {
    for (int i = 0; i<=width/cs;i=i+1) {

      color farbe = bild.get(i*cs, j*cs);
      fill(farbe);

      float b = brightness(farbe);
      fill(255);
      noStroke();
      ellipse(i*cs, j*cs, b/10, b/100);
    }
  }
  
  if (mousePressed){
      background(255);


  for (int j = 0; j<=height/cs;j++) {
    for (int i = 0; i<=width/cs;i=i+1) {

      color farbe = bild.get(i*cs, j*cs);
      fill(farbe);

      float b = brightness(farbe);
      fill(0);
      noStroke();
      ellipse(i*cs, j*cs, b/10, b/100);
    }
  }
  }
}



