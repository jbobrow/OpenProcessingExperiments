
float i = 0;
void setup() {
  size(800, 800);
}
void draw() {
  //background(255);
i=i+0.01;
float posicionX = 300*sin(i);
float posicionY = 300*cos(i);
 
float grueso = 1;
fill(600);
  ellipse((width/2)+posicionX, (width/2)+posicionY, grueso, grueso);
 fill(255,0,0);
 ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, grueso, grueso);
 fill(100);
 triangle((width/2) + posicionX + otraPosicionX + otraMasX, (width/2) + posicionY + otraPosicionY + otraMasY, grueso/2, grueso/2);
 
}

