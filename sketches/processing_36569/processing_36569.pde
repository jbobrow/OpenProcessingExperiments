

size (600,600);// este comando define a janela
background (255,220,0);  /// defenir cor fundo
smooth();// define o render de graficos com anti-alissing
noStroke(); // sem contorno

//ciclo que vai desehar 3000 pontos
for (int i = 1; i <3000; i = i + 1){

strokeWeight(random(4));   //contorno dos pontos aleaorio entre 0 e 4
stroke(255,0,0);//cor do contorno 

//pontos distribuidos por toda o tamanha da janela (width e height)
  point (random(width), random(height) )  ;  
}

//ciclo que vai desehar 100 pontos
for (int i = 1; i <1000; i = i + 1){

strokeWeight(random(10));   //contorno dos pontos aleaorio entre 0 e 10
stroke(255,0,0);//cor do contorno 

//pontos distribuidos por toda o tamanha da janela (width e height)
  point (random(width), random(height) )  ;  

}
//ciclo que vai desehar 100 pontos
for (int i = 1; i <100; i = i + 1){

strokeWeight(random(30));   //contorno dos pontos aleaorio entre 0 e 30
stroke(255,0,0);//cor do contorno 

//pontos distribuidos por toda o tamanha da janela (width e height)
  point (random(width), random(height) )  ;  
    

}
//ciclo que vai desehar 10 pontos
for (int i = 1; i <10; i = i + 1){

strokeWeight(random(70));   //contorno dos pontos aleaorio entre 0 e 70
stroke(255,0,0);//cor do contorno 

//pontos distribuidos por toda o tamanha da janela (width e height)
  point (random(width), random(height) )  ;  
    

}



