
//Hex   By Albert Callejo Amat (Dima-VJ) Creative Commons licence, Atribution, share alike
//MouseX defines the lenght of generated segments
//MouseY defines strokeWeight

int angl;

int index=0;
int x=600;
int y=250;

int rr=50;
float n;
int h_hu=0;

void setup() {
  size(600, 400, P2D);
  colorMode(HSB, 8800);
  background(0);
  strokeJoin(BEVEL);
  strokeWeight(1);
  noFill();
  smooth();
}

void draw() {
 strokeWeight(20-mouseY/30); 
  h_hu+=2.2;
  if (h_hu>8800) {
    h_hu=0;
  }
  
   stroke(h_hu,8800,8800,8800); 
  if (frameCount
