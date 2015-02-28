

/*Nome: Thais Lullez. 
/*Descrição: No ano de dois mil e treze, muitas coisas boas aconteceram na minha vida. Férias prolongadas até /*junho e o ingresso na Universidade Tecnológica Federal do Paraná. Nesse lugar, além de ter que me adaptar a /*um universo totalmente diferente do ensino médio, conhecia novos grandes amigos. Por conta deles, eu conhecia /*um dos veteranos do meu curso, que com passar dos dias eu comecei a conversar ainda mais com ele e conhece-lo /*melhor. Com o passar do tempo e da convivência, nós dois se tornamos namorados. Esse projeto, apesar de ter /*ficado um pouco cafona e romântico até de mais, é baseado nele e no que sinto. Usei vários corações porque /*são o símbolo do amor, palavras bonitas que representam o que eu sinto e um cupido para representar nossos /*amigos, porque sem eles não iríamos se conhecer. 
/*Nesse projeto, usei estruturas de repetição para aparecer vários corações e eles descerem de cima para baixo. /*Para sortear a cor do fundo, usei uma função com retorno acompanhado do random. Usei a função frameRate para /*deixar o programa lento, tendo que colocar uma estrutura de repetição nos corações e palavras para deixá-los /*mais rápidos. Para o cupido, usei as funções mouseX e mouseY. 
*/

PImage coracao,cupido;
float y=0.0;

 color sortearCor() { /*Funcao para sortear a cor do fundo */
  float vermelho = random(0,256); 
  float verde    = random(0,256); 
  float azul     = random(0,256); 
  color c = color(vermelho, verde, azul); 
  return c; 
}
void setup () {
  size (600, 600);
  coracao = loadImage("coracao.gif");
   cupido = loadImage("cupido.png");
  frameRate(3);/*Funcao utilizada para deixar o programa lento (mudanÃ§a de fundo,textos,coraÃ§Ãµes)*/

}
 void draw(){
  
    color c = sortearCor(); 
   background(c);
      image(cupido, mouseX, mouseY, 260, 200);
   for(int x=15;x<=600;x+=120){/* ESTRUTURA DE REPETIÃ�Ã�O UTILIZADA PARA OS CORAÃ�Ã�ES E TEXTOS*/
      image(coracao,x,y-920.0,80,80); 
       image(coracao,x,y-820.0,80,80); 
     image(coracao,x,y-720.0,80,80); 
    image(coracao,x,y-620.0,80,80);
     image(coracao,x,y-520.0,80,80); 
    image(coracao,x,y-420.0,80,80); 
    image(coracao,x,y-320.0,80,80); 
    image(coracao,x,y-220.0,80,80); 
    image(coracao,x,y-120.0,80,80); 
    image(coracao,x,y-20.0,80,80); 
   fill(255,0,0);
    textSize(70);
     text("AMIZADE", y-5, 100);
    text("CARINHO", y-300, 250);
     text("FELICIDADE", y-670, 400);
     text("AMOR", y-900, 550);
  y += 1.8; /*Por causa da funÃ§Ã£o frameRate o programa estÃ¡ muito lento, a variÃ¡vel "y" Ã© utilizada para aumentar a velocidade dos coraÃ§Ãµes e dos textos*/
  if ( y> 1020) { 
    y = -50.0; 
  }
  } 
 
}



