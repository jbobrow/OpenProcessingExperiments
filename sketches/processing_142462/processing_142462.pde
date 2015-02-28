
size(500, 450);

background(254, 220, 27);

//RASCA

//Cercles fons (verd i carvaça)

stroke(98, 195, 154);fill(98, 195, 154);ellipse(250, 225, 400, 400);
fill(255, 202, 106);ellipse(250, 225, 285, 285);

//Dents

strokeWeight(3.5);stroke(0);fill(255);ellipse(244,149,15,15);ellipse(230,152,15,15);

//Orelles 

stroke(0);fill(103, 173, 222);ellipse(160, 60, 85, 85);

//Estructura de la cara

stroke(103, 173, 222);fill(103, 173, 222);bezier(150,152,190,152,235,148,255,138);
bezier(150,148,190,152,235,148,255,136);ellipse(187,142,15,15);
ellipse(150,125,75,25);ellipse(155,105,55,25);
bezier(173,47,120,100,115,120,117,134);bezier(173,47,165,60,160,70,142,100);
bezier(173,47,165,60,160,70,138,100);bezier(205,70,180,72,160,88,140,100);
bezier(200,70,200,72,180,88,150,100);bezier(200,70,200,72,180,88,140,100);
bezier(220,75,200,72,180,88,177,100);bezier(217,75,195,88,190,95,167,105);
ellipse(95, 120, 60, 60);

//Orella 1

stroke(0);ellipse(85, 110, 85, 85);

//Part inferior

stroke(0);ellipse(135, 160, 70, 70);ellipse(170, 175, 15, 15);
stroke(103, 173, 222);ellipse(137, 157, 67, 67);

//Boca

stroke(0);fill(0);ellipse(137, 162, 10, 10);ellipse(150, 162, 40, 15);
stroke(103, 173, 222);fill(103, 173, 222);ellipse(170, 162, 12,12);
stroke(0);fill(249,85,47);ellipse(170, 162, 5,5);fill(249,85,47);
ellipse(153, 164, 17, 10);ellipse(143, 164, 17, 10);
stroke(0);fill(255, 202, 106);ellipse(172, 163, 10,10);
stroke(255, 202, 106);ellipse(177, 163, 7.5,7.5);

//Cueta

stroke(0);fill(103, 173, 222);arc(111.5, 175, 45, 20, HALF_PI, PI);
line(88.5,173,110,175);

//Cabells

bezier(170,45,120,100,115,120,112,130);bezier(170,45,165,60,160,70,150,95);
bezier(210,65,180,72,160,88,150,95);bezier(210,65,200,72,180,88,175,90);
bezier(222,73,200,72,180,88,175,90);bezier(222,73,195,88,190,95,180,105);

//Morro

stroke(0);fill(103, 173, 222);bezier(175,155,190,154,235,150,255,140);
bezier(255,135,258,137,260,139,255,140);bezier(255,135,240,138,235,139,215,140);

//Ulls

fill(255);ellipse(191,120,32,32);ellipse(165,134,32,32);fill(0);
ellipse(188,124,5,5);ellipse(162,140,5,5);line(140,155,175,155);
fill(103, 173, 222);bezier(121,192,131,197,142,195,147,193);

//Nas

rotate(radians(330));fill(143,152,157);ellipse(108,222,30,20);

//Orella 1

rotate(radians(30));fill(103, 173, 222);stroke(0);ellipse(85, 110, 85, 85);

//Textos

PFont my_font;
my_font=loadFont("BerlinSansFBDemi-Bold-48.vlw");
textFont(my_font);

rotate(radians(330));
stroke(0);
fill(0);
textSize(48);
text("ITCHY& SCRATCHY", -122, 342);

fill(273, 46, 77);
text("ITCHY& SCRATCHY", -120, 340);

PFont my_font2;
my_font2=loadFont("BrushScriptMT-48.vlw");
textFont(my_font2);

stroke(0);
fill(0);
textSize(48);
text("The", -100, 280);
text("Show", -40, 405);


//PICA

rotate(radians(-330));

translate(-5, 35);

//Cara General

stroke(0);fill(114,118,121);
ellipse(378,310,130,105);ellipse(365,342,70,40);
stroke(114,118,121);ellipse(378,349,50,20);ellipse(392,335,30,20);
ellipse(380,304,126,105);

//Dents

stroke(0);
fill(255);bezier(297,300,295,343,298,343,325,310);
bezier(343,305,355,368,360,368,378,320);

rotate(radians(110));

//Llengua

rotate(radians(5));
fill(240,91,49);ellipse(160,-440,60,35);

//Moflete 1

rotate(radians(-5));
stroke(0);
fill(114,118,121);
ellipse(180,-400,35,55);
stroke(114,118,121);
ellipse(180,-415,20,40);ellipse(170,-415,20,40);


//Moflete 2

stroke(0);
fill(114,118,121);
rotate(radians(-5));ellipse(220,-420,35,55);
stroke(114,118,121);ellipse(210,-415,35,55);ellipse(215,-440,35,55);


//Ull 1

rotate(radians(250));
stroke(0);
fill(255,250,194);
ellipse(310,295,40,40);fill(0);ellipse(304,298,5,5);

//Nas

stroke(247,193,217);
fill(247,193,217);
stroke(0);
bezier(295,308,297,300,275,360,330,325);bezier(295,308,300,310,297,308,330,325);

//Ull 2

stroke(0);
fill(255,250,194);
ellipse(345,325,40,40);fill(0);ellipse(340,325,5,5);

//Retocs llengua i bigotis
fill(240,91,49);bezier(293,372,295,365,298,360,301,360);
fill(114,118,121);bezier(329,370,337,370,344,370,355,375);

//Voltant perpelles

fill(114,118,121);stroke(114,118,121);

bezier(306,265,300,275,310,280,330,286);
bezier(303,270,300,265,310,260,330,276);
bezier(345,290,330,288,340,300,400,345);
bezier(360,318,360,315,355,315,370,322);

bezier(320,270,327,290,328,290,340,305);

//Perpells ulls

stroke(0);fill(114,118,121);bezier(303,268,300,275,310,280,320,285);
bezier(303,270,300,265,310,260,330,272);
bezier(345,295,330,300,340,305,360,318);
fill(114,118,121,0);bezier(364,328,360,310,355,316,360,318);
fill(0);bezier(320,285,327,290,328,290,330,300);
stroke(114,118,121);fill(114,118,121);ellipse(371.8,323,10,10);
ellipse(365.5,312,11,10);ellipse(331,285,4,4);
ellipse(320,275,20,4);ellipse(340,280,40,12);

//Orella 1

stroke(114,118,121);
bezier(330,272,412,211,382,221,365,285);
stroke(0);
bezier(330,271,343,256,360,241,390,230);
fill(114,118,121,0);bezier(390,230,374,250,370,267,365,280);

//Orella 2

fill(114,118,121);stroke(114,118,121);
bezier(395,295,450,268,450,235,411,325);
stroke(0);
bezier(395,295,400,290,410,281,440,265);
fill(114,118,121,0);bezier(440,265,426,290,418,310,413.9,325);

//Cabells

stroke(114,118,121);
line(391,295,400,283);line(400,283,385,295);
line(383,290,390,278);line(390,278,378,291);
line(371,286,380,273);line(380,273,366,286);line(373,286,380,273);

stroke(0);
line(395,295,400,283);line(400,283,387,290);
line(387,290,390,278);line(390,278,377,286);
line(377,286,380,273);line(380,273,365,281);

//Retoc cuetes

fill(114,118,121);stroke(114,118,121);
line(440,340,400,353);line(440,340,400,359);ellipse(415,355,2,2);
line(400,361,430,370);line(400,365,430,370);line(400,369,430,370);
line(400,372,430,370);line(390,380,415,385);line(390,377,415,385);
line(390,374,415,385);

//Cuetes

fill(254, 220, 27);stroke(0);
bezier(414,325,405,350,420,345,440,340);
stroke(255);

fill(114,118,121);stroke(0);
line(440,340,410,360);line(410,360,430,370);
line(430,370,401,375);line(401,375,415,385);
line(415,385,388,385);



