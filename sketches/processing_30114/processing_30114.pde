
// Gravity Swarm
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico
// Blur function by Dotlassie
// Other enhancements and compilation
// by Gerard Geer.
 
particle[] Z = new particle[10000];
float colour = random(1);
float r;
PImage img; 

void setup() {
  
  size(700,700, P2D); 
  background(0);
   
  for(int i = 0; i < Z.length; i++) {
    Z[i] = new particle(random(width), random(height), random(-.5,.5), random(-.5,.5), 1);
  }
   
  frameRate(60);
}
 
void draw() {
   
  filter(INVERT);
 
  colorMode(HSB,1);
  for(int i = 0; i < Z.length; i++) {
    if( mousePressed && mouseButton == LEFT ) {
      Z[i].gravitate( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].repel( new particle( mouseX, mouseY, 0, 0, 1 ) );
    }
    else {
      Z[i].deteriorate();
    }
    Z[i].update();
    r = float(i)/Z.length;
    stroke( colour, pow(r,0.1), 1.25-r, 0.7);//Just a "touch" more vibrant. XD
    Z[i].display();
  }
   
  colour+=random(0.01);
  if( colour > 1 ) {colour = colour%1;}
 
  filter(INVERT);
  loadPixels(); //copy window contents -> pixels[]==g.pixels[]
  fastSmallShittyBlur(g,g); //g=PImage of main window. Draws the results of the blur directly back to the main buffer.
   
}
//GO DOTLASSIE!!!!!
void fastSmallShittyBlur(PImage a, PImage b){ //a=src, b=dest img
  int pa[]=a.pixels;
  int pb[]=b.pixels;
  int h=a.height;
  int w=a.width;
  final int mask=(0xFF&(0xFF<<2))*0x01010101;
  for(int y=1;y<h-1;y++){ //edge pixels ignored
    int rowStart=y*w  +1;
    int rowEnd  =y*w+w-1;
    for(int i=rowStart;i<rowEnd;i++){
      pb[i]=(
        ( (pa[i-w]&mask) // sum of neighbours only, center pixel ignored
         +(pa[i+w]&mask)
         +(pa[i-1]&mask)
         +(pa[i+1]&mask)
        )>>2)
        |0x01010101 //alpha -> opaque
        ;
    }
  }
}

void keyPressed(){
  if(key == ' '){
    for(int i = 0; i<Z.length; i++){
      Z[i].reset(random(width), random(height), random(-.5,.5), random(-.5,.5), 1);
    }
  }
}

