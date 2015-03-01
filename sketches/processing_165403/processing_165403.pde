
float hringurX;
float hringurY;
float hringurRad; 
float hringurSize;

float R;
float G;
float B;

int theta = 0; 

void setup() {
  size(400,400);
  background(255);
  hringurRad = 1; 
  hringurSize = 2;
  smooth();
}

void draw() {
  R = random(255);
  G = random(255);
  B = random(255);
  stroke(R,G,B);
  fill(R,G,B);
  ellipse(hringurX,hringurY,hringurSize,hringurSize);
  hringurSize *= 1.00488;
  
  hringurX = cos(radians(theta)) * hringurRad + width/2; 
  hringurY = sin(radians(theta)) * hringurRad + height/2; 
  
  theta++; //increments theta by 1 
  if(theta == 360) theta = 0; 
  hringurRad *= 1.005; 
}




