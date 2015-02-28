
int sol;
void setup()
{
  size (640, 480);
  smooth();
  noStroke();
  colorMode(RGB);
  frameRate(100);
  sol=0;
  fill (120, 120, 120); // chão
  noStroke();
}


void draw() {
  fill(204, 226, 234);
  rect (0, 0, 640, 320);
  sol++;
  noStroke();
  fill(255, 255, 0);
  ellipse(mouseX, 30, 30, 30);                        //sol se mexendo




  fill (119, 214, 196);
  rect (20, 100, 600, 200); // volume geral

  for (int i=20; i<=620; i+=20) { // linhas verticais
    stroke (250, 239, 141);
    line (i, 100, i, 300);
  }

  for (int j=100; j<=300; j+=20) { // linhas horizontais
    stroke (250, 239, 141);
    line (20, j, 620, j);
  }
  fill(250, 239, 141);


  for (int cir=30; cir<=620; cir+=20) { // definição da repetição dos círculos na horiz
    for (int circ=110; circ<=300; circ+=20) { // definição da repetição do círculos na vertical
      noFill();
      smooth();

      stroke(250, 239, 141);
      ellipse (cir, circ, mouseX/100, mouseX/100);
    }
  }// círculos paramétricos



  for (int k=70; k<620; k+=100) { // pilotis
    fill(250, 239, 141);
    rect (k, 300, 5, 20);
  }


  int posx= mouseX;  // posição do sol que define a insolação e consequente abertura dos círculos paramétricos
}

