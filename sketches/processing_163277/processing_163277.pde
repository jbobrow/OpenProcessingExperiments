
int x = 800, y = 800;
void setup() {
  size(x, y);
  background(127); //Modifiquei a cor do fundo com intuito de contrastar com as cores do YinYang
  noStroke(); //Permite com que o lado branco e lado preto tenha o mesmo "tamanho" (o stroke preto no branco faz com e ele pareça menor, e tira parte da harmonia da imagem. Poderia-se obter algo parecido deixando as bordas de uma cor diferente de branco e preto, mas isso tiraria da paleta de cores do Ying Yang.
  yinYang(x); //Chama a função de desenhar o YingYang
}

void yinYang(int lado) { //Função que desenha o YinYang baseando-se no tamanho da tela
  ellipse(lado/2, lado/2, lado, lado); //Desenha o círculo completamente branco inicial com diâmetro igual ao lado da tela.
  fill(0);                             //Muda a cor para que o próximo elemento criado seja preto.
  arc(lado/2, lado/2, lado, lado, 0, PI); //Utilizando a função Arc, desenha-se um arco preto com as mesmas dimenções do círculo anterior, mas indo de 0 a PI, o que representa a metade inferior do círculo. Não utilizei nem o argumento PIE nem OPEN, pois no caso das posições serem extremos opostos, o resultado seria o mesmo.
  ellipse(lado/4, lado/2, lado/2, lado/2);  //Aproveitando que o fill determinou a cor dos elementos a serem desenhados como preto, desenha-se um círculo preto cujo diâmetro é a metade dos anterioes, e com centro na mesma altura dos anteriores, mas na posição horizontal no centro do lado esquerdo da tela. 
  fill(255);                                //Muda-se o fill para que os próximos elementos sejam brancos.
  ellipse(lado*3/4, lado/2, lado/2, lado/2); //Assim como o último círculo, mas de cor branca, com centro na mesma altura, mas no centro do lado direito da tela.
  ellipse(lado/4, lado/2, lado/5, lado/5); // Aproveitando o fill anterior, desenha-se um círculo branco de lado menor ainda, com centro na mesma posição do círculo antecessor do antecessor a ele.
  fill(0); //Muda a cor dos elementos criados para preto.
  ellipse(lado*3/4, lado/2, lado/5, lado/5); //Desenha-se um círculo do mesmo tamanho do anterior, mas dessa vez preto, e com centro na mesma posição do círculo antecessor do antecessor a ele.
}

