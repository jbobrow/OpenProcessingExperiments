
size(200,200);
background(255);
strokeWeight(5);

line (20,10,100,10);

for (int i=10; i<100; i=i+15) { //designa a variação das linhas
    stroke (146,222,43); // dá a cor
    if(i<70){ // quando o i for menor que 70 vai mudar de cor
      stroke(0); // se não ficará preto
    }
  line(20, i*4, 100, i*2); // cria a linha
}
