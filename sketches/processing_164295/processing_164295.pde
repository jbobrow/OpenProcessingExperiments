
size(500,500);
background(255);

fill(211,172,121);
strokeWeight(7);
ellipseMode(CENTER);

arc(250,239,250,125,0,PI);

noStroke();
fill(81,64,48);
ellipse(110,160,100,110);
ellipse(390,160,100,110);

fill(211,172,121);
stroke(0);
arc(250,145,250,125,PI,2*PI); //front

fill(81,64,48);
bezier(125,215,110,275,30,170,60,140); //oreja derecha
bezier(60,140,105,100,80,100,145,111);

bezier(375,215,390,275,470,170,440,140); //oreja izquierda
bezier(440,140,395,100,420,100,355,111);

fill(211,172,121);
noStroke();
rect(125,145,250,95); //relleno cara

fill(81,64,48);

noStroke();
bezier(215,230,230,130,230,100,110,170); //manchas ojos
bezier(390,170,270,100,270,130,285,230);

noStroke();
bezier(145,111,145,120,150,160,125,200);
ellipse(135,140,40,52);

bezier(355,111,355,120,350,160,375,200);
ellipse(365,140,40,52);

stroke(0);
strokeWeight(7);
line(125,240,125,150);
line(375,240,375,150);

fill(81,64,48);
noStroke();
ellipse(250,250,175,100); //morro

fill(255);
stroke(0);
strokeWeight(3);
ellipse(170,200,85,85); //ulls
ellipse(330,200,85,85);

fill(0);
noStroke();
ellipse(165,205,60,60); //pupil·la
ellipse(335,205,60,60);

ellipse(250,230,60,35); //nas

noFill();
stroke(0);
bezier(180,250,220,320,240,255,245,255); //boca
bezier(320,250,280,320,260,255,255,255);
bezier(245,255,247,253,250,247,255,255);

strokeWeight(0.5);
ellipse(210,250,5,5);
ellipse(200,260,5,5);
ellipse(220,255,5,5);
ellipse(290,250,5,5);
ellipse(300,260,5,5);
ellipse(280,255,5,5);
