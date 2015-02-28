
void setup () {
  size(700, 400);
  //piso
  noStroke();
  fill(50);
  rect(0, 320, width, 80);
}

void draw () {
  noStroke();
  if (mouseX> width/2)
  {//céu
    fill(3, 15, 62);
    rect(0, 0, width, 320);
    //telhado
    fill(155, 141, 37);
    quad(15, 130, 685, 130, 660, 160, 40, 160);
    //construção fundo
    fill(240, 215, 56);
    rect(40, 150, 620, 170);
    //grama
    fill(67, 103, 15);
    rect(40, 320, 240, 5);
    rect(0, 370, 350, 50);
    rect(412, 320, 300, 5);
    arc(350, 870, 1000, 1000, radians(180), radians(360));
    triangle(440, 325, 700, 325, 700, 395);
    //lua
    fill(255);
    ellipse(600, 70, 35, 35);
  }
  else {//céu
    fill(75, 197, 240);
    rect(0, 0, width, 320);
    //telhado
    fill(137, 126, 90);
    quad(15, 130, 685, 130, 660, 160, 40, 160);
    //construção fundo
    fill(0);
    rect(40, 150, 620, 170);
    //grama
    fill(108, 165, 23);
    rect(40, 320, 240, 5);
    rect(0, 370, 350, 50);
    rect(412, 320, 300, 5);
    arc(350, 870, 1000, 1000, radians(180), radians(360));
    triangle(440, 325, 700, 325, 700, 395);
  }
  //parede bambu
  stroke(162, 151, 109);
  strokeWeight(2.3);
  for (int x=40; x<661; x+=4)
  {
    line(x, 150, x, 318);
  }
  //porta
  strokeWeight(1);
  if (mouseX>width/2) {
    fill(198, 175, 90);
    rect(280, 245, 130, 74);
  }
  else {
    fill(190);
    rect(280, 245, 130, 74);
  }
  //janela
  if (mouseX>width/2) {
    fill(198, 175, 90);
    rect(530, 260, 130, 59);
  }
  else {
    fill(200);
    rect(530, 260, 130, 59);
  }
  //reflexos porta
  noStroke();
  for (int y=287; y<405; y+=29)
  {
    fill (255);
    rect(y, 246, 3, 73);
    fill(255, 200);
    rect(y-7, 246, 1, 73);
  }
  //reflexos janela
  for (int z=550; z<660;z+=38)
  {
    fill (255);
    rect(z, 261, 3, 58);
    fill(255, 200);
    rect(z-12, 261, 1, 58);
    rect(z+28, 261, 0.5, 58);
  }
  //cobertura porta
  if (mouseX>width/2) {
    fill(137, 117, 58);
    quad(280, 245, 240, 120, 450, 120, 411, 245);
  }
  else {
    fill(129, 118, 86);
    quad(280, 245, 240, 120, 450, 120, 411, 245);
  }
}
