
// it eventually evolves into an ugly state, but it comes back, slowly.
int quantos=6;
int d=300;
float r;
void setup() {
  size(700, 700);
  background(200, 200, 0);
  noStroke();
}

void draw() {
  frameRate(60);
  background(200, 200, 0);
  translate(width/2, height/2);
  d=300;
  
  while (d>2) {
    fill(255);
   
    for (int i=0; i<quantos; i++) {
      ellipse(d/2, 0, d, d);
      rotate(TWO_PI/quantos);
    }
    
    d-=1;
    fill(200, 200, 0);
    rotate (r);
    
    for (int i=0; i<quantos; i++) {
      ellipse(d/2, 0, d, d);
      rotate(TWO_PI/quantos);
    }
    d-=1;
      
    r+=.000005;

  }
}
