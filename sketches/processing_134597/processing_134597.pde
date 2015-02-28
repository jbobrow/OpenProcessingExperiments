
// Trabalho feito por Daniel Ussler, para o curso de Arquitetura e Urbanismo, discuplina de Computação I, em Fev/2014


// Este trabalho está licenciado sob uma Licença Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional. Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by-sa/4.0/deed.pt_BR.

/* 
Ray of Light" by Daniel Ussler, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license. Work: http://openprocessing.org/visuals/?visualID= 134597 
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*/


void setup() {
  size(800, 800);
  colorMode(HSB); 

  frameRate(12);
}


void draw() {


  background(0);
  pushMatrix();

  translate(mouseX, mouseY);


  for (int i = 0; i < width/2; i += 20) {  

    noFill();
    stroke(random(255), random(155), random(255), 50);
    bezier(0, 0, mouseX+sin(i)*i, i, i, mouseY+sin(i)*i, 0, 0);
  } 
  rotate(PI);
  for (int i = 0; i < width/2; i += 20) {  

    noFill();
    stroke(random(255), random(155), random(255), 50);
    bezier(0, 0, mouseX+sin(i)*i, i, i, mouseY+sin(i)*i, 0, 0);
  } 
  rotate(HALF_PI);
  for (int i = 0; i < width/2; i += 20) {  

    noFill();
    stroke(random(255), random(155), random(255), 50);
    bezier(0, 0, mouseX+sin(i)*i, i, i, mouseY+sin(i)*i, 0, 0);
  } 
  rotate(PI/1);
  for (int i = 0; i < width/2; i += 20) {  

    noFill();
    stroke(random(255), random(155), random(255), 50);
    bezier(0, 0, mouseX+sin(i)*i, i, i, mouseY+sin(i)*i, 0, 0);
  }    
  popMatrix();
}
