
int dim = 100;

void setup () {
  size (500, 500);
  background (255);

  rectMode (CENTER);
}

void draw () {
    noStroke();
    smooth ();
    fill (random(200), random(20), random(200), 50);
    ellipse (random(500), random(500), dim, dim);
    
    if (mousePressed){
    background (255);}
 }

