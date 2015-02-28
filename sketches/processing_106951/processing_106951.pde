
void setup() {
  size(800, 800);
  smooth();
  strokeWeight(2);
  stroke(0);
  noFill();
  ellipseMode(RADIUS);
}

int kreisAnzahl=100;
float kreisAbstand = 10;
float drehGeschwindigkeit = 0.03;
float FliehGeschwindigkeit = 0.005;

void draw() {
  background(255);
  kreise(width/2, height/2);
  kreise(width/2+
  cos(frameCount*drehGeschwindigkeit)*frameCount*FliehGeschwindigkeit,
 height/2+sin(frameCount*drehGeschwindigkeit)*frameCount*FliehGeschwindigkeit);
 
 if(mousePressed) {
 kreisAbstand = map(mouseX,0,width,2,20);
 kreisAnzahl = width/kreisAbstand;
 
 drehGeschwindigkeit = map(mouseY,0,height,0.001,0.1);
 }
}

void kreise(float x, float y) {
  float r=kreisAbstand;
  for (int i=0; i < kreisAnzahl;i++) {
    ellipse(x, y, r, r);
    r+=kreisAbstand;
  }
}
