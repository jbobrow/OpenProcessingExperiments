
float i = 0;
float radio = 0;
void setup() {
  size(800, 800);
}
void draw() {
  //background(255);
i=i+0.01;
radio = radio + 0.1;
float posicionX = radio*sin(i);
float posicionY = radio*cos(i);
 
float otraPosicionX = 50*sin(i*15);
float otraPosicionY = 50*cos(i*15);
 
float otraMasX = 50*sin(i*45);
float otraMasY = 50*cos(i*45);
float grueso = 50;
fill(255);
  ellipse((width/2)+posicionX, (width/2)+posicionY, grueso, grueso);
 ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, grueso, grueso);

 
}

