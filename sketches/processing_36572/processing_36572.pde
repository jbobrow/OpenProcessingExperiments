

size (600,600);// este comando define a janela
background (255,220,0);  /// defenir cor fundo
smooth();// define o render de graficos com anti-alissing
noStroke(); // sem contorno

//ciclo que vai desehar 3000 pontos
for (int i = 1; i <3000; i = i + 1){

strokeWeight(random(5));  //contorno dos pontos aleaorio entre 0 e 5

  
stroke(100,200,200);//cor do contorno 

//desenho dos varias linhas de pontos
point (random(600), random(10,20) )  ; 

point (random(600), random(30,50) )  ; 

point (random(600), random(60,90) )  ; 

point (random(600), random(100,150) )  ; 

point (random(600), random(160,240) )  ; 



point (random(600), random(250,350) )  ;



point (random(600), random(360,450) )  ; 

point (random(600), random(460,500) )  ; 

point (random(600), random(510,540) )  ; 

point (random(600), random(550,570) )  ; 

point (random(600), random(580,590) )  ; 
}






    




