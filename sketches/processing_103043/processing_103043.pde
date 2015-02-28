
// Trânsito de Curitiba - Caminhão Lixo que não é Lixo
//Autor: Bruno Veiga Miranda
//Disciplina : Algoritmos I - UTFPR - Curitiba/PR - BRASIL

PImage Prefeitura;
PImage Desenho;

void setup()
{
size(800,600);
background(193,224,245);
Prefeitura = loadImage("Prefeitura.jpg");
Desenho = loadImage("Desenho.jpg");
smooth();
}


void draw()
{
 
//Pista
fill(162,161,161);
rect(400,875,820,600); 
fill(255,250,98);
rect(120,600,75,10);
rect(420,600,85,10);
rect(700,600,85,10);
  
//Estrutura Caminhão
rectMode(CENTER);
fill(252,255,253);
rect(400,400,500,300,13);

//Rodas Caminhão
fill(18,17,17);
ellipse(600,560,100,100);
ellipse(600,560,80,80);
fill(5,5,5);
ellipse(600,560,40,40);
fill(18,17,17);
ellipse(240,560,100,100);
ellipse(240,560,80,80);
fill(5,5,5);
ellipse(240,560,40,40);

//linhas Caminhão
line(150,475,650,475);
line(150,480,650,480);

//Caçamba
fill(19,191,26);
quad(330,190,650,190,740,470,330,470);
fill(252,255,254);
rect(475,330,290,250);

//Parte da frente.
quad(150,260,330,260,330,420,110,420);
quad(110,420,330,420,330,510,115,510);

//Janela Motorista
fill(80,73,73);
quad(175,290,300,290,300,390,155,390);

//Parachoque frontal e laterais.
fill(19,191,26);
rect(145,530,80,40,4);

stroke(19,191,26);
strokeWeight(8);
noFill();
arc(600,565,110,110, radians(180),radians(360));
arc(240,565,110,110, radians(180),radians(360));
stroke(0);
strokeWeight(1);

stroke(19,191,26);
strokeWeight(4);
noFill();
line(113,422,118,508);
stroke(0);
strokeWeight(1);

//Trazendo as imagens
image(Prefeitura, 150, 425);
image(Desenho, 350, 250);

//Inserção dos textos
fill(26,25,25);
textSize(27);
text("LIXO QUE NÃO É LIXO",331,430);
fill(13,77,4);
textSize(29);
text("SE PA RE",400,380);

}


