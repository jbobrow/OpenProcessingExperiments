


void setup() {
  size(800,600);
  background(0);
  smooth();
}

int valor = 255;

void draw(){
  fill(valor);
  stroke(random(255),random(255),random(255));
  rect(mouseX,mouseY,10,10);

}


void mouseClicked() {
  if(valor == 0) {
    valor = 255;
  } else {
    valor = 0;
  }
}
              
