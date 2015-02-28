
int randomOffset = 100;

void setup() {
  size(900,900);
  background(0);
}


void draw() {
  for( int i=0; i<50; i++){
    ellipse( mouseX, mouseY, random(10,50), random(10,50) );
    stroke(random(0,255),random(0,255),random(0,255));
    fill(random(0,255),random(0,255),random(0,255));
  } 
  }
