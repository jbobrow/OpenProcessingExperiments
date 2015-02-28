
boolean button= true;

int a= 100;
int b= 100;

void setup() {
  size(300,300);
}

void draw() {
  if (button) {
    background(0);
    noStroke();
  }
  else {
background(255,0,0);
  }
}
  void mousePressed(){
    button=!button;
}


