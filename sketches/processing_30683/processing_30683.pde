
size (800, 600);//define o tamanho da janela
smooth ();//aplica anti-alias
background (188, 0, 0);//define a cor do fundo

//define as variáveis
for (int i = 0; i<100; i=i+1){
  float tamanho= random (20,100);
  fill (random (255),10,40);
stroke (188, 0, 0);//define a cor da linha
strokeWeight (random (1,2));//define a espessura da linha
//define as coordenadas para o centro
rectMode (CENTER);
rect (random (width+100), random (height+100), tamanho, tamanho);

}


for (int i = 0; i<100; i=i+1){
  float tamanho= random (1,150);
  fill (random (255,150),20);
//define as variáveis das coordenadas  
  float pos01 = random (100,700);
  float pos02 = random (100, 500);
  float tamanho2 = random (20,80);
  
stroke (188, 0, 0);
strokeWeight (random (2));
//define as caracteristicas e posição das linhas
ellipse (random (width+100), random (height+100), tamanho, tamanho);
stroke (255,50);
strokeWeight(random (1,3));
line (width/2, height/2, pos01, pos02);
ellipse (pos01,pos02, tamanho2, tamanho2);


}



saveFrame ("basic.tiff");//salva uma imagem


