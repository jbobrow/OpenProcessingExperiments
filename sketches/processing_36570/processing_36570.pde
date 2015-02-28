

size (600,600);// este comando define a janela
background (255,220,0);  /// defenir cor fundo
smooth();// define o render de graficos com anti-alissing
noStroke(); // sem contorno

//ciclo que vai desehar 3000 pontos
for (int i = 1; i <3000; i = i + 1){

strokeWeight(random(5));   //contorno dos pontos aleaorio entre 0 e 5
stroke(255,0,0);//cor do contorno 

//pontos distribuidos por toda o tamanha da janela (width e height)
  point (random(width), random(height) )  ;  



stroke(200,200,200);////cor do contorno cinza

//pontos distribuidos cima esquerda
point (random(0,300), random(0,300) )  ;  

//pontos distribuidos baixo direita
point (random(300,600), random(300,600) )  ; 



stroke(200,100,200);//cor do contorno roxa

//pontos distribuidos cima direita
point (random(0,300), random(300,600) )  ; 

//pontos distribuidos baixo esquerda
point (random(300,600), random(0,300) )  ; 

}






    




