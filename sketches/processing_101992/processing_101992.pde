
size(500,500);
//calçada
rectMode(CORNER);
fill(54,54,54);
rect(0,50,45,400);
//faixa de pedestres
for (int x=50; x<=170; x+=15) {
fill(250,250,250);
rectMode(CORNER);
rect(x,50,10,50);
}
//calçada
rectMode(CORNER);
fill(54,54,54);
rect(185,50,45,400);
//faixa de pedestres
for (int x=235; x<=425; x+=15) {
fill(250,250,250);
rectMode(CORNER);
rect(x,50,10,50);
}
//calçada
rectMode(CORNER);
fill(54,54,54);
rect(430,50,45,400);
//tubo
rectMode(CORNER);
fill(108,123,139);
rect(15,230,40,80,10);
//tubo2
rectMode(CORNER);
rect(175,290,40,80,10);
//onibus1
rectMode(CORNER);
fill(255,69,0);
rect(60,200,45,160,5);
//onibus2
rectMode(CORNER);
rect(130, 120, 45,160,5);
//linha divisão onibus
rectMode(CORNER);
fill(255,215,0);
rect(115,110,5,400);
//carro 1
rectMode(CORNER);
fill(0,0,139);
rect(240, 115, 30, 50, 7);
//carro 2
rectMode(CORNER);
fill(139,139,131);
rect(245, 175, 30, 50, 7);
//carro 3
rectMode(CORNER);
fill(0,0,0);
rect(238, 235, 30, 50, 7);
//carro 4
rectMode(CORNER);
fill(139,139,131);
rect(283, 110, 30, 50, 7);
//carro 5
rectMode(CORNER);
fill(0,0,0);
rect(287, 190, 30, 50, 7);
//carro 6
rectMode(CORNER);
fill(139,0,0);
rect(286, 280, 30, 50, 7);
//taxi
for (int x=120; x<=230; x+=55) {
fill(238,64,0);
rect(395, x, 30, 50, 7);
}
