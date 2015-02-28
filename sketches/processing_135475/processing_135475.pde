
float i = 0;
void setup() {
  size(800, 800);
}
void draw() {
  //background(255);
i=i+0.01; 
float posicionX = 300*sin(i);
float posicionY = 300*cos(i); 

float otraPosicionX = 50*sin(i*15);
float otraPosicionY = 50*cos(i*15);
float grueso = 30;
fill(255);
  ellipse((width/2)+posicionX, (width/2)+posicionY, grueso, grueso);
 fill(255,0,0);
 ellipse((width/2)+posicionX+otraPosicionX, (width/2)+posicionY+otraPosicionY, grueso, grueso);
}

