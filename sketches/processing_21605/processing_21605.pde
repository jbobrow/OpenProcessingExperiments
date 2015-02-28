
float r,g,b;
float rCible,gCible,bCible;

void setup() {
  size(200,200);
 
 
  rCible = random(256);
  gCible = random(256);
  bCible = random(256);
}


void draw() {
  
  if ( random(100) < 2 ) {
    rCible = random(256);
    gCible = random(256);
    bCible = random(256);
  }
  
  
  // Assouplissement
  r = ( rCible - r )  * 0.03 + r;
  g = ( gCible - g )  * 0.03 + g;
  b = ( bCible - b )  * 0.03 + b;
  
  background(r,g,b);
}


              
