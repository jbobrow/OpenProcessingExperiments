
//Habitação + Animação + Interação
//Passar dos dias em câmera rápida
//Giovanna DallaCruz
void setup () {
  size (200, 200);
  background (0, 0, 100);
}
void draw () {
  int sun= 30;
  fill (#FFEC17);
  ellipse(sun-9, sun, sun, sun);//Quadrado central;
  {
    if ((mouseY>=10 && mouseY<=45) && (mouseX>=10 && mouseX<=45))
      background (#7DE5E3);//Mudança da Cor de Fundo
  }
  //Fachada Pós-Moderna
  line(37, 37, 37, 200);
  line(52, 52, 52, 200);
  line(63, 103, 63, 200);
  line(77, 103, 77, 200);
  line(84, 103, 84, 200);
  line(98, 103, 98, 200);
  line(110, 103, 110, 200);
  line(119, 103, 119, 200);
  line(125, 125, 125, 200);
  line(22, 177, 177, 177);
  line(117, 188, 188, 188);
  line(149, 77, 99, 200);
  line(119, 77, 179, 200);
  line(69, 170, 159, 170);
  line(20, 164, 188, 164);

  noStroke();
  fill(#AEEFF2, 80);
  for (int y=105;y<200;y+=15) {
    rect(40, 55, 10, 10);
    rect(40, 70, 10, 10);
    rect(40, 85, 10, 10);
    rect(40, y, 10, 10);
    rect(55, y, 10, 10);
    rect(70, y, 10, 10);
    rect(85, y, 10, 10);
    rect(100, y, 10, 10);
    rect(115, y, 10, 10);
  }
  noStroke();
  fill(#B22222);
  rect(43, 175, 17, 33);
  strokeWeight(1);
  stroke(255);
  line(13, 200, 100, 177);
  line(97, 187, 100, 177);
  line(97, 187, 189, 149);
  //Passagem dos Dias
  float a= random(30);
  float b=random(30);
  fill (#AEEFF2, 80);
  rect(143, 155, a-15, b*b);//Portas em câmera rápida
  fill(#FA961C);
  ellipse (21, 28, a, b);//Sol em câmera rápida
  {
    while ( (mouseY>=85 && mouseY<=115) && (mouseX>=85 && mouseX<=115))
      background (#F27DED);//Mudança da Cor de Fundo
  }
}
