
//Hander de Menezes Paiva
//17/11/2013
//Salvador,Bahia,Brasil

                                                     //Representação do Farol da Barra
size(800,600);
smooth();

  //Base do forte e solo
background(63,148,250);
line(0,580,800,580);//linha solo
fill(72,173,42);//verde
quad(0,480,0,600,800,600,800,480);//grama_base
fill(80,78,77);
quad(50,400,0,580,800,580,750,400);//forte_base
noFill();
line(40,580,80,400);//linha_coluna_esq
fill(255,222,222);
line(760,580,720,400);//linha_coluna_dir
line(66,460,34,460); // primeiro_tij_esq
line(734,460,766,460);//primeiro_tij_dir
line(750,530,785,530); // segundo_tij_dir
line(15,530,50,530); // segundo_tij_esq

//Farol e construcoes (superior)
fill(225,225,220);//torre_cor
quad(175,118,175,400,300,400,300,118);//farol
noFill();
fill(188,160,160);
quad(320,282,320,400,500,400,500,200); //loja
fill(71,72,23);
triangle(350,198,320,282,500,200); //loja_tentativa_3d_topo
fill(188,160,160);
rect(500,300,180,100);//casa
fill(71,72,23);
quad(530,250,500,300,680,300,700,250);//loja_tentativa_3d
noFill();
fill(188,160,160);
quad(680,300,680,400,700,400,700,250);//loja_3d

//Janelas
noFill();
quad(510,330,510,360,555,360,555,330);//janela1
quad(600,330,600,360,645,360,645,330); // janela2

point(370,360);//dirinf
point(328,290);//esqsup
point(370,290);//dirsup
point(328,360);//esqinf

quad(388,290,388,360,430,360,430,290);//janela4
quad(448,290,448,360,490,360,490,290);//janela3
quad(328,290,328,360,370,360,370,290);//janela5

line(349,290,349,360);//janela5_vertical
line(339,290,339,360);//janela5_vertical2
line(359,290,359,360);//janela5_vertical

line(469,290,469,360);//janela3_verticalMEIO
line(459,290,459,360);//janela3_vertical_esq
line(479,290,479,360);//janela3_vertical_dir

line(409,290,409,360);//janela4_vertical_MEIO
line(419,290,419,360);//janela4_vertical_dir
line(399,290,399,360);//janela4_vertical_esq
line(388,325,430,325);//janela4_horizontal_MEIO

line(448,325,490,325);//janela3_detail_2
line(328,325,370,325);//janela5_detail_2
line(349,290,349,360);//janela5_detail_vertical

//Detalhes farol
fill(0,0,0);
rect(175,99,125,19,180,180,1,1);//farol_base_luz
noFill();
fill(152,152,150);
rect(180,30,115,69,180,180,1,1);//farol_superior
fill(225,225,225);
arc(239,30,40,30,PI,PI+PI);//arco_sup
noFill();
quad(175,306,175,400,300,400,300,306);//linha1_farol
fill(0,0,0);//torrepartpreta
quad(175,200,175,310,300,310,300,200);//parte2_torre
fill(225,225,225);
rect(204,50,70,50,180,180,1,1);//farol_superior_2branco
fill(216,255,0);
rect(218,60,40,40,180,180,1,1);//farol_superior2
fill(108,101,101);

//Detalhes Forte(lateral)
rect(7,360,43,40,380,100,1,1);//ponta_forte
triangle(7,400,23,500,50,400);//triangulo_ponta
triangle(750,400,793,400,778,500);//triangulo_ponta_dir
rect(750,360,43,40,380,100,1,1);//ponta_reta_esquerda
rect(757,350,30,10,10,100,1,1);//ponta_reta_direita
triangle(757,350,787,350,772,330);//triangulo_ponta_dir
rect(14,350,30,10,10,100,1,1);//ponta_reta_esq
triangle(14,350,44,350,29,330);//triangulo_ponta_dir

//Janelas do Farol e Porta
fill(0,0,0);//linha_preta
quad(50,400,50,390,750,390,750,400);//linha_preta
fill(225,225,225);
stroke(115);
rect(208,130,60,60,180,180,1,1);//janela3_farol
rect(215,140,45,45,180,180,1,1);//janela3_farol

line(238,140,238,185);//linha_vertical_farol_janela3
line(216,165,260,165);//linha_horiz_farol_janela3

rect(208,230,60,60,180,180,1,1);//janela2_farol
line(238,230,238,290);//linha_vertical_farol_janela2
line(208,263,268,263);//linha_horiz_farol_janela2
stroke(77);
fill(152,152,150);
rect(208,330,60,59,180,180,1,1);//porta_farol
line(219,334,219,389);//porta_farol_ab
line(257,334,257,389);//porta_farol_ab2
line(238,331,238,389);

//Ceu
ellipseMode(CENTER);
fill(248,252,3);
noStroke();
ellipse(700,60,110,110);//sol
noStroke();
fill(245,245,237);
ellipse(500,60,90,40);//nuvens
ellipse(440,60,90,40);//nuvens
ellipse(560,60,90,40);//nuvens






