
//Lucas Butschkau Vidal 18/11 - Curitiba/PR - Brasil
size(1300,700);
background(0,150,200);
//Calçada
rectMode(CORNERS);
fill(190);
rect(0,650,1300,700);
//Frente
fill(150,110,50);
rect(100,500,1200,650);
rectMode(CORNERS);
fill(170,130,75);
rect(450,500,850,580);
rect(500,580,800,650);
line(500,640,800,640);//degrau 1
line(510,630,790,630);//degrau 2
line(510,620,790,620);//degrau 2
line(520,610,780,610);//degrau 3
line(520,600,780,600);//degrau 3
line(530,590,770,590);//degrau 4
line(530,580,770,580);//degrau 4
line(500,640,510,630);//borda esq. escada - sentido baixo/cima
line(510,630,510,620);//borda esq. escada - sentido baixo/cima
line(510,620,520,610);//borda esq. escada - sentido baixo/cima
line(520,610,520,600);//borda esq. escada - sentido baixo/cima
line(520,600,530,590);//borda esq. escada - sentido baixo/cima
line(530,590,530,580);//borda esq. escada - sentido baixo/cima
line(530,580,540,570);//borda esq. escada - sentido baixo/cima
line(800,640,790,630);//borda dir. escada - sentido baixo/cima
line(790,630,790,620);//borda dir. escada - sentido baixo/cima
line(790,620,780,610);//borda dir. escada - sentido baixo/cima
line(780,610,780,600);//borda dir. escada - sentido baixo/cima
line(780,600,770,590);//borda dir. escada - sentido baixo/cima
line(770,590,770,580);//borda dir. escada - sentido baixo/cima
line(770,580,760,570);//borda dir. escada - sentido baixo/cima
stroke(170,130,75);
line(501,580,529,580);
line(799,580,771,580);
stroke(0);
line(500,580,540,570);
line(800,580,760,570);
line(450,570,850,570);

rectMode(CORNERS);
fill(200);
rect(100,400,1200,500);//1ª fachada cinza baixo/cima
rect(100,100,1200,400);//2ª fachada cinza baixo/cima
rect(200,90,1100,100);//3ª fachada cinza baixo/cima
rect(200,70,1100,90);//4ª fachada cinza baixo/cima
triangle(200,70,650,0,1100,70);//triangulo do topo
stroke(200);
line(206,70,1094,70);//linha que esconde a base do triangulo
stroke(0);
strokeWeight(2);
triangle(300,70,650,15,1000,70);//triangulo de dentro
strokeWeight(1);
fill(0,200,230);
rect(200,150,1100,400);
line(200,100,200,400);
line(1100,100,1100,400);
line(100,150,1200,150);//dá para colocar uma função de repetição!
line(100,150,1200,150);
line(100,200,1200,200);
line(100,250,1200,250);
line(100,300,1200,300);
line(100,350,1200,350);//até aqui
line(250,150,250,400);
line(300,150,300,400);
line(350,150,350,400);
line(400,150,400,400);
line(450,150,450,400);
line(500,150,500,400);
line(550,150,550,400);
line(600,150,600,400);
line(650,150,650,400);
line(700,150,700,400);
line(750,150,750,400);
line(800,150,800,400);
line(850,150,850,400);
line(900,150,900,400);
line(950,150,950,400);
line(1000,150,1000,400);
line(1050,150,1050,400);
rectMode(CENTER);
fill(200);
strokeWeight(2);
rect(650,450,600,80);
textSize(20);
fill(0);
text("JESUS CRISTO É O SENHOR",510,435);
text("IGREJA UNIVERSAL DO REINO DE DEUS",460,470);
rectMode(CENTER);
fill(170,130,75);
rect(650,550,80,40);
line(650,530,650,570);
line(640,545,640,555);
line(660,545,660,555);
