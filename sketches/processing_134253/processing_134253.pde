
void setup() {
  size (400, 300);
}
char letter='a';
void keyPressed() {
  letter=key;
} 
void draw() {
  switch(letter) {
  case '1':            //fundo
  case'!':
    background (#FF03E2);
    break;
  case '2':           //losango
  case '@':
    fill(#0206C4);
    quad (200, 30, 370, 150, 200, 270, 30, 150);
    break;

  case '3':          //círculo     
  case '#':
    noStroke();
    if (frameCount % 1 == 0) {
      fill(#FEFF03);
      translate(200, 150);
      rotate(radians(frameCount * 2  % 360));
      rect(0, 0, 70, 20);
    }
    break;
  case '4':
  case '$':

    fill(0);             //estrelas
    textSize(15);
    text("*", 160, 180);//Rondonia

    textSize(20);
    text("*", 173, 190);//Roraima
    text("*", 170, 200);//Tocantins
    text("*", 145, 195);//Amapá
    text("*", 180, 170);//Mato Grosso do Sul

    textSize(25);
    text("*", 185, 210);//Goiás
    text("*", 150, 190);//Mato Grosso
    text("*", 140, 160);//Amazonas

    break;
  case'5':
  case'%':
    textSize(15);
    text("*", 210, 220); // Brasília
    text("*", 205, 180);//Espírito Santo

    textSize(20);
    text("*", 200, 175);//Minas Gerais
    text("*", 225, 195);//Paraná
    text("*", 233, 198);//Santa Catarina
    text("*", 240, 210);//Sergipe
    text("*", 240, 193);//Pernambuco
    text("*", 247, 193);//Paraíba
    text("*", 260, 170);//Maranhão
    text("*", 230, 150);//Acre

    textSize(23);
    text("*", 210, 170);//Bahia
    text("*", 215, 180);//Rio de Janeiro
    text("*", 230, 210);//Rio Grande do Sul
    text("*", 240, 205);//Alagoas
    text("*", 252, 189);//Rio Grande do Norte
    text("*", 254, 180);//Ceará

    textSize(25);
    text("*", 210, 195);//São Paulo
    text("*", 243, 175);//Piauí
    text("*", 233, 130);//Pará
    break;

  case'6':
  case'¨':
    background(255);
    break;
  }
}



