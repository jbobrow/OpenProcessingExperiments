
size(400,400);
background(0);

stroke(255,100,100); //cabeça
fill(255,100,100);
ellipse(200,220,200,200);

stroke(255,100,100); //orelha esquerda
fill(255,100,100);
ellipse(100,120,100,100);

stroke(255,100,100); //orelha direita
fill(255,100,100);
ellipse(300,120,100,100);


stroke(255,0,0); //vermelhos
strokeWeight(2);
for (int i = 10; i < 400; i = i+10) {
  for (int j = 0; j < 400; j = j+10) {
    point(i, j);
  }
}

stroke(0,100,255); //azuis
strokeWeight(2);
for (int i = 5; i < 400; i = i+10) {
  for (int j = 0; j < 400; j = j+10) {
    point(i, j);
  }
}

stroke(0,255,0); //verdes
strokeWeight(2);
for (int i = 10; i < 400; i = i+10) {
  for (int j = 5; j < 400; j = j+10) {
    point(i, j);
  }
}

stroke(255,255,255); //branco
strokeWeight(2);
for (int i = 5; i < 400; i = i+10) {
  for (int j = 5; j < 400; j = j+10) {
    point(i, j);
  }
}
