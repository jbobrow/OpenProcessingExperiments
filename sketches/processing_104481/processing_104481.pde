
//Arquitetura e Urbanismo - UTFPR 1s2013
//Rafael T. Aires
//Trabalho 2 de Computação I
// CLIQUE!



float cor1;
float cor2;
float cor3;
float cor4;
float cor5;
float cor6;
float cor7;
float cor8;
float cor9;
float cor10;
float cor11;
float cor12;
float cor13;
float corx;
float cory;
float corz;
float transp;


void setup() {
  
  smooth();
  strokeCap(PROJECT);
  size(510, 510);
  background(1, 1, 1);
  noFill();  
  
  // triângulo central  
  stroke(255, 255, 255);
  strokeWeight(7);
  triangle(255,170, 170,340, 340,340);     
}


void draw() {
  
 if (mousePressed == true) {
  smooth();
  frameRate(30);  
  strokeCap(PROJECT);
  strokeJoin(MITER);
  
  // luz branca
  stroke(255, 255, 255, 10); 
  strokeWeight(2);
  line(1,306, 218,250);
  
  // refração interna
  noStroke();
  triangle (218,250 , 293,229, 308,267);
  fill (corx, cory, corz);

  // 1 vermelho
  strokeWeight(6);
  stroke(255, cor1, cor2);
  line(293,232 , 510,261);
  
  // 2 laranja
  strokeWeight(6);
  stroke(255, cor3, cor4);
  line(296,237 , 510,268);
  
  // 3 amarelo
  strokeWeight(6);
  stroke(cor5, cor6, cor7);
  line(298,244 , 510,275);
  
  // 4 verde
  strokeWeight(6);
  stroke(cor8, 255, cor9);
  line(302,250 , 510,282);
  
  // 5 azul
  strokeWeight(6);
  stroke(cor10, cor11, 255);
  line(305,256 , 510,289);
 
 // 6 violeta
  strokeWeight(5);
  stroke(cor12, cor13, 127);
  line(308,262 , 510,296);
   
  cor1 = random (15, 100);
  cor2 = random (10, 90);
  cor3 = random (59, 170);
  cor4 = random (23, 30);
  cor5 = random (240, 255);
  cor6 = random (150, 250);
  cor7 = random (0, 45);
  cor8 = random (23, 184);
  cor9 = random (17, 255);
  cor10 = random (24, 50);
  cor11 = random (16, 230);
  cor12 = random (33, 255);
  cor13 = random (18, 23);
  corx = random (1, 255);
  cory = random (1, 255);
  corz = random (1, 255);
  transp = random (0, 90);
  
  // triângulo central  
  stroke(255, 255, 255);
  strokeWeight(7);
  noFill();
  triangle(255,170, 170,340, 340,340);  
  
  // refração interna
  noStroke();
  triangle (218,250 , 293,229, 308,267);
  fill (corx, cory, corz);
 
  } 
  
  else {
  
  smooth();  
  background(1, 1, 1);
  fill(1);
  frameRate(10);
  strokeCap(PROJECT);
  strokeJoin(MITER);
  
  // triângulo central
  stroke(255, 255, 255);
  strokeWeight(7);
  triangle(255,170, 170,340, 340,340);
  }
}
