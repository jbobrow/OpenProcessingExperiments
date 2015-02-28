



// criar nova variável para os objectos 
desenho animacao;
desenho01 animacao2;
desenho03 animacao3;
vertical01 animacao4;
vertical02 animacao5;
vertical02 animacao6;

void setup () { // configurações da tela
  background (255);
  size (900,500);
  smooth ();
  
  // chamar os objectos
  // posicionamento e dimensões dos objectos com referência às suas variáveis
  animacao = new desenho (900,50, 100);
  animacao2 = new desenho01 (0,200, 200);
  animacao3 = new desenho03 (900,400, 200);
  animacao4 = new vertical01 (350,-1000, 200);
  animacao5 = new vertical02 (550,1300, 350);
  animacao6 = new vertical02 (0,1500, 350);
}
    
    
    void draw () {
      //background (0,20); // desactivado para criar efeito de arrasto
      
     // chamada das duas funções dos objectos
      animacao.update();
      animacao.desenha();
      
      animacao2.update();
      animacao2.desenha();
      
      animacao3.update();
      animacao3.desenha();
      
      animacao4.update();
      animacao4.desenha();
      
      animacao5.update();
      animacao5.desenha();
      
      animacao6.update();
      animacao6.desenha();
      
    }
      

