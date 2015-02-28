

    void setup() { 
    size(1000, 700);
    background(0);
    for (int i = 0; i < 1001; i = i+5) {
    line(i, 0, i, 700);
    stroke(255);
  } frameRate(45);
  } int e=950;
    int a=100;

    void draw() {
    if (keyPressed) {
    if (key == 'q' ) { //permite comandar os eixos X e Y das elipses
    e=mouseX;
    }if (key == 'w' ){ellipse(mouseY,e,e*noise(a),mouseY*noise(a)); //reflete o negócio.
    }if (key == 'e' ){ellipse(mouseY,e,mouseY*noise(a),e*noise(a));     
 }  }if (key == 'r' ){ellipse(e*noise(a),mouseY*noise(a),e,mouseY);
 }
    stroke(0);
    ellipse(e,mouseY,e*noise(a),mouseY*noise(a)); //elipses
    e -=1.5;
  }

    void mousePressed() {
    if (mouseButton == LEFT) { //leva o eixo X para 950
    e=950;  
  } else if (mouseButton == RIGHT) { // 'a' tomas os valores do eixo X
    a=e;
  }  
}

//botão direito do mouse:muda o tamanho das elipses
//botão esquerdo do mouse:o centro da elipse vai para eixoX=950
//'q'/'w'/'e'/'r'


