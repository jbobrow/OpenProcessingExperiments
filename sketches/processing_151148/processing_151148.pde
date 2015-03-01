
int fr = 1;

void setup() {
  size(500, 500);
  background(0);
  frameRate(fr);
  rectMode(CENTER); 
}


void draw() {

  int vert = (int)random(9);
  shape(vert);
  if (keyPressed){ 
    switch (key){
        case 's':
          saveFrame("LookAtMe.jpg");
          break;
        case 'r':
          background(0);
          break;
     }
  }
}


void shape(int vert) {
   beginShape();
     for (int i=0; i<vert; i++) {
       if (mousePressed){
         fill(random(255), random(255));
       }
       else {
         fill(random(255));
       }
       vertex(width-random(width), height-random(height));
     }
   endShape(CLOSE);
}

void keyReleased() {
  
  if (keyCode == RIGHT) {
    fr++;
  }

  if ( keyCode == LEFT && fr > 1) {
    fr--;
  }
  
    if (keyCode == UP) {
    fr = 1;
  }
  
  if (keyCode == DOWN) {
    fr = 0;
  }

  frameRate(fr);
}
