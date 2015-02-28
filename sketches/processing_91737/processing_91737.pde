
// Emanuele Reis - Exercício (Fachada)


void setup () {
  size (200, 200);
  background  (95,144,136);
}

void draw () {
  stroke(0);// Prédio
  fill (0); 
  rect (60, 50, 80, 140);
  fill (150);
  rect (80, 40, 40, 140);
  fill (255);
  rect (90, 35, 20, 140);
  rect (50, 180, 100, 5);
  rect (50, 80, 100, 5);

fill (227,207,153); 
for (int u=65; u<180; u+=25) { //Janelas Laterais
     rect (70, u, 7, 7);
     rect (125, u, 7, 7);
  }
fill (227, 207,153);
 for (int a=35; a<175; a+=5){ //Janelas Centro
  rect (90, a, 5,5);
  rect (95, a, 5, 5);
  rect (100, a, 5, 5);
  rect (105, a, 5, 5);
  }
fill (111,94,98);
for (int b=70; b<175; b+=25){ //Sacadas
  rect (50, b, 35, 5); // à direita
  rect (115, b, 35, 5);// à esquerda
  }
fill (255);// Porta
rect (85, 170, 30, 20);
fill (111,94,98);
rect (90, 180, 20,10);
fill (150);//Calçada
rect(0,190,200,20);
fill (90,65,45);//Árvores
rect (30,180,1,10);
rect (185, 180, 1,10);
stroke(113,173,64);
strokeWeight (1);
fill (36,85,10);
ellipse (30,180, 10,10);
ellipse (185, 180, 15, 15);

}
