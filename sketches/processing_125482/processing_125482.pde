
/* Nome: Lucas Eduardo Gonçalves
Essa é a representação da melhor coisa que me aconteceu no ano de 2013,
meus pais após 10 anos pagando, conseguiram terminar de pagar nosso apartamento.
Foram anos dificeis, pois varias vezes corremos o risco de ter nosso apartamento leiloado,
por falta de pagamento, mas graças a Deus deu tudo certo.  Não ficou aquela maravilha o desenho, mas o que me representa é algo muito importante.
Ps.: o prédio esta sem porta, pois na realidade ela fica na lateral do prédio.*/

int cor(int nCor){
  
  if (nCor == 1){ //amarelo escuro
    return #DED680;
  }
  if (nCor == 2){ //azul  
    return #80C5DE;
  }
  if (nCor == 3){ //verde
    return #43AA49;
  }
  if (nCor == 4){ //cinza
    return #C6C6C6;  
  }  
}
void predio(){
  fill(cor(1));
  rect(43,95,532,469);
  fill(cor(4));
  rect(67,123,485,419);
  for (int x = 97;x < 480; x+=97){
    strokeWeight(4);
    line(67 + x,125,67 + x,541);
  }
  for (int y = 79;y < 380; y+= 79){
    strokeWeight(4);
    line(69,123 + y, 550, 123 + y);
  }  
}

void setup(){
size(622,625);
background(cor(2));
fill(cor(3));
rect(0,504,622,121);
predio();

}

