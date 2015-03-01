
float i = 0;
void setup() {
colorMode(HSB);
  size(800, 800);
  background(255);
}
void draw() {

i=i+0.01; 
float posicionX = 300*sin(i);
float posicionY = 300*cos(i); 

float otraPosicionX = 50*sin(i*15);
float otraPosicionY = 50*cos(i*15);

float otraMasX = 50*sin(i*45);
float otraMasY = 50*cos(i*45);
float grueso = 80;
fill(i,255,255);
  ellipse((width/2)+posicionX, (width/2)+posicionY, grueso, grueso);
 fill(i*5,255,255);
 ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, grueso, grueso);
 fill(i*10,255,255);
 ellipse((width/2) + posicionX + otraPosicionX + otraMasX, (width/2) + posicionY + otraPosicionY + otraMasY, grueso/2, grueso/2);

}
