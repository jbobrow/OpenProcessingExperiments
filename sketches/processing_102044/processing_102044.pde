
size(600,400);
rectMode (CENTER);
//horizonte
line(0,150,600,150);
//rua lado esquerdo
line(250, 150, 100, 400);
//rua lado direito
line(350, 150, 500, 400);
//linhas rua
line (300, 180, 300, 200);
line (300, 300, 300, 345);
line (300, 230, 300, 260);
//poste e sinaleiro
line (350, 150, 350, 50); 
rect (350,50,20,50);
//sinais
fill (255,0,0);
ellipse (350,35,12,12);
fill (255,243,3);
ellipse (350,50,12,12);
fill (0,255,0);
ellipse (350,65,12,12);
//pseudo carro
fill (0,0,0);
ellipse (405,370,20,30);
ellipse (335,370,20,30);
fill (0,0,255);
rect (370,315,90,100);
fill (0,0,0);
rect (370,300,80,40);
//faróis do carro
fill (255,0,0);
rect (335,350,10,20);
rect (405,350,10,20);
