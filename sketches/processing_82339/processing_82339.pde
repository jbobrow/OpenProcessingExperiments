
size (800,500);
smooth();
background (0);


// manche marron: il devait être caché derrière le blanc, alors la forme c'est placé avant toutes les autres.
noStroke();
fill (88,25,4);

rect (535,110,135,200);
rect (563,310,135,100);
rect (710,360,20,50);

arc (630, 410, 200, 20, 0, PI);
arc (727,353,20,115,0,PI);

ellipse (712,340,50,150);

triangle (680,110,530,410,730,410);


//on va former des ellipses blanches sur un fond noir
fill (255);
stroke (255);
noFill();
stroke (255);
ellipse (50,50,10,10);
ellipse (57,45,5,5);
ellipse (62,51,7,7);
ellipse (50,70,21,21);
ellipse (50,100,21,21);

//ellipse du chargeur du revolver ligne supérieur
noFill();
stroke (255);
ellipse (310,97,7,7);
ellipse (320,97,7,7);
ellipse (330,97,7,7);
ellipse (340,97,7,7);
ellipse (350,97,7,7);
ellipse (360,97,7,7);
ellipse (370,97,7,7);
ellipse (380,97,7,7);
ellipse (390,97,7,7);
ellipse (403,95,10,10);

//ellipse du chargeur du révolver ligne du milieu
ellipse (310,141,7,7);
ellipse (320,141,7,7);
ellipse (330,141,7,7);
ellipse (340,141,7,7);
ellipse (350,141,7,7);
ellipse (360,141,7,7);
ellipse (370,141,7,7);
ellipse (380,141,7,7);
ellipse (390,141,7,7);
ellipse (400,141,7,7);
ellipse (410,141,7,7);
ellipse (420,141,7,7);
ellipse (430,141,7,7);
ellipse (440,141,7,7);
ellipse (453,139,10,10);

// ellipse du chargeur du revolver ligne inférieur
ellipse (310,190, 7,7);
ellipse (320,190, 7,7);
ellipse (330,190, 7,7);
ellipse (340,190, 7,7);
ellipse (350,190, 7,7);
ellipse (360,190, 7,7);
ellipse (370,190, 7,7);
ellipse (380,190, 7,7);
ellipse (390,190, 7,7);
ellipse (403,188, 10,10);

noFill();
stroke (255);
//ligne au dessus du canon
line (62,55,500,55);

//lignes du chargeur
line (308,125,450,125);
line (308,174,400,174);


// rectangle du canon
rect (55,60,450,20);
rect (40,100,30,30);
rect (50,90,250,40);
rect (100,120,200,25);

fill (255);
stroke (255);
//rectangle sous le canon
rect (270,130,30,80);
rect (250,130,20,30);
rect (270,200,230,10);
rect (470,60,35,150);
rect (355,210,40,20);


//rectangle aux coins du chargeur
rect (450,80,20,20);
rect (450,180,20,20);

//triangle manche
triangle (505,60,505,250,650,160);

//formes blanches manche
ellipse (580,176,140,140);
rect (484,210,20,20);




//forme noir cachant des zones blanches:
noStroke();
fill (0);

//triangle cachant un rectangle du canon (x1,y1,x2,y2,x3,y3);
triangle (100,131,80,151,120,151);

//triangle cachant un rectangle sous le canon
triangle (250,145,230,161,270,161);
triangle (270,161,200,210,280,211);

//ellipse cachant les coins du chargeur
ellipse (450,100,40,40);
ellipse (450,180,40,40);

//forme noir structurant le contour du manche
ellipse (650,50,300,250);
ellipse (484,230,40,40);
ellipse (540,290,60,60);
ellipse (545,330,60,70);
ellipse (555,390,60,80);
arc (722,30,100,500,0,PI);


//ellipse sous le canon, à côté de la gachette
ellipse (395,230,40,40);
ellipse (353,230,40,40);




//formes blanches gachette prenant le dessus sur les formes noirs:
fill (255);
stroke (255);
arc (480,200,50,60,0,PI);

//ellipse du contour de la gachette (de droite à gauche)
ellipse (506,255,3,3);
ellipse (506,260,4,4);
ellipse (504,265,4,4);
ellipse (502,270,4,4);
ellipse (500,275,4,4);
ellipse (497,280,4,4);
ellipse (492,285,5,5);
ellipse (487,288,5,5);
ellipse (482,290,5,5);
ellipse (477,291,5,5);
ellipse (472,292,5,5);
ellipse (467,293,5,5);
ellipse (462,293,5,5);
ellipse (456,293,5,5);
ellipse (450,292,5,5);
ellipse (444,292,5,5);
ellipse (438,291,5,5);
ellipse (431,290,5,5);
ellipse (423,288,5,5);
ellipse (415,286,5,5);
ellipse (407,284,5,5);
ellipse (400,282,5,5);
ellipse (393,280,5,5);
ellipse (388,278,5,5);
ellipse (385,276,5,5);
ellipse (383,274,5,5);
ellipse (381,272,5,5);
ellipse (380,270,5,5);
ellipse (379,267,5,5);
ellipse (378,263,5,5);
ellipse (377,258,5,5);
ellipse (376,251,5,5);
ellipse (375,243,5,5);
ellipse (374,234,5,5);

//ellipse de la gachette
ellipse (475,235,7,7);
ellipse (474,245,7,7);
ellipse (473,250,7,7);
ellipse (470,255,7,7);
ellipse (467,260,7,7);
ellipse (464,263,6,6);
ellipse (461,265,5,5);
ellipse (456,266,5,5);


//manche marron côté droit
noStroke();
fill (88,25,4);
ellipse (705,305,50,100);
triangle (680,172,660,265,720,265);


