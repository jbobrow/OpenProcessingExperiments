
//TELA INICIAL
size (800,600);
background (255);
//CÉU
noStroke ();
fill (0,0,255);
rect (0, 0, 800, 530);
//GRAMA 1
fill (0,255,40);
rect (0, 520, 800, 524);
//LAGO - espelho d'água
fill (0, 150, 255);
rect (0, 530, 800, 550);
//GRAMA 2
fill (0,255,40);
rect (0,550,320,600,0,60,60,60);
//PONTE
fill (255,150, 40);
rect (200, 550, 800, 600,160);
stroke(0);
line (280, 600, 318, 554);
for (int x = 305; x<800; x=x+25) {
  line (x,600,x+40,550);
}
//TEATRO
  //Parte 1 - marrom alaranjada
noStroke();
fill (140,60,60);
rect(0,50,180,500);
  //Parte 2 - vermelha
fill(230,50,0);
rect(100,200, 175,350);
  //Parte 3 - branca
fill(255);
triangle(-200,85,100, 105,100,550);
triangle(275,115, 650, 130, 275, 550);
quad(100,105,275,115, 275, 370, 100, 390);
 //Parte 4 - passarela
stroke(0);
strokeWeight(2);
fill(0,30,0,100);
quad(0,480, 275,430,275,460, 0, 510);
fill(0);
quad(0,508, 275, 458,275,460, 0, 510);
  //Parte 5 - sustentação
noStroke();
fill(130);
triangle(356,460,630,460,276,550);
  //Parte 6 - interna
stroke(0);
fill(255);
triangle(498,300, 498, 460, 356, 460);
fill(230,40,0);
triangle(498,300, 498, 350, 454,350);
  //Parte 7  - vidraça
strokeWeight(2);
fill(0,100,0,40);
triangle(650, 132,625,460,356, 460);
fill(0,30,0,0);
triangle(602, 186,588,460,356, 460);
triangle(552, 240,546,460,356, 460);
triangle(504, 294,498,460,356, 460);
triangle(454, 353,448,460,356, 460);
