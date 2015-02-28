
//Código Fonte - Ópera de Arame
//Aluna: Stela Mara de Souza da Nóbrega 
//Curso - Arquitetura e Urbanismo PT

int value=0;
import processing.pdf.*;

boolean salvar=false;

void setup () {
  size (900, 680);
}



void draw () {

  if (salvar==true) {
    beginRecord(PDF, "PDF###.pdf");
  }

  // fundo verde 
  noStroke(); 
  fill(26, 137, 69, 200); 
  beginShape(); 
  vertex(900, 617); 
  bezierVertex(900, 610, 0, 630, 0, 680); 
  vertex(0, 150); 
  bezierVertex(150, 150, 250, 180, 350, 240); 
  bezierVertex(350, 240, 450, 370, 900, 170);
  endShape();

  //acesso opera chão
  noStroke ();
  beginShape(); 
  fill(216);
  vertex(0, 680); 
  bezierVertex (0, 620, 40, 620, 200, 620);
  bezierVertex (200, 620, 180, 640, 60, 680);
  vertex(200, 620); 
  bezierVertex (200, 620, 150, 660, 200, 680);
  endShape();

  //barra entre andares
  fill(255, 255, 255);
  noStroke();
  for (int a=510; a>300; a=a-90)
    rect (62, a, 566, 5);
  rect (62, 300, 566, 5);
  rect (625, 510, 780, 5);
  rect (625, 575, 680, 5);
  rect (625, 420, 80, 5);

  //repetiçao função arco primeiro andar
  for (int i=100; i<620; i=i+70) {
    arco (i, 460, 65);
    arco (i, 460, 70);
    arco (665, 610, 70);
    arco (665, 460, 71);
  }
  for (int s=665; s<950; s=s+80) {
    arco (s, 540, 70);
  }
  //repetiçao função arco térreo
  for (int i=135; i<620; i=i+140) {
    arco1 (i, 570, 130);
    arco1 (i, 570, 140);
    arco1 (770, 630, 140);
    arco1 (915, 630, 140);
  }
  //linhas vinculadas aos arcos no segundo andar
  for (int i=100; i<620; i=i+70) {
    arco2 (i, 370, 45);
  }
  //circulos segundo andar
  for (int i=100; i<620; i=i+70) {
    circulo (i, 345, 15);
  }
  //colunas térreo
  for (int coluna=62; coluna<650; coluna=coluna+140) {
    fill(255, 255, 255);
    rect (coluna, 510, 5, 110);
    rect (783, 510, 5, 67);
    rect (863, 510, 5, 67);
  }
  //colunas primeiro andar
  for (int coluna=62; coluna<650; coluna=coluna+70) {
    fill(255, 255, 255);
    rect (coluna, 330, 5, 180);
    rect (700, 420, 5, 210);
    rect (62, 305, 5, 25);
    rect (622, 305, 5, 25);
  }
  //triangulos barras finais
  for (int x=65; x<580; x=x+70) {
    noFill();
    triangle(x, 330, x+35, 305, x+70, 330);
  }
  //cobertura entrada
  for (int c=630; c<706; c=c+8)
    line (c, 390, c, 420);
  line (625, 390, 701, 390);

  //parte do codigo da Débora Guimarães, telhado
  stroke(255); 
  for (int b = 0; b < 650; b += 25) { 
    if (b<mouseX/3) 
      noFill();
    else 
      arc(345, 299, 568-b, 284-(mouseY+1)/2, PI, 2*PI);
  }

  //traço de luz
  {
    if ( mouseX >= 0 && mouseX <=900 && mouseY >= 0 && mouseY <= 300)
    {
      fill(255, 255, 30, 2);
      noStroke ();
      quad (0, 0, 0, 300, 900, 300, 900, 0);
    }
    else 
    {
      fill(75, 104, 206, 10);
      noStroke (); 
      quad (0, 0, 0, 300, 900, 300, 900, 0);
    }
  } 


  //parte do código de Cindy Okino, lago
  for (int f=200;f<width;f=f+680) {  
    lago(f, int(random(100))+580, 900, random(4, 142));
  }
}

void lago(int posA, int posB, int linha, float amarelo) { 
  noStroke(); 
  fill(30, 100, amarelo, 50); 
  for (int f=121; f<242; f++)//agua 
    ellipse(posA+random(linha), posB+random(linha), random(100), random(10));
}

//arcos
void arco(int posx, int posy, int largura) {
  stroke (255);
  noFill();
  arc(posx, posy, largura, 50, PI, PI+PI, OPEN);
}
void arco1(int posx, int posy, int largura) {
  stroke (255);
  arc(posx, posy, largura, 100, PI, PI+PI, OPEN);
}
void arco2(int posx, int posy, int largura) {
  stroke (255);
  arc(posx, posy, largura, 35, PI, PI+PI, OPEN);
  line (posx-largura/2-1, posy, posx-largura/2-1, posy+largura*1.1);
  line (posx+largura/2, posy, posx+largura/2, posy+largura*1.1);
}
void circulo(int posx, int posy, int largura) {
  noFill();
  arc(posx, posy, largura, 15, 0, PI+PI, OPEN);

  if (salvar==true) {
    endRecord();
    salvar=false;
  }
}
//traço de luz
void mouseClicked() {
  if ( mouseX >= 0 && mouseX <=900 && mouseY >= 0 && mouseY <= 300)
  {
    fill(255, 255, 30, 2);
    noStroke ();
    quad (0, 0, 0, 300, 900, 300, 900, 0);
  }
  else 
  {
    fill(75, 104, 206, 10);
    noStroke (); 
    quad (0, 0, 0, 300, 900, 300, 900, 0);
  }

  salvar=true;
}
