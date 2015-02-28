
/**
 * Nucleo de Arte e Novos Organismos - EBA/UFRJ
 * RJ / Brasil
 *
 *
 * Sinalizador. Desenvolvido por chcl / equipe biônicos 2013
 *
 *
 * Trata-se de uma demonstração de personalidade em arranjos circulares.
 * Desenhei dois circulos (um preenchido e outro apenas contorno). Representam uma espécie de núcleo e membrana protetora.
 * Os arcos foram gerados por valores de origens e tamanhos diferentes e aleatórios. Representam a variação externa.
 * O delay foi pra dar uma melhor fluidez, mas alterando-o você tem diferentes observações.
 *  Se eu não criasse uma variavel randomica pra cada arco, o valor seriam os mesmo para todos, e teriamos 3 arcos sobrepostos.
 * Ainda em fase de experimentação...
 *
 */
 
void setup ()
{  
 size (800,800);
}
 
void draw ()
{
  background (15, 0, 9);
   
//---------------- 
// oval 1
//----------------
  stroke(245,245,255);
  ellipse(400,400,mouseX,mouseX);
   
//----------------
// oval 2 
//----------------
  noFill();
  strokeWeight(mouseY);
  ellipse(400,400, mouseY,mouseY);
  
//-------------------------------------------
//  arcos aleatórios
//-------------------------------------------
 
  float orig01 = random(0, 2*PI);
  float orig02 = random(0, 2*PI);
  float orig03 = random(0, 2*PI);
 //as variaveis acima guardam os valores de ponto de origem dos arcos, sempre aleatorio
  
  float tam01 = random(0, PI/2);
  float tam02 = random(0, PI/2);
  float tam03 = random(0, PI/2);
 //variaveis que serão somadas aos pontos de origem resultando nos tamanhos dos arcos
 //criará arcos bem pequenos, de valores proximos a zero até a metade de PI
 //também randômico
  
  arc(width/2, height/2, height*.8, mouseX*1.5, orig01, orig01 + tam01);
  arc(width/2, height/2, height*.8, mouseX*1.5, orig02, orig02 + tam02);
  arc(width/2, height/2, height*.8, mouseX*1.5, orig03, orig03 + tam03);
  delay(80);
   
//duvidas: por que os arcos estão com arredondamento de quinas?
//pq não posso usar o mouseX para a altura e largura dos arcos(ou em uma ou em outra)?
 
 
}



