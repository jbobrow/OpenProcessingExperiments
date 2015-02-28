
float x = 0; 
float y = 0; 

void setup() {
  size(500, 500, P3D);
}
void draw() {
  background(255);
  //lights();
  //ambientLight(102, 102, 102);
  //directionalLight(51, 102, 126, -1, 0, 0);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  translate(width/2, height/2, 200);
  rotateY(y);
  rotateX(x);
  noStroke();
  box(100);
}
void keyPressed() {
  if ( key == CODED) {

    if (keyCode == UP ) {
      x+=(PI/180.0);
    }

    if (keyCode == RIGHT) {
      y+=(PI/180.0 );
    }

    if (keyCode == LEFT) {
      y-=(PI/180.0 );
    }

    if (keyCode == DOWN) {
      x-=(PI/180.0 );
    }
    
  }
}



