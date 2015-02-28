
//
// ITGM 315
// Fundamentals of Programming for Artists
// Professor Altman
//
//           Programming assignment 4
//           using arrays
//

Creature psycho[];

int NUM_CRES = 3;

void setup() {
  size(800,800);
  
  color shirt[];
  
  shirt = new color[NUM_CRES];
  psycho = new Creature[NUM_CRES];
    
  for ( int i=(0); i<NUM_CRES; i++ ) {
    int r = i*10+100;
    int g = i*100;
    int b = i*200;
    
    shirt[i] = color(r,g,b);
  }
  
  for ( int i=(0); i<NUM_CRES; i++ ) {
    int x = 100 + i*300;
    int y = 400;
    
    psycho[i] = new Creature( "psycho"+i, x, y, shirt[i]);
  }
}

void draw() {
  background(150);
  smooth();
  
  if ( mousePressed && ( mouseButton == LEFT ) ) {
    for ( int i=0; i<NUM_CRES; i++ ) {
      psycho[i].reposition(mouseX,mouseY);
    }
  }
      
  for ( int i=0; i<NUM_CRES; i++ ) {
    psycho[i].display();
  }
}

void mousePressed() {
  for ( int i=0; i<NUM_CRES; i++ ) {
    psycho[i].select(mouseX,mouseY);
  }
}

void mouseReleased() {
  for ( int i=0; i<NUM_CRES; i++ ) {
    psycho[i].deselect();
  }
}

