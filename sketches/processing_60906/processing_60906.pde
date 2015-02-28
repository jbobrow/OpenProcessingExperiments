
size (600,400);//tamanho da janela

background (255);//cor do fundo
smooth ();//limar arestas
 
 for (int i=0 ; i < random (100,500) ; i=i+1)//criaremos um sequência de repetições que começará em 0 e será menor que um número aleatório entre 100 e 500
 {
  noStroke();//sem delineado
  fill (random (255),0,0);//cor do preenchimento
  ellipse ( random (width), random (150,250), 25,25 );//função da elipse
 }



