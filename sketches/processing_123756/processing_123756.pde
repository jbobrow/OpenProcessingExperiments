
float a = 10;
int b;
int c;
PFont myFont;

void setup() {
  size(400, 400);
  frameRate(40);
  myFont= createFont (WaltographUI-Bold-48.vlw", 16);
  textFont(myFont);
  
}
void draw() { 

  //CÃ©u*/
  { 
    b= 0 + mouseX/2;
    c= 0 + mouseX/7;
    background(b, c, 10);
  }

  //Sol*/
  { 
    a = a - 1;
    if (a < 10) {
      a = height;
    }
    fill(#C94A00);
    stroke(#C94A00);
    ellipse(200, a, 100, 100);
    if (a <250) 
      noLoop();
  }


  //Grama*/
  stroke(#076A01);
  fill(#076A01);
  rect(-10, 250, 420, 200);

  stroke(#189310);
  fill(#189310);
  rect(-10, 250, 420, 25);

  //PÃ¡ssaros*/
  noFill();
  stroke(0);
  arc(100, 70, 30, 30, PI+QUARTER_PI, TWO_PI);
  arc(130, 70, 30, 30, PI, TWO_PI-QUARTER_PI);
  arc(160, 90, 30, 30, PI+QUARTER_PI, TWO_PI);
  arc(190, 90, 30, 30, PI, TWO_PI-QUARTER_PI);

  //Pedra do Rei*/
  {
    fill(#89440C);
    noStroke();
    quad(310, 230, 400, 230, 420, 250, 300, 250);
    fill(#582803);
    quad(350, 120, 380, 120, 400, 230, 340, 230);
    fill(#7C3E0B);
    quad(300, 220, 380, 220, 400, 230, 310, 230);
    quad(300, 215, 380, 215, 380, 220, 300, 220);

    //Texto*/  
    fill(238, 245, 195);
    text("ARQUITETURA ONDE MENOS SE ESPERA", 10, 350);
  }
}


/* AcadÃªmico: Gabriel Papa Fernandes
 ARQUITETURA E URBANISMO
 UNIVERSIDADE TECNOLÃ�GICA FEDERAL DO PARANÃ� */


