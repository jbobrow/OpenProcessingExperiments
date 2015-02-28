
//Lourainy Agustinho
//15-11-2013
//Curitiba,Parana,Brasil.

size(450, 350);
background(73, 201, 232);
fill(124,211,130);
stroke(123,222,130);
rect(0,300,450,100);//grama

fill(255,255,103);
stroke(255,255,180);
ellipse(130,50,80,80);//sol

stroke(206,234,255);
fill(170,219,255); 
ellipse(170,80,180,60);//ceu
ellipse(36,55,160,60);

fill(225, 225, 225);
stroke(139, 152, 155);
strokeWeight(3);

rect(180, 120, 80, 110, 25, 25, 0, 0);  //parte 1 de cima
rect(262, 120, 80, 115, 25, 25, 0, 0);  //parte 2 de cima
rect(343, 120, 80, 110, 25, 25, 0, 0);  //parte 3 de cima

fill(227, 227, 227);
stroke(118, 129, 121);
strokeWeight(4);
rect(165, 230, 280, 270, 25, 25, 0, 0);  //parte principal baix

stroke(152, 135, 135);
strokeWeight(2);
line(165, 270, 445, 270); //linha que corta a part. principal

fill(227, 224, 224);
stroke(152, 135, 135);
strokeWeight(2);
rect(250, 275, 115, 150, 60, 60, 0, 0);//abertura do meio parte princ baix
rect(255, 280, 105, 150, 60, 60, 0, 0);
rect(260, 285, 95, 140, 60, 60, 0, 0);
rect(265, 290, 85, 130, 60, 60, 0, 0);

stroke(160, 155, 155);
rect(173, 280, 65, 150, 50, 50, 0, 0); //abertura esq baix
rect(375, 280, 65, 150, 50, 50, 0, 0); //abertura dir baix

rect(277, 165, 50, 63, 50, 50, 0, 0); //abertura cima principal
rect(197, 165, 50, 63, 50, 50, 0, 0); //abertura esq cim
rect(358, 165, 50, 63, 50, 50, 0, 0); //abertura dir cim


stroke(152, 135, 135);
strokeWeight(2);
line(180, 164, 422, 164); 
line(254, 305, 361, 305);

strokeWeight(1.7);
rect(288, 309, 40, 309, 2, 2, 0, 0);  //porta


rect(178, 285, 55, 100, 50, 50, 0, 0);//arco medio esq
rect(183, 290, 45, 100, 50, 50, 0, 0);//arco peq esq
rect(188, 295, 35, 100, 50, 50, 0, 0);//porta
line(173, 305, 238, 305);
float yTop=400;
float yDown=306;
line(308, yTop, 308, yDown);

rect(380, 285, 55, 100, 50, 50, 0, 0); //arco medio dirt
rect(385, 290, 45, 100, 50, 50, 0, 0);//arco peq dirt
rect(390, 295, 35, 100, 50, 50, 0, 0);//porta 
line(375, 305, 440, 305);
line(205, yTop, 205, yDown);
line(407, yTop, 407, yDown);

rect(363, 170, 40, 58, 50, 50, 0, 0); //arco medio dir
rect(368, 175, 30, 53, 50, 50, 0, 0);//arco peq dir
rect(373, 180, 20, 48, 50, 50, 0, 0);// arco mto peq dirt
strokeWeight(1.8);
line(358, 190, 408, 190);

rect(202, 170, 40, 58, 50, 50, 0, 0);//arc medio esq
rect(207, 175, 30, 53, 50, 50, 0, 0);//arco peq esq
rect(212, 180, 20, 48, 50, 50, 0, 0);//arco mto peq esq
strokeWeight(1.8);
line(198, 190, 247, 190);

rect(282, 170, 40, 58, 50, 50, 0, 0);//arco central medio cim
rect(287, 175, 30, 53, 50, 50, 0, 0);//arco cent peq cim
rect(292, 180, 20, 48, 50, 50, 0, 0);//acco cent mto peq cim
strokeWeight(1.8);
line(278, 190, 327, 190);

float xTop=165;// linhas de cim
float zDown=230;
line(302, xTop, 302, zDown);//cent
line(222, xTop, 222, zDown);//esq
line(383, xTop, 383, zDown);//dit

float mTop=233;//linhas de baix xadrez
float mDown=270;
line(180, mTop, 180, mDown);
line(200, mTop, 200, mDown);
line(220, mTop, 220, mDown);
line(240, mTop, 240, mDown);
line(260, mTop, 260, mDown);
line(280, mTop, 280, mDown);
line(300, mTop, 300, mDown);
line(320, mTop, 320, mDown);
line(340, mTop, 340, mDown);
line(360, mTop, 360, mDown);
line(380, mTop, 380, mDown);
line(400, mTop, 400, mDown);
line(420, mTop, 420, mDown);
line(438, mTop, 438, mDown);

line(168, 240, 443, 240);//linhas baix
line(168, 250, 443, 250);
line(168, 260, 443, 260);
//linhas cim
line(185, 130, 255, 130); 
line(265, 130, 338, 130);
line(348, 130, 420, 130);

line(180, 140, 423, 140); 
line(180, 153, 423, 153);

float kTop=122;
float kDown=164;
line(190,kTop,190,kDown); //linhas cim xadrez
line(205,kTop,205,kDown);
line(220,kTop,220,kDown);
line(235,kTop,235,kDown);
line(250,kTop,250,kDown);

line(275,kTop,275,kDown);
line(290,kTop,290,kDown);
line(305,kTop,305,kDown);
line(320,kTop,320,kDown);
line(332,kTop,332,kDown);

line(355,kTop,355,kDown);
line(370,kTop,370,kDown);
line(385,kTop,385,kDown);
line(400,kTop,400,kDown);
line(413,kTop,413,kDown);

fill(126,95,43);
stroke(178,147,97);
strokeWeight(2);
rect(35,250,10,100,5,5,5,5);

fill(134,237,171);
stroke(134,237,171);
ellipse(55,255,50,50);

fill(100,180,130);
stroke(100,180,130);
ellipse(35,240,65,65);

fill(43,142,78);
stroke(43,142,78);
ellipse(25,260,50,50);
