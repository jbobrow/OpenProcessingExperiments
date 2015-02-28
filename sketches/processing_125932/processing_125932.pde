
/*Nome:Katielen Silva
Esse ano de 2013 aconteceu tanta coisa e muito rÃ¡pido. No final do ano passado eu fiz o ENEM, mas eu nÃ£o fui muito bem com a nota.Eu pensei que nÃ£oia conseguir passar em nenhuma universidade ou faculdade. EntÃ£o tentei uma prova para fazer um cursinho prÃ©-vestibular gratuito. Fiz todas as etapas exigidas, mas tambÃ©m nÃ£o consegui passar. Fiquei muito chateada. Quando fui fazer a matrÃ­cula para um cursinho particular,ligaram para mim dizendo que tinha surgido uma vaga. Fiquei muito feliz! Mas nesse processo todo ainda tentei pelo SISU passa na UTFPR para BSI, pois tambÃ©m nÃ£o tinha conseguido nas duas primeiras chamadas. Mas logo no primeiro mÃªs de cursinho recebi a notÃ­cia que tinha passado na Universidade. Quando comecei a estudar na universidade conheci vÃ¡rios amigos muito legais, para vida toda, que sempre me ajudam em todas as matÃ©rias e sempre dando muitas risadas. Nesse cÃ³digo tentei representar de forma dinÃ¡mica as melhoras coisas que aconteceram comigo em 2013. Usando variÃ¡veis, imagens, repetiÃ§Ãµes e funÃ§Ãµes como mouseClicked e mouseRealesed.*/

int c=255;//Uma variavel para que o random funciona
PImage friends;//Variavel para imagem
PImage cursinho;//Variavel para imagem
PImage ut;//Variavel para imagem
void setup() {
  size(600, 600);
  friends=loadImage("amigos.png");//Chamando a função
  cursinho=loadImage("formacao.png");
  ut=loadImage("utfpr.png");
  background(random(c), random(c), random(c));//Vai rodar cores aleatórias
  fill(random(c));
  fill(random(c));
}

void draw() {
  noStroke();
  rectMode(CENTER);
  rect(300, 300, 50, 50);//O retângulo faz uma forma interativa,para que as figuras apereça
  for (int x=0;x<=500;x+=150) {//E estrutura repetição para aparacer o texto na tela
    for (int y=0;y<=500;y+=150) {
      textSize(20);
      text("2013 :D",x,y);
    }
  }
}

void mouseClicked() {
  image(friends, 0, 0, 150, 150);//Chamando,e dando os parâmetros das imagens
  image(cursinho, 450, 470, 150, 150);
  image(ut, 450, 20, 150, 150);
  fill(255);
  textSize(50);
  text("SAÚDE", 20, 570);

}

  void mouseReleased() { 
  textSize(20);
  text("Aperte no retângulo para ver que eu fiz em 2013", 50, 270);
}



