
PImage foto;

float fotoX = 0;
float fotoY = 0;
float fotoA = 50;
float fotoB = 200;
float fotoStroke = 255;
float fotoFill = 0;
float backgroundColor = 255;
float change = 0.5;


void setup() {
  size(800,600);
  background (255);
  foto = loadImage ("logo.png");
  
}

void draw() {
  
 background(backgroundColor);
  stroke(fotoStroke);
 fill(fotoFill);
 image(foto,fotoY,fotoX,fotoA,fotoB);

  
fotoStroke = fotoStroke - change;
 fotoFill = fotoFill + change;
fotoY = fotoY + change;
fotoX = fotoX + change;
 fotoA = fotoA + change;
  fotoB = fotoB - change;

}

