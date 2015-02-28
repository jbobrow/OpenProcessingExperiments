
/* Monica Alessandra Becker
18/12/2013

Não foi difícil pensar em um tema, pois logo lembrei de uma coisa realmente muito boa e significativa que aconteceu pra mim esse ano. Em 2013 comecei a frequentar um grupo budista, e o envolvimento com essa filosofia trouxe incontáveis mudanças positivas na minha vida. Além dos ensinamentos veio a prática da meditação, que ajuda muito em todas as áreas possíveis, desde estudos a relacionamentos em geral. Também fez com que eu aderisse ao vegetarianismo, com o qual sempre simpatizei, só faltava uma motivação real pra tornar definitivo. Enfim, não está nos meus planos me tornar monja ou algo do gênero, mas pretendo continuar estudando sobre o assunto. O símbolo que escolhi para o trabalho chama-se Dharmachakra, ou roda da transformação, e representa vários conceitos importantes do budismo. Talvez tenha ficado muito psicodélico, mas é o que tem pra hoje. (Prof, 200 palavras não dá, ou eu falo 100 ou eu falo 1000!)
*/

// Função para cor aleatória
color sortearCor()
{
  color cor = color(random (255), random (255), random (255));
  return cor;
}

// Iniciar
void setup ()
{
   size(500,500);
   background(255);
   smooth(); 
}

void draw ()
{
color cor = sortearCor();
noStroke();
fill (cor);

// Símbolo
ellipse (250,250,400,400);
fill(255);
ellipse (250,250,300,300);
fill(cor);

for (int x=50; x<=450; x+=40)
ellipse (x, 250, 50, 50);

for (int y=50; y<=450; y+=40)
ellipse (250, y, 50, 50);

for (int y=100; y<=400; y+=30)
ellipse (y, y, 50, 50);

ellipse(100,400,50,50);
ellipse(150,350,50,50);
ellipse(180,320,50,50);
ellipse(210,290,50,50);
ellipse(290,210,50,50);
ellipse(320,180,50,50);
ellipse(350,150,50,50);
ellipse(400,100,50,50);
ellipse(250,250,140,140);

fill(255);
ellipse(250,250,80,80);

}
