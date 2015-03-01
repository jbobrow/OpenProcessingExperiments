
float i = 0;
float radio = 0;
byte C=0;
void setup() {
  size(600, 600);
  background(0);
}
void draw() {
  C++;
  i=i+0.01;
  radio = radio + 0.1;
  float posicionX = radio*sin(i);
  float posicionY = radio*cos(i);

  float otraPosicionX = 50*sin(i*15);
  float otraPosicionY = 50*cos(i*15);

  float otraMasX = 50*sin(i*45);
  float otraMasY = 50*cos(i*45);
  float grueso = 50;
  fill(mouseX, mouseY, C);
  ellipse((width/2)+posicionX, (width/2)+posicionY, grueso, grueso);
  fill(C, mouseX, mouseY);
  ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, grueso, grueso);
  fill(C, C, C);
  if (C>255) {
    C--;
  }
else {
  C++;
}
}
