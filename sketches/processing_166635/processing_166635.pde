
float posX,posY;
float tam;
float R,G,B;
void setup() {
  size(500,500);
  frameRate(random(0,10));
  //frameRate(10);
  //smooth();
}


void draw() {
  background(0);
  R = random(0,255);
  G = random(0,255);
  B = random(0,255);
  fill(R,G,B);
  posX = random(width);
  posY = random(height);
  tam = random(0,100);
  for ( int i = 0; i < 300; i++ ) {
   ellipse(posX,posY,tam,tam);
  } 
}


