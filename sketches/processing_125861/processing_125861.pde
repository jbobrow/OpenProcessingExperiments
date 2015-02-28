
/*Resolvi escolher o jogo da ultima rodada do campeonato Brasileiro, porque foi marcado com a confirmação do rebaixamento do time do vasco, tecnicamente seria fácil de representar no processing e ao mesmo tempo atenderia a demanda exigida pela proposta de projeto do trabalho dois solicitado pela professora Sílvia. Infelizmente ultimo jogo da rodada do campeonato brasileiro foi marcado por violência no estádio em que foi realizado, no estado Santa Catarina, ambas as torcidas organizadas  entraram em confronto por motivos desconhecidos mas que variam desde provocações a agressões, sem a intervenção da Policia Militar houve quarenta e cinco minutos de paralisação no jogo por decorrência da ação brutal que ocorria nas arquibancadas, uma pessoa morreu devido aos traumas sofridos durante a agressão da torcida rival. O Superior Tribunal de Justiça Desportiva (STJD) definiu nesta sexta-feira as punições decorrentes do confronto Atlético-PR x Vasco, realizado no último domingo na Arena Joinville, e marcado por uma confusão entre torcedores organizados de ambas as equipes. Como resultado, o Atlético-PR foi punido com a perda de 12 mandos de campo, enquanto o Vasco perdeu oito mandos para o ano que vem.*/

PImage vasco;
PImage cap;
PImage explode;
int x, y, tempo;
void setup(){
  size (600, 600);
  vasco = loadImage("cap.png");
  cap = loadImage("vasco.png");
  explode = loadImage("explode.png"); // função com retorno
  
}

void draw(){
  for (int fundo=0; x<200; fundo++){ 
  background(255-fundo);
  }
  if (tempo<700) tempo++; //duração da animação
  if (x<200) x++;
  if (tempo<350) image(cap,x, y+237); //função sem retorno
  if (tempo<369) image(vasco, 500-x, y+237);
  if (tempo>=370) image(vasco, 0, 0, width, height);
  if (tempo>=199 && tempo<300) image(explode, 260, 260);  
}
