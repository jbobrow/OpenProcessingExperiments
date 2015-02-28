
PImage  backroundImg; //Tipo de dados para armazenar imagens
PImage frontGroundImg;//Tipo de dados para armazenar imagens
bola [] listBolas;  // array que permite multiplicar os objectos chamados para a animação
neve [] listNeve;// array que permite multiplicar os objectos chamados para a animação
floco [] listFloco;// array que permite multiplicar os objectos chamados para a animação
floco2 [] listFloco2;// array que permite multiplicar os objectos chamados para a animação

//############################################################################################
void setup () {// configurações da tela

  size (700,500);// tamanho da tela
  backroundImg = loadImage ("fundo.jpg");
  frontGroundImg = loadImage ("fundo2.png");
  
  listFloco2 = new floco2 [51]; // definie o tamanho da lista
  for (int i = 0; i < 51; i++) {// iniciar ciclo, número limitado pela variável
    listFloco2 [i]=new floco2(40,40);
  }

listFloco = new floco [100]; // definie o tamanho da lista
  for (int i = 0; i < 100; i++) {// iniciar ciclo, número limitado pela variável
    listFloco [i]=new floco(20,20);
  }

  listBolas = new bola [100]; // definie o tamanho da lista
  for (int i = 0; i < 100; i++) {// iniciar ciclo, número limitado pela variável
    listBolas [i]=new bola(10,10);
  }

  listNeve = new neve [70]; // definie o tamanho da lista

  for (int i = 0; i < 70; i++) { // iniciar ciclo, número limitado pela variável
    listNeve[i] = new neve(20,20);
  }
}// fim do setup
//##########################################################################################
void draw () {// função para desenhar, chamar o objecto com aplicação de ciclo for para multiplicação
  background(255);// recriar a cada ciclo
  // 1 layer
  imageMode(CORNER);//especifica a posiçao da imagem
  image(backroundImg, 0, 0);// recriar a cada ciclo
  
  for (int i = 0; i < 51; i++) {
   // chamada das duas funções dos objectos
   listFloco2[i].update();
   listFloco2[i].drawing();
  }
  
  for (int i = 0; i < 100; i++) {
   // chamada das duas funções dos objectos
   listFloco[i].update();
   listFloco[i].drawing();
  }
  
  //lopp para desenhar as bolas
  //2 layer
  for (int i = 0; i < 100; i++) {
   // chamada das duas funções dos objectos
   listBolas[i].update();
   listBolas[i].drawing();
  }
  //3 layer      
  imageMode(CORNER);
  image(frontGroundImg,0,0);
  
 

 //lopp para desenhar neve
  //4º layer
  for (int i = 0; i < 70; i++) {
// chamada das duas funções dos objectos
    listNeve[i].update();
    listNeve[i].drawing();
  }
}//fim do draw



