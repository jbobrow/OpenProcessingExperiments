
//Déterminons la taille de la feuille pour commencer
size(1000,800);
//peindre le fond de la fenetre ON PEUX COPIER UN CODE COULEUR DANS TOOL ONGLET COLOR
background(#37BBC1);
//retirer le contour
noStroke();
// REMPLIR
fill(#2F4243);

ellipse(250,200,300,300);
//position  et diametre
ellipse(100,38,25,25);
// REMPLIR
fill(#FFFFFF);
ellipse(150,70,70,70);
ellipse(240,142,100,100);


// Determiner la couleur du trait
stroke(#FFFFFF);

// Dessiner des ligne entre les points
line(50,50,50,150);
line(100,150,50,150);
line(50,150,150,150);
line(50,50,150,150);
line(150,50,150,150);
line(50,50,150,50);
line(150,50,50,150);


// Dessiner des ligne entre les points
line(100,200,350,58);
line(58,25,250,150);
line(70,400,350,158);
line(50,150,50,500);
line(350,350,50,150);

//variable

strokeCap(SQUARE);

int a = 50;
int b = 120;
int c = 180;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);

a = a + c;
b = height-b;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);

a = a + c;
b = height-b;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);

//retirer le contour
noStroke();

//transparence
fill(#FFFFFF,60);
ellipse(250,200,500,500);
ellipse(100,50,300,300);
line(800,600,250,500);

// REMPLIR
fill(#2F4243);
line(200,250,350,850);
ellipse(600,600,300,300);
fill(#FFFFFF,60);
ellipse(800,100,400,400);
ellipse(100,800,400,400);
ellipse(500,500,600,600);
fill(#FFFFFF);
ellipse(500,500,100,100);

// Determiner la couleur du trait
stroke(#FFFFFF);
line(950,600,250,500);


a = a + c;
b = height-325;

line(a, b, a+c, b);
line(a, b+10, a+c, b+10);
line(a, b+20, a+c, b+20);
line(a, b+30, a+c, b+30);
