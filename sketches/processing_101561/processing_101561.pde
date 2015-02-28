
size (1300,700);
background (255,255,220);

fill (245,236,141);
rect (100,240,200,340);// esquerda 1

strokeWeight(3);
stroke(255);
fill (240,244,239);
rect (120,300,50,240);// janela 1
noFill  ();

strokeWeight(1);
stroke(0);
fill (245,236,141);
rect (270,300,390,280);// esquerda 2

fill (152,2,2);
rect (660,60,220,520);// direita 1
noFill();

fill (245,236,141);
rect (880,200,300,380);// direita 2

fill (255);
rect (270,350,430,20);// detalhe 1
rect (880,350,340,20);// detalhe 2

fill (240,244,239);
stroke(255);strokeWeight (4);
line (470,460,470,520);
ellipse (745,120,70,70); //janela redonda superior
ellipse (815,210,70,70); //janela redonda 2
noFill();

stroke(0);
strokeWeight (1);
fill(183,150,67);
rect (340,400,140,175);// porta
fill(255);
rect (440,250,370,30);// corrimão sacada
line (300,265,440,265);// corrimão

fill (6,193,88);
rect (30,582,1220,35);// chão

noStroke();
fill (90,195,203,100);
ellipse (40,80,200,80);
ellipse (250,100,250,90);
fill (90,197,190,120);
ellipse (400,30,300,100);
noFill();

strokeWeight(3);
stroke (255);
fill(238,242,237);
ellipse(410,440,45,45);
rect (445,410,21,140);

noStroke();
fill(106,65,0);
rect (35,560,5,30);
rect (1000,560,5,30);
rect (1100,560,5,30);
fill(6,215,88,100);
ellipse(35,528,40,70);
ellipse(30,530,30,50);
ellipse(980,515,50,70);
ellipse(1000,528,50,85);
ellipse(1100,500,80,130);
ellipse (1080,500,70,100);
