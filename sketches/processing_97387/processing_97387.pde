
//Reforço 3
//Giovanna DallaCruz
void setup () {
  size (200, 200);
  background (#6C892C);
}
void draw () {
  float a= random(30);
  float b=random(30);
  fill (#7D9DF2);
  rect(85, 85, a, b);//Quadrado central;
  {
    if ((mouseY>=85 && mouseY<=115) && (mouseX>=85 && mouseX<=115))
      background (#F27DED);//Mudança da Cor de Fundo
    fill(#9FECF2);
    triangle (a+85, b+85, 85, 85, 115, 115);//Borboleta, só aparece quando o mouse esta em cima do quadrado;
  }
}
