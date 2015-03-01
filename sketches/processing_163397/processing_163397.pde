
//LF 5700, S. II, A. 5 - 01/09/1971
//I - Para cálculo das dimensões, tomar-se-á por base a altura desejada,
//dividindo-se esta em 14 partes iguais. Cada uma das partes será
//considerada uma medida ou módulo.  

//II - O largura total será de 20 módulos.  

//III - A distância dos vértices do losango ao quadro externo será de um
//módulo e sete décimos.  

//IV - O círculo no meio do losango terá o raio de três módulos e meio.

void setup() {
  size (800, 800);
  smooth();
  mostraBandeiraBrasil(150, 500, 150); //Chama a função que cria a bandeira
}

void mostraBandeiraBrasil(int x, int y, int l) { //Função que cria a bandeira com centro na posição x, y e com largura l
  noStroke();
  fill(#16B83E); //Cor verde do retângulo da bandeira
  rect(x-(l/2), y-((l*7/10)/2), l, l*7/10); //Como os primeiros elementos da função rect definem o canto superior esquerdo do retângulo, e não o centro, como o x e o y da função mostraBandeiraBrasil() requeriu, reduzimos do x o valor da metade da largura, e do y a metade da  altura (sendo a altura 14 módulos e a largura 20 módulos, constata-se que a altura = 7/10 da largura) para que representem a posição da quina superior esquerda.  
  fill(#FFE11F); //Cor amarelo do losângulo da bandeira
  quad(x, y-(53*l/200), x-(83*l/200), y, x, y+(53*l/200), x+(83*l/200), y); //Usando a função quad para desenhar o losângulo (pois ela permite desenhar quadriláteros não retângulos, ao contrário do rect), como os pontos são 1 módulo e 7 décimos (17/10) de distância das extremidades, e como um módulo é igual a l/20, temos que o valor a ser removido é de 17*l/200. Como o valor a ser removido é em relação ao centro x, y, e não a extremidade, o valor de x deverá ser aumentado (na ponta da direita do losângulo) ou diminuido (na ponta esquerda do losângulo) do valor da metade da largura subtraído do 17*l/200 (nos pontos das extremidades esquerda e direita o valor y é o mesmo do centro da bandeira). Como a largura vale l, teremos l/2 - 17*l/200, ou (100*l-17*l)/200, logo, o valor a ser removido (ou adicionado) é de 83*l/100 (na horizontal).
                                                                            //Partindo do mesmo princípio anterior, os pontos superiores e inferiores do losângulo terão o mesmo x que o centro da bandeira, mas com y sendo subtraido (caso esteja no topo) ou adicionado (caso esteja na parte inferior) da metade da altura (1/2 * 7*l/10, ou 7*l/20) menos o valor em relação a extremidade (17*l/200), Logo terá de ser removido (ou adicionado) o valor de 7*l/20 - 17*l/200, ou (70*l - 17*l)/200, resultando no valor 53*l/200.
  fill(#1651B8); //Cor azul do círculo da bandeira
  ellipse(x, y, l*7/20, l*7/20); //Seguindo o pedido na lei LF 5700, S. II, A. 5 - 01/09/1971, como o raio deverá ter 7/2 módulos e um módulo é l/20, temos um raio de 7*l/40, mas como o argumento usado para determinar o altura e largura do círculo na função ellipse requer o diâmetro, multiplica-se o valor 7*l/40 por 2, obtendo-se 7*l/20. Como a posição x e y do círculo são os mesmos do x e y da bandeira, mantém-se os mesmos.
}

