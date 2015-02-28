
/*Nome:Lucas Eduardo Gonçalves
Data de criação:15/11/2013
Curitiba/PR-Brasil*/
size (600,600);
background(#494F67);

fill(#523511);             //solo
noStroke();
rect(0,500,600,100);

fill(250,238,5);         //base do olho
stroke(0);
rectMode(CENTER);
rect(300,440,150,180);

fill(255); //olho
arc(300,280,790,250,QUARTER_PI,PI-QUARTER_PI,OPEN);
arc(300,469,640,400,PI+PI/6,TWO_PI-PI/6,OPEN);
fill(#000A5F);
arc(300,280,755,243,QUARTER_PI,PI-QUARTER_PI,OPEN);
arc(300,459,615,372,PI+PI/6,TWO_PI-PI/6,OPEN);

stroke(0); //detalhes do olho
line(60,373,120,308);
line(90,380,60,345);
line(90,383,166,291);
line(120,387,78,330);
line(120,387,207,280);
line(153,391,100,318);
line(150,391,245,275);
line(185,395,125,308);
line(180,395,280,273);
line(220,397,150,297);
line(213,397,313,274);
line(252,400,180,290);
line(245,400,346,275);
line(288,401,210,282);
line(278,401,378,280);
line(324,401,240,278);
line(315,401,407,285);
line(360,400,272,275);
line(350,400,435,294);
line(399,396,302,273);
line(387,396,462,304);
line(435,390,335,273);
line(425,390,488,313);
line(470,388,375,280);
line(460,388,510,325);
line(504,378,420,290);
line(500,378,530,338);
line(534,373,465,302);
line(534,373,548,350);

fill(#FFA908);//detalhes do ceu
ellipse(500,50,75,75);
fill(#868383,200);
noStroke();
ellipse(200,70,400,70);
ellipse(400,80,400,70);
ellipse(400,40,400,70);
