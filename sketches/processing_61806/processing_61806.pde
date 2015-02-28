
void setup(){
  size (600, 400);
}
//definir o tamanho da janela

void draw(){
  
  PFont fonte;
  fonte= loadFont ("HelveticaNeue-Bold-48.vlw");
  //fazer o load da fonte
  
  int s= second();
  int m= minute();
  int h= hour();
  //definir as variaveis dos segundos, minutos e horas
  
  println (s);
  println (m);
  println (h);
  //fazer o print dos valores dessas variaveis para uma melhor visualização
  
  float x= width/2;
  float y= height/2;
  //definir variaveis para o meio da janela
  
  background (0);
  //cor do background
  
  noStroke();
  //sem linhas nos objectos
  
  //HORAS
   rect(450, 0, 450,h*16.6);
   //esta barra ira crescer conforme o valor da variavel h, horas.
   //irá até ao maximo da janela, dai o valor 16.6, 400/24=16.6
  
  //MINUTOS
  fill(0);//escuro na barra
  ellipse (x+100, y-100, m*6.5, m*6.5);
  //circundferencia dos minutos, irá crescer conforme o valor dos minutos
  //esta a fazer o papel de linha da circunferencia dos minutos principal
  
  fill(255,0,0);//zona mais escura
  ellipse (x+100, y-100, m*6, m*6);
  //circunferencia dos minutos, ira crescer conforme o valor da variavel m, minutos
  
  //SEGUNDOS
  
  fill (0); //sombra negra na bola
  quad (x-120,y-120, 
        x-s*2,y+s*2, 
        x+120,y+120, 
        x+s*2,y-s*2);
        
  fill (200,200,200);//cinza claro
  quad (x-100,y-100, 
        (x-150)+s,y-50, 
        ((x-s*1.7)-55)+s,((y+s*1.7)+55)-s, 
        x-s*1.7,y+s*1.7);
        
  fill (100,100,100);//cinza escuro
  quad (x-s*1.7,y+s*1.7, 
       ((x-s*1.7)-55)+s,((y+s*1.7)+55)-s, 
       x+50,(y+150)-s, 
       x+100,y+100);
       
  fill (255); //branco
  quad (x-100,y-100, 
        x-s*1.7,y+s*1.7, 
        x+100,y+100, 
        x+s*1.7,y-s*1.7);
   //todo este objecto é composto por quad's, que rodam conforme a variavel s, segundos
   //esta a simular um rectangulo em 3d
        
  
  //TEXTO HORAS
  textFont (fonte, 30);
  text (h, 25,370);
  text(":", 65,370);
  text (m, 75,370);
  text(":",115,370);
  text (s, 125,370);
  //as horas dispostas na janela
}

