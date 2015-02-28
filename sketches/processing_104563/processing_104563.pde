
void setup() {
    size (750,550);
    background(#85C7FC);}

void draw()  { 
/*CHÃO*/
  fill(154,149,136);
quad(0,400,750,400,750,550,0,550);
  noStroke();
  fill(200);
triangle(274,400,340,550,210,550);

/*CASTELO - TELHADO PRINCIPAL*/
  stroke(255);
  strokeWeight(2);
  fill(30,30,30);
quad(148,158,148,265,585,265,585,158);
  
  stroke(0);//TELHADO PRINCIPAL - detalhes de parede
  strokeWeight(4);
  fill(221,198,89);
triangle(331,263,385,263,358,240);
triangle(388,263,442,263,415,240);
triangle(445,263,499,263,471,240);

quad(241,244,311,244,311,265,241,265); //DETALHES ACIMA DA PORTA E JANELA PRINCIPAIS
arc(276,247,70,60,PI,TWO_PI,OPEN);
line(230,263,322,263);
  stroke(180,164,53);
  strokeWeight(6);
  noFill();
arc(276,244,56,40,PI,TWO_PI,OPEN);
  fill(180,164,53);
quad(247,245,257,245,257,257,247,257);
quad(295,245,305,245,305,257,295,257);

/*CASTELO - ESTRUTURAS DA PAREDE*/
  stroke(180,164,53);
  fill(221,198,89);
  strokeWeight(1);
quad(148,265,585,265,585,459,148,459); //FRENTE MAIOR

quad(66,265,93,265,93,481,66,470);//TORRE ESQUERDA
quad(93,265,191,265,191,481,93,481);
quad(191,265,218,265,218,470,191,481);

ellipse(623,465,156,34);//TORRE DIREITA 
  noStroke();
quad(545,468,701,468,701,196,545,196);
  noFill();
  stroke(180,164,53);
line(700,205,700,468);
  strokeWeight(2);
arc(626,190,233,60,radians(50),radians(135),OPEN);//TORRE DIREITA - DETALHES
arc(626,200,233,60,radians(50),radians(135),OPEN);
arc(626,210,233,60,radians(50),radians(135),OPEN);
  
  fill(221,198,89);//TORRE "MEIO"
  strokeWeight(1);
quad(501,259,574,259,574,476,501,476);

/*LINHAS DETALHAMENTO PAREDES - REPETIÇÃO*/
for (int TE1 = 265; TE1 < 459; TE1 = TE1+7) {
  line(66, TE1, 93, TE1+9);
}
for (int TE2 = 267; TE2 < 459; TE2 = TE2+7) {
  line(93, TE2, 191, TE2);
}
for (int TE3 = 265; TE3 < 459; TE3 = TE3+7) {
  line(191, TE3+9, 218, TE3);
}
for (int FR = 265; FR < 459; FR = FR+7) {
  line(218, FR, 500, FR);
}
for (int TM = 260; TM < 459; TM = TM+7) {
  line(501, TM, 574, TM);
}

/*CASTELO - OUTROS TELHADOS*/
  stroke(255);
  strokeWeight(2);
  fill(30);
triangle(57,265,91,272,139,143);//TORRE ESQUERDA
triangle(91,272,194,272,142,141);
triangle(194,272,227,265,145,143);
triangle(497,259,580,259,538,199); //TORRE MEIO

  stroke(255);//TORRE DIREITA
  fill(30);
ellipse(623,197,162,30);
  noStroke();
triangle(624,15,542,197,705,197);
  strokeWeight(1);
  stroke(255);
line(624,15,542,197);
line(624,15,554,205);
line(624,15,572,209);
line(624,15,593,211);
line(624,15,617,212);
line(624,15,645,211);
line(624,15,668,209);
line(624,15,685,206);
line(624,15,699,203);
line(624,15,704,197);

/*JANELAS EM TELHADOS*/
  stroke(225);
  fill(225);
quad(368,191,404,191,404,233,368,233);//TELHADO PRINCIPAL
    triangle(368,191,404,191,386,169);
quad(425,191,461,191,461,233,425,233);
    triangle(425,191,461,191,443,169);
    
quad(607,128,642,128,642,168,607,168);//TORRE DIREITA
    triangle(607,128,642,128,624,104);
triangle(553,128,574,128,553,173);
triangle(675,128,696,128,695,173);

//JANELAS EM TELHADOS - vidros
  int a=375;
  int b=398;
  int c=432;
  int d=455;
  int e=614;
  int f=636;
  fill(0);
quad(a,193,b,193,b,227,a,227);
quad(c,193,d,193,d,227,c,227);
quad(e,128,f,128,f,162,e,162);

//JANELAS - divisão vidros
  stroke(255);
line(a,204,b,204);
line(a,216,b,216);
line(386,193,386,229);
line(c,204,d,204);
line(c,216,d,216);
line(443,193,443,229);
line(e,139,f,139);
line(e,151,f,151);
line(624,127,624,162);

//JANELAS - telhados
  fill(0);
quad(548,130,573,130,581,110,553,110);//laterais
quad(676,130,702,130,696,110,667,110);
  strokeWeight(5);//frontais
  stroke(0);
  int g=193;
  int h=167;
  int i=127;
  int j=101;
line(365,g,386,h);
line(407,g,386,h);
line(422,g,443,h);
line(464,g,443,h);
line(605,i,624,j);
line(644,i,624,j);

/*TORRE ESQUERDA - DETALHE DE PAREDE*/
noStroke();
fill(221,198,89);
triangle(109,265,144,236,179,265);
quad(109,265,179,265,179,275,109,275);
strokeWeight(4);//telhado
stroke(0);
line(108,265,144,235);
line(144,235,180,265);

strokeWeight(4);//concreto em relevo
stroke(180,164,53);
line(114,275,114,270);
line(144,242,114,267);
line(144,242,174,267);
line(174,275,174,270);

/*PORTAS*/
strokeWeight(2);
stroke(255);
fill(0);
quad(115,403,170,403,170,480,115,480);//TORRE ESQUERDA
  arc(143,403,55,46,PI,TWO_PI,OPEN);
  int k=396;
  int l=459;
quad(341,k,377,k,377,l,341,l);//FRONTAL
arc(359,k,36,46,PI,TWO_PI,OPEN);
quad(398,k,434,k,434,l,398,l);
arc(416,k,36,46,PI,TWO_PI,OPEN);
quad(398,k,434,k,434,l,398,l);
arc(416,k,36,46,PI,TWO_PI,OPEN);
quad(455,k,491,k,491,l,455,l);
arc(473,k,36,46,PI,TWO_PI,OPEN);

arc(275,k+1,55,46,PI,TWO_PI,OPEN);//PORTA PRINCIPAL
  fill(255);
quad(247,k,302,k,302,l,247,l);
  fill(0);
quad(252,399,273,399,273,437,252,437);
quad(278,399,298,399,298,437,278,437);

  fill(255);//DETALHES BRANCOS
  int m=359;
  int n=417;
  int o=474;
  int p=144;
  int q=276;
line(m,374,m,438);
line(347,382,m,397);
line(372,382,m,397);
line(n,374,n,438);
line(405,382,n,397);
line(429,382,n,397);
line(o,374,o,438);
line(462,382,o,397);
line(486,382,o,397);
line(p,382,p,461);//porta torre esquerda
line(125,387,p,404);
line(159,387,p,404);
line(q,400,q,376);//porta principal
line(258,382,q,398);
line(293,382,q,398);

  strokeWeight(1);
quad(342,439,377,439,377,459,342,459);
quad(399,439,435,439,435,459,399,459);
quad(456,439,492,439,492,459,456,459);
quad(116,461,170,461,170,481,116,481);

  int r=411;//divisão vidros portas
  int s=425;
line(252,r,300,r);//principal
line(252,s,300,s);
line(262,396,262,437);
line(289,396,289,437);
line(342,r,378,r);//auxiliar 1
line(342,s,378,s);
line(351,396,351,437);
line(369,396,369,437);
line(399,r,435,r);//auxiliar 2
line(399,s,435,s);
line(407,396,407,437);
line(426,396,426,437);
line(456,r,492,r);//auxiliar 3
line(456,s,492,s);
line(464,396,464,437);
line(483,396,483,437);
line(116,423,171,423);//torre esquerda
line(116,443,171,443);
line(130,403,130,461);
line(158,403,158,461);

  stroke(180); //DETALHES INFERIORES DA PORTA (AQUI EM CINZA);
  noFill();
quad(120,466,140,466,140,477,120,477);//torre esquerda
quad(147,466,167,466,167,477,147,477);
quad(253,443,272,443,272,458,253,458);//principal
quad(279,443,297,443,297,458,279,458);
quad(345,442,357,442,357,458,345,458);//auxiliar 1
quad(363,442,375,442,375,458,363,458);
quad(401,442,414,442,414,458,401,458);//auxiliar 2
quad(420,442,432,442,432,458,420,458);
quad(459,442,471,442,471,458,459,458);
quad(477,442,489,442,489,458,477,458);

  stroke(180,164,53);//CONCRETO EM RELEVO PROXIMO DAS PORTAS
  strokeWeight(8);
  noFill();
arc(143,400,66,52,PI,TWO_PI,OPEN);//TORRE ESQUERDA
arc(275,392,83,70,PI,TWO_PI,OPEN);//FRONTAL
arc(275,392,64,50,PI,TWO_PI,OPEN);
  
arc(359,392,50,50,PI,TWO_PI,OPEN);//AUXILIARES
arc(416,392,50,50,PI,TWO_PI,OPEN);
arc(473,392,50,50,PI,TWO_PI,OPEN);

  strokeWeight(2);
  fill(234,218,137);
quad(240,394,245,394,245,438,240,438);//FRONTAL
quad(238,438,247,438,247,461,238,461);
quad(304,394,309,394,309,438,304,438);
quad(302,438,311,438,311,461,302,461);
quad(230,394,235,394,235,439,230,439);
quad(228,439,237,439,237,465,228,465);
quad(314,394,319,394,319,439,314,439);
quad(312,439,321,439,321,465,312,465);

quad(323,395,338,395,338,437,323,437);
quad(381,395,394,395,394,437,381,437);
quad(438,395,451,395,451,437,438,437);
quad(495,395,500,395,500,437,495,437);

quad(219,440,227,440,227,459,219,459);
quad(323,440,338,440,338,459,323,459);
quad(381,440,394,440,394,459,381,459);
quad(438,440,451,440,451,459,438,459);
quad(495,440,500,440,500,459,495,459);

quad(107,403,113,403,113,462,107,462);//TORRE ESQ
quad(173,403,179,403,179,462,173,462);
quad(94,462,67,453,67,472,94,482);
quad(113,462,94,462,94,482,113,482);
quad(192,462,173,462,173,482,192,482);
quad(218,453,218,471,192,482,192,462);

quad(501,453,574,453,574,476,501,476);//TORRE MEIO

/*JANELAS DAS PAREDES*/
stroke(255);
fill(0);
quad(116,279,173,279,173,352,116,352);//TORRE ESQ
  line(145,279,145,352);
  line(116,295,173,295);
  
  int t=271;
  int u=344;
  int v=286;
quad(241,t,312,t,312,u,241,u);//FRONTAL
  line(259,t,259,u);
  line(292,t,292,u);
  line(241,v,312,v);
quad(340,t,378,t,378,u,340,u);
  line(359,t,359,u);
  line(340,v,378,v);
quad(397,t,435,t,435,u,397,u);
  line(416,t,416,u);
  line(397,v,435,v);
quad(453,t,491,t,491,u,453,u);
  line(472,t,472,u);
  line(453,v,491,v);
quad(518,266,559,266,559,341,518,341);//TORRE MEIO
  line(539,267,539,341);
  line(518,281,559,281);
quad(518,364,559,364,559,440,518,440);
  line(539,364,539,440);
  line(518,379,559,379);
quad(604,257,645,257,645,332,604,332);//TORRE DIREITA
  line(625,257,625,332);
  line(604,272,645,272);
quad(604,360,645,360,645,443,604,443);//TORRE DIREITA
  line(625,360,625,443);
  line(604,375,645,375);
  
/*DETALHE FINAL TORRE DIREITA*/
strokeWeight(1);
stroke(234,218,137);
fill(180,164,53);
quad(595,240,602,240,602,480,595,480);
    for (int TD1 = 240; TD1 < 480; TD1 = TD1+7) {
    line(595, TD1, 602, TD1);}
quad(647,240,654,240,654,480,647,480);
    for (int TD2 = 240; TD2 < 480; TD2 = TD2+7) {
    line(647, TD2, 654, TD2);}
quad(693,235,699,233,699,467,693,471);
    for (int TD3 = 240; TD3 < 467; TD3 = TD3+7) {
    line(693, TD3, 699, TD3-3);}

/*HOLOFOTES DA FRENTE*/
  stroke(0);
  fill(0);
ellipse(105,487,10,5);
ellipse(182,487,10,5);
ellipse(232,470,10,5);
ellipse(316,470,10,5);
ellipse(316,470,10,5);
ellipse(388,464,10,5);
ellipse(445,464,10,5);
ellipse(505,483,10,5);
ellipse(575,483,10,5);
ellipse(675,483,10,5);

if(mouseY>=250) {
  noStroke();
  fill(255,100);
quad(102,487,109,487,120,210,94,210); 
quad(179,487,186,487,196,210,170,210); 
quad(230,470,235,470,253,270,220,270);
quad(314,470,319,470,331,270,300,270);
quad(314,470,319,470,331,270,300,270);
quad(386,464,391,464,409,270,370,270);
quad(443,464,448,464,463,270,424,270);
quad(502,483,508,483,528,160,488,160);
quad(573,483,579,483,596,150,552,150);
quad(672,483,678,483,697,150,650,150);
}
  
/*ANOITECER*/
noStroke ();
  for (int z=0; z<100; z=z+200) {
    frameRate(10);
    fill (#050019,8);
    rect (0, 0, 750, 550); }
    
}
