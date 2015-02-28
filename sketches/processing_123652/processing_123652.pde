


void setup() {

  size(800, 600);
} 
int azul;
void draw() {

  azul= 400+ mouseX/2;
  if (mouseX<height-2)
  background(89, 151, 188);
  else
  background(61, 98, 129);

  //fundo estrelado:
  for (int j =0; j<600; j=j+10) {

    point (random (800), random (800));
  }
  //fundo estrelado:

  stroke(244, 250, 187);
  for (int j =0; j<600; j=j+20) {
    float i= random (800);
    point (i, j);
  }
  //estrelas que aparecem:
  strokeWeight(3);
  stroke(240, 237, 160);
  point(random(0, 800), random(0, 600));

  //castelo:
  fill(227, 89, 108);
  //retângulo base:
  rect(200, 300, 500, 300);
  // tore esquerda:
  rect(200, 210, 100, 90);
  // torre direita:
  rect(600, 210, 100, 90);
  // torre central:
  rect(380, 150, 140, 150);

  //telhado:
  fill(80, 54, 3);
  // torre esquerda:
  triangle(200, 210, 300, 210, 250, 100);
  // telhado torre central:
  triangle(380, 150, 520, 150, 450, 50);
  // telhado torre direita:
  triangle(600, 210, 700, 210, 650, 100);
  
  //bandeira:
  fill(227, 89, 108);
  quad(450,35, 450, 15, 485, 35, 485, 35);
  line(450, 50, 450, 35);

  fill(67, 49, 49);
  // janela centro:
  rect(410, 210, 80, 90, 20);
  // janela esquerda:
  rect(220, 240, 60, 60, 20);
  // janela direita:
  rect(620, 240, 60, 60, 20);

  //janelas cima:
  rect(225, 340, 50, 50, 15);
  rect(305, 340, 50, 50, 15);
  rect(385, 340, 50, 50, 15);
  rect(465, 340, 50, 50, 15);
  rect(545, 340, 50, 50, 15);
  rect(625, 340, 50, 50, 15);

  //janelas baixo:
  rect(225, 430, 50, 50, 15);
  rect(305, 430, 50, 50, 15);
  rect(385, 430, 50, 50, 15);
  rect(465, 430, 50, 50, 15);
  rect(545, 430, 50, 50, 15);
  rect(625, 430, 50, 50, 15);
  rect(250, 500, 60, 60, 15);
  rect(590, 500, 60, 60, 15); 


  fill(80, 54, 3);
  //porta:
  rect(380, 500, 150, 200);

  fill(0);
  // linha vertical:
  line(455, 500, 455, 800);
  line(405, 500, 405, 800);
  line(430, 500, 430, 800);
  line(480, 500, 480, 800);
  line(505, 500, 505, 800);
  // linha horizontal:
  line(530, 510, 380, 510);
  line(530, 520, 380, 520);
  line(530, 530, 380, 530);
  line(530, 540, 380, 540);
  line(530, 550, 380, 550);
  line(530, 560, 380, 560);
  line(530, 570, 380, 570);
  line(530, 580, 380, 580);
  line(530, 590, 380, 590);
  
  //árvores:
  fill(108, 193, 53, 150);
  ellipse(75, 510, 70, 70);
  ellipse(150, 490, 70, 70);
  fill(165, 135, 35);
  line(75, 530, 75, 600);
  line(150, 510, 150, 600);

  //lua:
  fill(224, 252, 66);
  ellipse(80, 90, 70, 70);

  
  
}
