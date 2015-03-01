
float theta = 0;
int passo = 10;
int pos = 50;
int diametro = 200;

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  noFill();
}

void draw() {  
  background(255);
  translate(width/2, height/2); // Posiciona a matriz no meio da tela para desenhar a partir  do centro
  strokeWeight(0.7);
  stroke(250, 100, 120, 80);
  //float theta = HALF_PI*mouseX / width;  


  if (keyPressed && key == CODED) {
    if (keyCode == RIGHT) {
      theta +=1;
    }
    if (keyCode == LEFT) {
      theta -=1;
    }
    if (keyCode == UP) {
      pos +=1;
    }
    if (keyCode == DOWN) {
      pos -=1;
    }
    if (keyCode == CONTROL) {
      diametro +=1;
    }
    if (keyCode == ALT) {
      diametro -=1;
    }
  }

  for (int i = 0;i < diametro; i += passo) {
    rotate(radians(theta));
    ellipse(0, 0+pos+i, diametro-i, diametro-i);
  }  
  for (int i = 0;i <= diametro; i += passo) {
    rotate(radians(theta)*-1);
    ellipse(0, (0+pos)*-1-i, i, i);
  }
  rotate(HALF_PI);
  for (int i = 0;i < diametro; i += passo) {
    rotate(radians(theta));
    ellipse(0, 0+pos+i, diametro-i, diametro-i);
  }  
  for (int i = 0;i <= diametro; i += passo) {
    rotate(radians(theta)*-1);
    ellipse(0, (0+pos)*-1-i, i, i);
  }

  println(theta, pos, passo);
}

