
/*Lourainy Agustinho
Bem a melhor coisa que ainda vai acontecer 
neste ano para mim é eu passar o natal na casa do
meu avô, pois vai fazer 1 ano e meio que não vejo ele,eu ia
desenhar a cidade onde meu avô mora mais é uma cidade 
sem muitas referencias...*/

 size (300,420);

fill(196,184,184);
stroke(196,184,184);
rect(0,380,550,550);

fill(138,195,240);
//stroke(138,195,240);
rect(0,0,550,380);

stroke(42, 155, 43);
strokeWeight(5);
fill(42, 155, 43);
line(50, 350, 250, 350);//linha de baixo da arvore
for (int arvore =50 ; arvore<300 ; arvore+=50) {
    line(150, 50, arvore, 350);
}

line(50, 350, 250, 350);//linha de baixo da arvore


stroke(77,58,58);
fill(77,58,58);
rect(123,350,60,40);

for (int bola=130; bola<350; bola+=25) {
  fill(255, 32, 15);
  strokeWeight(2);
  stroke(255, 32, 15);

  if (bola<200) {
    ellipse(bola, bola+5, 10, 10);
    //ellipse(bola-185,bola+65,10,10);
  }

  else if (bola>200) 
  { 
    ellipse(bola-100, bola, 10, 10);
    //ellipse(bola-185,bola+5,10,10);
  }
  if(bola>265){
 ellipse(bola-190,bola+5,10,10);
  }
}










