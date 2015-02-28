

size (600,600);// este comando define a janela
background (255,220,0);  /// defenir cor fundo
smooth();// define o render de graficos com anti-alissing
noStroke(); // sem contorno







//ciclo que vai desehar 2000pontos
for (int i = 1; i <2000; i = i + 1){

strokeWeight(random(5));  //contorno dos pontos aleaorio entre 0 e 5
stroke(255,0,0);//cor do contorno vermelha

//pontos random destribuidos por toda a janela
point (random(width), random(height) )  ;  
  

}

//ciclo que vai desehar 100 ellipses
for (int i = 1; i <1000; i = i + 1){
  
fill(0,90); //cor do preenchimento é preto com opacidade

//stroke(0);
strokeWeight(4); //contorno dos pontos é 4

//ellipses desenhadas aleatoria na janela mas nunca a menos de 200 pixeis das extermidades
ellipse(random(width/2-200, width/2 + 200), random(height/2-200,height/2+200),  30,30);




}





  

  
fill(255,0,0,90); // preenchimento vermelho com opacidade
strokeWeight(4); // tamanho do contorno de 4
noStroke(); /// sem contorno


//desenho de ellipses que fazem a rosa
ellipse(width/2+20, height/2,   100,100);
ellipse(width/2,    height/2+20,100,100);   
ellipse(width/2-20, height/2,   100,100);   
ellipse(width/2,    height/2-20,100,100);



ellipse(width/2+20, height/2,   200,200);
ellipse(width/2,    height/2+20,200,200);   
ellipse(width/2-20, height/2,   200,200);   
ellipse(width/2,    height/2-20,200,200);







    




