
int counter;

// Gabriel Nunes 2S2012 - Arquitetura e Urbanismo UTFPR
// Projeto de conclusão de Disciplina
// Sketch com uso na Arquitetura + Interação

void setup() {
size(300, 300); //Delimita o campo compositivo
smooth();
font = loadFont("BookAntiqua-Italic-48.vlw");
textFont (font, 16);
}

//Luz do Farol
int luz1= 90; 
int luz2= 120;
int luz11 = 60;
int luz22 = 150;

//Define a altura da agua do mar
int alturadomar = 260;

//Corpo do Farol
void draw() {
background(220, 40);
noStroke();
fill(160, 115, 50);
triangle(15 + width/3, 60, width/3 - 5, 90, 35 + width/3, 90);
stroke(100, 140, 150);
fill(140, 170, 180, 85);
rect(width/3, 90, 30, 30);

//Fonte principal do qual emana a luz 
noStroke();
fill(240, 240, 160, 97);
ellipse(15 + width/3, 105, 30, 30);
noStroke();
fill(240, 240, 160);
ellipse(15 + width/3, 105, 15, 15);
fill(255);
quad(width/3, 120, width/3 - 10, 240, 40 + width/3, 240, 30 + width/3, 120);

//Base do Farol
fill(160, 115, 50);
rect(width/3 - 10, 240, 50, 40);

//Altura do Mar 2
fill(170, 215, 230);
rect(0, alturadomar, width, 3*height);

//Plano inclinado em que o Farol se encontra 
fill(50, 70, 75);
beginShape();
vertex(0, 250);
vertex(0, height);
vertex(width, height);
vertex(width, height-15);
endShape();

//Feixes de Luz
noStroke();
fill(240, 240, 160, 95);

//Condicionais que alteram os feixes de luz, bem como suas direçoes.
luz11= mouseX - height/6 ;
luz22= mouseX + height/2;
quad(0, luz11, 0, luz22, width/3, luz2, width/3, luz1);
quad(30+width/3, luz1, 30+width/3, luz2, width, luz22, width, luz11);
fill(255);
text(dan, 158, 295);
}

// Se o botão direito do mouse for pressionao, é possivel alterar a altura do nivel do mar
void mouseDragged() {
alturadomar= mouseY;
}
PFont font;
String dan= "Gabriel Nunes 2013";
