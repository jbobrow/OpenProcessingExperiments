
int x; 
float r, gris, azul;

void setup () {
  size (640, 480);
  background(255);
  smooth();
  noFill();
  translate(width/2, height/2);
  frameRate(20);
}


void draw() {
  r= random (0, 10);
  gris= random (50, 200);
  stroke(30, 30, 30, 20);
  
  for (int x=0;x<500;x+=50) {
    strokeWeight(r);
    rotate(r);
    rect(0, 0, x, x);
    
  }

}






