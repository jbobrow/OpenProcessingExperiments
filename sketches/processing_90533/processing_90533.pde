
size(400,600);
background(255);

//DECLARATION POINTS DU TRIANGLE
//POINT 1
int variablex=80;
variablex=80;

int variablex1=80;
variablex1=80;

//POINT 2
int variabley=130;
variabley=130;

int variabley1=130;
variabley1=130;

//VARIABLE COULEUR
int couleur=0;
couleur=0;

//VARIABLE EPAISSEUR CONTOUR
int epaisseur=2;
epaisseur=2;

//création de formes simples
//TRIANGLE
//forme 1
noFill();
stroke(couleur);
strokeWeight(epaisseur);
line(variablex,variablex1-30,variabley1-37,variabley-55);
line(variablex,variablex1-30,variabley1-50,variabley-25);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex,variablex1+25,variabley1-100,variabley);


//forme2
noFill();
stroke(couleur);
strokeWeight(epaisseur);
translate(140,variabley1-130);
line(variablex,variablex1-30,variabley1-37,variabley-55);
line(variablex,variablex1-30,variabley1-50,variabley-25);
line(variablex+50,variablex1+50,variabley1-30,variabley);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex,variablex1+25,variabley1-100,variabley);


//forme3
noFill();
stroke(couleur);
strokeWeight(epaisseur);
translate(-140,variabley1+10);
line(variablex,variablex1-30,variabley1-37,variabley-55);
line(variablex,variablex1-30,variabley1-50,variabley-25);
line(variablex+50,variablex1+50,variabley1-30,variabley);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex,variablex1+25,variabley1-100,variabley);
line(variablex-50,variablex1+50,variabley1-85,variabley-25);

//forme 4 
noFill();
stroke(couleur);
strokeWeight(epaisseur);
translate(140,variabley1-130);
line(variablex,variablex1-30,variabley1-37,variabley-55);
line(variablex+13,variablex1-5,variabley1-30,variabley);
line(variablex+50,variablex1+50,variabley1-30,variabley);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex,variablex1+25,variabley1-100,variabley);


//forme5
fill(couleur);
translate(-140,variabley+10);
line(variablex,variablex1-30,variabley1-50,variabley-25);
line(variablex+50,variablex1+50,variabley1-100,variabley);

//forme6
noFill();
stroke(couleur);
strokeWeight(epaisseur);
translate(140,variabley1-130);
line(variablex,variablex1-30,93,variabley-55);
line(variablex+13,variablex1-5,variabley1-30,variabley);
line(variablex+50,variablex1+50,variabley1-30,variabley);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex,variablex1+25,variabley1-100,variabley);
line(variablex-50,variablex1+50,variabley1-50,variabley-80);

//forme7
fill(couleur);
translate(-140,variabley1+10);
//line(80,50,80,105);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex-50,variablex1+50,variabley1-50,variabley-80);


noFill();
stroke(couleur);
strokeWeight(epaisseur);
translate(140,0);
line(variablex,variablex1-30,variabley1-37,variabley-55);
line(variablex+13,variablex1-5,variabley1-85,variabley-25);
line(variablex,variablex1-30,80,variabley-25);
line(variablex+50,variablex1+50,variabley1-30,variabley);
line(variablex,variablex1+25,variabley1,variabley);
line(variablex-50,variablex1+50,variabley1-85,variabley-25);



