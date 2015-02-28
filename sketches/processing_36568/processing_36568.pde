

size (600,600);// este comando define a janela
background (0);  /// defenir cor fundo
smooth();// define o render de graficos com anti-alissing
noStroke(); // sem contorno


//ciclo que vai desehar 1000 pontos
for (int i = 1; i <1000; i = i + 1){
  
fill(255,0,0,50); // preenchimento das formas de vermelho e opaco
strokeWeight(4); //contorno dos pontos 4
noStroke(); // sem contorno

//desenho da ellipse aleatorimente na janela, excluindo uma margem de 100pixels.
ellipse(random(width/2-100, width/2 + 100), random(height/2-100,height/2+100),  20,20);




}




