



void setup () {
  size(700,400);
}

void draw() {
  for (int i= 0; i<100;i++){
    stroke (0,10);
    line (mouseX+i,0,mouseY-i,400); 
  }
 
}


