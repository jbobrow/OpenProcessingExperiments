
// triângulos isósceles amarelos e laranjas em posições e ângulos aleatórios

import processing.pdf.*;

void setup() {
  size(842,1190);
  background(255);
  loop();
}

void draw(){
  float l = random(0, 1);
  float a = random(0, 15);
  noStroke();
  rectMode(CENTER);
  
  pushMatrix(); //armazena a matriz no estado atual
  translate(random(842),random(1190)); //faz a matriz ser aleatória
  fill(255,255,0);
  rotate(radians(random(180))); //rotaciona o triângulo aleatoriamente
  triangle(0, 0, 3*l, 0, 1*l, 8*a);
  popMatrix(); //volta a matriz armazenada

  pushMatrix(); //armazena a matriz no estado atual
  translate(random(842),random(1190)); //faz a matriz ser aleatória
  fill(255,0,127);
  rotate(radians(random(180))); //rotaciona o triângulo aleatoriamente
  triangle(0, 0, 3*l, 0, 1*l, 8*a);
  popMatrix(); //volta a matriz armazenada
}

void mousePressed () {
    if (mouseButton == LEFT){
    beginRecord(PDF, "words-"+int(random(10000))+".pdf");
    }
    else if (mouseButton == RIGHT){
    endRecord();
    }
}
