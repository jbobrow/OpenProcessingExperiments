
void setup(){
 
 size(820,550);
 background(0);
 

 // COMEÇO DA LETRA 'D'
 
 beginShape(QUADS);
  //reta vermelha da esquerda
  
  fill(255,0,0);
  
  vertex(50, 150);
  vertex(50, 200);
  vertex(90, 200);
  vertex(90, 150);
  
  vertex(90, 200);
  vertex(90, 250);
  vertex(50, 250);
  vertex(50, 200);
  
  vertex(50, 250);
  vertex(50, 300);
  vertex(90, 300);
  vertex(90, 250);
  
  vertex(90, 300);
  vertex(90, 350);
  vertex(50, 350);
  vertex(50, 300);
  
 endShape();
 
 beginShape(QUADS);
  //L azul para baixo
  
  fill(0,0,255);
  
  vertex(90, 100);
  vertex(130, 100);
  vertex(130, 150);
  vertex(90, 150);
  
  vertex(130, 100);
  vertex(170, 100);
  vertex(170, 150);
  vertex(130, 150);
  
  /*vertex(90, 150);
  vertex(130, 150);
  vertex(130, 200);
  vertex(90, 200);
  */
  vertex(130, 150);
  vertex(170, 150);
  vertex(170, 200);
  vertex(130, 200);
  
  vertex(130, 200);
  vertex(170, 200);
  vertex(170, 250);
  vertex(130, 250);

 
 endShape(CLOSE);
 
 beginShape(QUADS);
  //L azul para baixo
 
  fill(0,0,255); 
  vertex(130, 250);
  vertex(170, 250);
  vertex(170, 300);
  vertex(130, 300);
  
  vertex(130, 300);
  vertex(170, 300);
  vertex(170, 350);
  vertex(130, 350);
  
  vertex(130, 350);
  vertex(170, 350);
  vertex(170, 400);
  vertex(130, 400);
  
  /*vertex(90, 300);
  vertex(130, 300);
  vertex(130, 350);
  vertex(90, 350);
  */
  vertex(90, 350);
  vertex(130, 350);
  vertex(130, 400);
  vertex(90, 400);
 
 endShape();
 
 //  FIM DA LETRA 'D'
 
 
 // COMEÇO DA LETRA 'A'
 
 beginShape(QUADS);
  // 1º roxinho
  
  fill(187,0,187);
  
  
  vertex(250, 200);
  vertex(290, 200);
  vertex(290, 250);
  vertex(250, 250);
  
  vertex(250, 250);
  vertex(290, 250);
  vertex(290, 300);
  vertex(250, 300);
  
  vertex(250, 300);
  vertex(290, 300);
  vertex(290, 350);
  vertex(250, 350);
  
  vertex(290, 250);
  vertex(330, 250);
  vertex(330, 300);
  vertex(290, 300);
  
 endShape(CLOSE);
 
 beginShape(QUADS);
  // 2º roxinho
  
  vertex(370, 200);
  vertex(410, 200);
  vertex(410, 250);
  vertex(370, 250);
  
  vertex(370, 250);
  vertex(410, 250);
  vertex(410, 300);
  vertex(370, 300);
  
  vertex(370, 300);
  vertex(410, 300);
  vertex(410, 350);
  vertex(370, 350);
  
  vertex(330, 250);
  vertex(370, 250);
  vertex(370, 300);
  vertex(330, 300);
  
 endShape(CLOSE);
 
 
 beginShape(QUADS);
  // reta vermelha
  fill(255,0,0);
  
  vertex(250, 150);
  vertex(290, 150);
  vertex(290, 200);
  vertex(250, 200);
  
  vertex(290, 150);
  vertex(330, 150);
  vertex(330, 200);
  vertex(290, 200);
  
  vertex(330, 150);
  vertex(370, 150);
  vertex(370, 200);
  vertex(330, 200);
  
  vertex(370, 150);
  vertex(410, 150);
  vertex(410, 200);
  vertex(370, 200);
  
 endShape(CLOSE);
 // FIM DA LETRA 'A'
 
 //  COMEÇO DA LETRA 'V'
 beginShape(QUADS);
  //1º laranjinho
  fill(255,128,0);
  
  vertex(490, 200);
  vertex(530, 200);
  vertex(530, 250);
  vertex(490, 250);
  
  vertex(490, 250);
  vertex(530, 250);
  vertex(530, 300);
  vertex(490, 300);
  
  vertex(530, 250);
  vertex(570, 250);
  vertex(570, 300);
  vertex(530, 300);
  
  vertex(530, 300);
  vertex(570, 300);
  vertex(570, 350);
  vertex(530, 350);
    
 endShape(CLOSE);
 
 beginShape(QUADS);
  //2º laranjinha
  
  vertex(610, 200);
  vertex(650, 200);
  vertex(650, 250);
  vertex(610, 250);
  
  vertex(610, 250);
  vertex(650, 250);
  vertex(650, 300);
  vertex(610, 300);
  
  vertex(570, 250);
  vertex(610, 250);
  vertex(610, 300);
  vertex(570, 300);
  
  vertex(570, 300);
  vertex(610, 300);
  vertex(610, 350);
  vertex(570, 350);
  
 endShape(CLOSE);
 //  FIM DA LETRA 'V'
 
 // COMEÇO DA LETRA 'I'
 beginShape(QUADS);
  fill(255,0,0);
  
  vertex(730, 150);
  vertex(770, 150);
  vertex(770, 200);
  vertex(730, 200);
  
  vertex(730, 200);
  vertex(770, 200);
  vertex(770, 250);
  vertex(730, 250);
  
  vertex(730, 250);
  vertex(770, 250);
  vertex(770, 300);
  vertex(730, 300);
  
  vertex(730, 300);
  vertex(770, 300);
  vertex(770, 350);
  vertex(730, 350);
  
 endShape(CLOSE);
 //    FIM DO 'I'
 
}
