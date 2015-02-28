
size (600,400); // tamanho da janela
background (0);  //cor do fundo
smooth(); //para anular o pixelizado das imagens dando-lhe um ar mais "macio" 
 
int esp = 10;//criar uma variável para definir o espaçamento          
int Sizex = width/ esp;//criar uma variável para a largura da janela que irá ser dividida pelo espaçamento,de forma as figuras terem todas o mesmo espaçamento


  for ( int x = Sizex; x < width; x =x + Sizex)//localizamos o desenho na janela
  {
     for(int i=0; i<10; i = i+1) //criaremos um sequência de repetições que começará em zero e será menor que dez
     {
          fill(random(255),random(255),random(255),80);//preencher as figuras com random de cor e 80 de transparência
          ellipse (x+random(30), random(30)+250, 20,20);//ellipses
     }
       
    }
   

