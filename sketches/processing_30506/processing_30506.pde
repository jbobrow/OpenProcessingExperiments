
//definir tamanho da tela, suavidade das formas, e cor de fundo
size(600,600);
smooth();
background(255);
 
//definicao da orientacao das formas na grelha, horizontalmente e verticalmente. definicao das elipses pequenas.
for(int i=0;i<width; i+=10){
  for(int j=0;j<height;j+=10){
    if(i%20==0 && j%20==0){
      fill(random (255));
    }else{
        noFill();
      }
    ellipse(i,j,1,1);
   }
}
//definicao da elipse central, e quadrados. Tambem se ordena para, cada vez que o codigo e gerado, para alterar o degrade destas formas. 
for (int i=25; i<600; i+=100){
  for (int j=25; j<600; j+=100){
    fill(random (255));
    noStroke();
    line (i,j,100,100);
    rect (i,j,50,50);
    fill(random (255));
    ellipse(300,300,100,100);
    
     
      
  }
}
                                
