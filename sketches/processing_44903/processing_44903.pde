
tinta t1 ;               // iniciar variáveis
tinta t2 ;               // estas variaveis são do tipo de classe "tinta"
tinta t3 ;
tinta t4 ;
tinta t5 ;

void setup () {                  
  size(720, 405);
  smooth();
  background (255);
  t1 = new tinta ();               // definir valor inicial das variaveis
  t2 = new tinta ();               // neste caso, são definidas como "novas"
  t3 = new tinta ();
  t4 = new tinta ();
  t5 = new tinta ();
}
 

 
void draw() {                             
  
  t1.desenhar();                   // são chamadas as varias funções para cada objecto
  t1.mover();
  t1.colisao();
  t2.desenhar();
  t2.mover();
  t2.colisao();
  t3.desenhar();
  t3.mover();
  t3.colisao();
  t4.desenhar();
  t4.mover();
  t4.colisao();
  t5.desenhar();
  t5.mover();
  t5.colisao();
  
}
 
class tinta  {                                       // inicio da classe tinta

  float posx, posy, largura, velocidade, r;           // variaveis
  
  tinta () {                                           
    posx=random(width);                              // a posição horizontal da linha varia por todo o ecrã
    posy=random(-10,-5);                             // a linha reinicia "antes" do ecrã
    largura=random(2,25);                            // define a largura da linha
    velocidade=random(1,2);                          // define a velocidade da linha                    
    r=random(150,255);                               // a cor vai variar apenas em alguns vermelhos por isso só defino uma variável para o valor da cor
  }


void desenhar () {                                  // função desenhar 
  strokeWeight(largura);                            // a largura varia de linha para linha
  line(posx, posy, posx, posy);                     // é definada a posição da linha
  stroke(r,0,0);                                    // cor da linha que só varia entre alguns vermelhos
}                                                   // fim da função desenhar

void mover () {                                     // inicio da função mover
  posy=posy+velocidade;                             // função que permite incremento constante de deslocação
}                                                   // fim da função mover

void colisao () {                                    // inicio da função colisao
  if (posy > height) {                               // condição que verifica se a linha chegou ao fim do ecrã
   posx=random(width);                               // a posição horizontal da linha varia por todo o ecrã
   posy=random(-10,-5);                              // a linha reinicia "antes" do ecrã
   largura=random(2,25);                             // define a largura da linha
   velocidade=random(1,2);                           // define a velocidade da linha
  }                                                  // fim da condição que verifica se a linha chegou ao fim do ecrã
}                                                    // fim da função colisao


}                                                    // fim de classe

