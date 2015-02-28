
//Planta Básica
//Erich M. Zimmermann
//Arquitetura e Urbanismo
//Computação I: P1

//Escala: 1px = aprox. 1cm

//Iniciais
size(1280, 565);
background(175);

strokeCap(SQUARE);
strokeWeight(3);
noSmooth();

//Variáveis
int m = 65;

//Cômodos
rect(m, m, 150, 400); //cozinha
rect(m+150, m, 250, 400); //sala
rect(m+150+250, m, 250, 260); //quarto 1
rect(m+150+500, m, 250, 260); //quarto 2
rect(m+150+750, m+50, 250, 390); //quarto 3
rect(m+150+250, m+260, 250, 140); //corredor
rect(m+150+500, m+260+80, 250, 100); //banheiro

noStroke();
rect(m+150+497, m+262, 252, 77); //preenchimento corredor

//Portas?
stroke(255);
line(m+150+5, m+400, m+150+5+65, m+400); //porta sala
line(m+150+250, m+262, m+150+250, m+260+80); //arco corredor
line(m+150, m+270, m+150, m+270+65); //porta cozinha
line(m+150+250+180, m+260, m+150+250+180+65, m+260); //porta quarto 1
line(m+150+250+180+65+5+5, m+260, m+150+250+180+65+5+5+65, m+260); //porta quarto 2
line(m+150+250+180+65+5+5, m+260+80, m+150+250+180+65+5+5+65, m+260+80); //porta banheiro
line(m+150+250+250+250, m+50+210+7, m+150+250+250+250, m+50+210+5+68); //porta quarto 3

//Etc.
stroke(0);
line(m, m+145, m+60, m+145); //divisória área

//Texto
fill(0);
PFont font;
font = loadFont("ArialNarrow-18.vlw");
textFont(font, 18);
textAlign(CENTER);

text("COZINHA", m+75, m+145+128);
text("SERVIÇO", m+75, m+74);
text("SALA", m+150+125, m+200);
text("QUARTO", m+150+250+125, m+130);
text("QUARTO", m+150+250+250+125, m+130);
text("QUARTO", m+150+250+250+250+125, m+50+195);
text("BANHEIRO", m+150+250+250+125, m+260+80+55);
text("CORREDOR", m+150+250+125, m+260+70);

//Crédito
textAlign(LEFT);
text("Erich Zimmermann – Computação I – Escala: 1px = aprox. 1cm", m, m+400+40);
