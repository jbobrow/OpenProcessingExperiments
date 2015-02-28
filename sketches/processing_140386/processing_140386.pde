
// Trabalho feito por Daniel Ussler, para o curso de Arquitetura e Urbanismo, discuplina de Computação I, em Fev/2014


// Este trabalho está licenciado sob uma Licença Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR.

/*
Ray of Light" by Daniel Ussler, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license. Work: http://openprocessing.org/visuals/?visualID= 134597
 License:
 http://creativecommons.org/licenses/by-sa/3.0/
 http://creativecommons.org/licenses/GPL/2.0/
 */


int x[] = {
  0, 10, 20, 30
};
int y[] = {
  0, 10, 20, 30
};


void setup() {
  size(800, 800);
  colorMode(HSB); 
  background(0);
  frameRate(12);
}

float angle;
boolean clicked = true;


void mousePressed() {
  clicked = !clicked;

  if (clicked)
    noLoop();
  else
    loop();
}

void laco(int x, int y) {


  for (int i = 0; i < width/2; i += 10) {  

    noFill();
    stroke(random(255), random(155), random(255), 50);
    strokeWeight(2);
    bezier(0, 0, sin(mouseX)*i, i, i, cos(mouseY)*i, x, y);
  }
}

void draw() {

  background(0);

  pushMatrix();

  translate(height/2, width/2);

  rotate(radians(angle));
  angle+=5;

  for (int i=0;i<450;i+=90) {

    laco(0, 0);
    laco(x[0]*i, y[1]*i);
    laco(x[2]*i, y[2]*i);
    laco(x[3]*i, y[3]*i);
    rotate(radians(i));
  }
  popMatrix();
}

