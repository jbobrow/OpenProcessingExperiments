
size(1200,700);

//Limusina
background (255,241,191);
stroke(255,247,216);
strokeWeight(2);
line (300,200,870,200);
line (270,300,900,300);
fill(250,232,172);
quad(-10,500,1210,500,1210,710,-10,710);
strokeWeight(10);
stroke(250,232,172);
//fill (154,250,241);
fill (14,18,201);
quad(-10,0,300,200,270,300,-10,330);
quad (870,200,1210,0,1210,330,900,300);

stroke(255,247,216);
fill (255,247,216);
ellipse (600,470,800,400);
quad (-10,400,600,300,600,620,-10,700);
quad (1210,400,600,300,300,620,1210,700);

//Edificios
fill(0);
stroke(0);
strokeWeight(1);
quad(877,205,900,295,940,297,940,203);
quad(940,297,940,180,990,180,990,303);
quad(990,250,990,303,1020,305,1020,250);
quad(1020,305,1020,270,1040,270,1040,307);

fill(255,188,0);
quad(920,220,930,220,930,230,920,230);
quad(920,240,930,240,930,250,920,250);
quad(900,270,910,270,910,280,900,280);

//Estrellas
strokeWeight(5);
stroke(255);
point(1100,150);
point(1120,125);
point(1150,180);
point(1180,50);
point(1160,100);
point(1150,145);
point(1190,120);
point(1120,90);
point(1070,125);
point(1040,180);
point(1020,140);
point(1185,160);
point(1060,160);


//Luna
pushMatrix();
translate(-100,-50);
fill(237,253,255);
strokeWeight(10);
stroke(237,253,255);
ellipse(160,200,100,100);
strokeWeight(25);
stroke(213,232,234);
point(200,200);
strokeWeight(20);
stroke(245,255,255);
point(202,200);

fill(237,253,255);
strokeWeight(15);
stroke(213,232,234);
point(180,180);
strokeWeight(10);
stroke(245,255,255);
point(180,178);
popMatrix();

pushMatrix();
translate(-150,-12);
fill(237,253,255);
strokeWeight(30);
stroke(213,232,234);
point(200,200);
strokeWeight(25);
stroke(245,255,255);
point(198,200);
popMatrix();

//Puente
stroke(0);
strokeWeight(10);
line(94,308,260,186);
strokeWeight(5);
line(94,305,88,310);
line(120,308,120,290);
line(150,304,150,270);
line(180,302,180,250);
line(210,298,210,230);
line(240,295,240,208);
line(266,290,266,187);

//Patas
pushMatrix();
strokeWeight(1);
stroke(41,35,39);
fill (41,35,39);
ellipse(420,620,120,90);
fill (60,50,56);
ellipse(400,550,170,190);
stroke(41,35,39);
fill (41,35,39);
triangle(333,610,380,680,400,650);
triangle(380,640,410,680,450,625);

stroke(41,35,39);
fill (41,35,39);
ellipse(780,620,120,90);
translate(400,0);
fill (60,50,56);
ellipse(400,550,170,190);
stroke(41,35,39);
fill (41,35,39);
triangle(333,610,380,680,400,650);
triangle(380,640,410,680,450,625);
popMatrix();

//Baston
fill(0,0,0);
quad(250,420,270,420,270,680,250,680);

//Brazos
fill (60,50,56);
quad(250,400,400,280,450,420,300,450);
strokeWeight(4);
fill(255,255,255);
ellipse(270,420,100,80);
line(265,435,260,458);
fill (60,50,56);
ellipse (790,380,190,210);

//Cuerpo
pushMatrix();
strokeWeight(3);
fill (60,50,56);
ellipse (600,430,550,450);
fill (88,84,86);
ellipse (600,450,310,410);
fill (41,35,39);
ellipse (600,450,200,410);
fill (255,255,255);
ellipse (600,420,200,320);

fill(0,0,0);
ellipse (600,460,20,20);
ellipse (600,510,20,20);
popMatrix();

//Lazo
pushMatrix();
translate(-200,-160);
strokeWeight(3);
stroke (209,38,41);
fill (222,63,65);
ellipse (840,560,80,80);
ellipse (760,560,80,80);
fill (193,35,38);
ellipse (800,560,60,60);
popMatrix();


//Cabeza
pushMatrix();
translate(-300, -200);
strokeWeight(3);
stroke (255,116,186);
fill (255,165,214);
triangle (1081,300,1030,300,1081,350);
triangle (740,320,760,220,812,265);
fill (255,193,224);
ellipse (900,420,400,350);

line (900,220,900,245);
line (880,220,884,245);
line (920,235,915,245);

//Orejas
triangle (756,300,760,220,812,265);
triangle (1000,260,1030,330,1081,300);

//Nariz
line(900,440,910,450);
line(890,440,880,450);

//Boca

stroke (245,141,191);
fill (255,175,214);
ellipse (900,525,200,130);

noStroke ();
fill (255,175,214);
ellipse (900,500,120,80);

fill (255,129,190);
ellipse (860,520,50,50);

fill (255,129,190);
ellipse (940,520,50,50);

//Ojo derecho
strokeWeight(2);
stroke (255,116,186);
fill (234,144,190);
ellipse(1000,400,170,100);

fill(255,255,255);
ellipse(1000,400,170,60);

strokeWeight(4);
stroke(4,180,102);
fill(8,206,118);
ellipse(1000,400,60,55);

fill(0,0,0);
ellipse(1000,400,30,30);

//Ojo izquierdo
strokeWeight(2);
stroke (255,116,186);
fill (234,144,190);
ellipse(800,400,170,100);

fill(255,255,255);
ellipse(800,400,170,60);

strokeWeight(4);
stroke(4,180,102);
fill(8,206,118);
ellipse(800,400,60,55);

fill(0,0,0);
ellipse(800,400,30,30);

popMatrix();
