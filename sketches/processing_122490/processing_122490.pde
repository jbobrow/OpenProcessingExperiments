
float tamanho = 10;
float peso = 0.1;

void setup() {
  size(960, 540);
  background(0); 
  noFill();
  smooth();
}

void draw() {
  strokeWeight(peso);
  ellipse(mouseX, mouseY, tamanho, tamanho);
    stroke(0,random(255),random(255));
  if (keyPressed) {
    if (key == 'b') {
      tamanho+=10;
    }
    if (key == 's') {
      tamanho-=10;
    }
    if (key == 't') {
      saveFrame();
    }
    if (key == 'w') {
      peso+=1;
    }
    if (key == 'q') {
      peso-=1;
    }
  }
  if (mousePressed) {
    background(0);
  }
  println(tamanho);
  peso = constrain(peso,0,100000);
}



