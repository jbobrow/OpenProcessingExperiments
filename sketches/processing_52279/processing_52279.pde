
/*Peter Jacobson 02/13/12 peter.jacobson@gmail.com Shiffman math!*/


int xspacing = 176; 
int w;
int c = 0;
PImage b, n;
float yoff = 2.0f;       
float[] yvalues; 


void setup() {
  size(512,160);
  frameRate(8);
  
  smooth();
  w = width+width/2+16;
  yvalues = new float[w/xspacing];
  
  b = loadImage("palm.png");
  n = loadImage("redpalm.png");
}


void draw() {
   if(c % 8 <= 4) {
  background(0);
   }
   
   if(c % 8 >= 5) {
  background(255,0,0);
   }
   
  calcWave();
  renderWave();
  c++;
}

void calcWave() {
  float dx = 0.05;
  float dy = 0.01;
  float amplitude = 8.0;
  yoff += dy;
  float xoff = yoff; 

  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = (2*noise(xoff)-1)*amplitude;    
    xoff+=dx;
  }
}


void renderWave() {

  for (int x = 0; x < yvalues.length; x++) {
    
  if(c % 8 <= 4) {
    image(n, x*xspacing+4,yvalues[x]+16);
  }
  
  if(c % 8 >= 5) {
    image(b, x*xspacing+4,yvalues[x]+8);
  }
  
  }
  c++;
}

