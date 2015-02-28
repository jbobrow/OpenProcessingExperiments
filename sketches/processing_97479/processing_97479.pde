
// Cindy Feijó, 2S2012
// Reforço 3 - original
// Usando cores quentes

void setup () { 
size (200,200);
background (255, 69, 0); // Orange Red
noStroke (); //quadrado delimitado pela própria cor
}

void draw (){ //campo da interatividade
 int x = mouseX; 
 int y = mouseY;
  background (255, 69, 0); // até encostar no quadrado, o fundo é laranja
  rect (85,85, 25,25); // quadrado amarelo do meio
  fill (255,255,0); //Yellow 1
{
  if (x>=85 && x<=110 && y>=85 && y<=110) // se o mouse encostar na região de x, que varia entre 85 e 110 (dimensões do quadradinho), e o mesmo para y:
  background (255); //tudo fica branco!
}
}
