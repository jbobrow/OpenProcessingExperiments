
// Cindy Feijó, 2S2012
// Reforço 4 - original
// usando cores sem saturação

void setup (){
  size (200, 200);
 }
void draw (){
background (0); // fundo Preto
noStroke ();

for (int x=40; x<180; x=x+20){ //condição de variação dos círculos
fill (#708090, x+70); // condição de variação da cor dos círculos, em SlateGrey
ellipse (x, 40, 45, 45);
}
int esp = 12; // variável espaço

for (int y=-100; y<200; y=y+esp){ //condição de variação dos pontos
stroke (255); //pontos brancos
strokeWeight (3);
point (y+100,y*y/100+100); //variação dos pontos, em parábola
}
   }
