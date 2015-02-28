

void setup() {
  size(400, 500);
  background(255);
}

void draw() {



  for (int j=0; j<50; j++) {
    for (int i=0; i<50; i++) {
      if (mousePressed) {
        fill(0);//si esta presionado
      }
      else {
        fill(255); //de otra forma
      }

      rect(8*i, 10*j, 6, 4);
    }
  }
}
//-----------------------------
void mousePressed(){
  
  strokeWeight(1);
  stroke(random(0,255),random(0,255),random(0,255));
}


