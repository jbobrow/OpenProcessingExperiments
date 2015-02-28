
/* bananphone
thisisbullshit
beautiful piece of crap isn't it?
and even more bullshit
*/

/*
taille en PIXELS= largeur PUIS hauteur
*/

size(200,200);

/* et maintenant le BACKGROUND
0=noir
255=blanc
+que ça=couleur*/

background(200);


//stroke, la couleur de toutes les lignes, s'applique à ce qui vient derièrre



//ellipse! a=centre x b= centrey

// nofill=forme transparente
//fill a=red b=green c=blue

//light green
noStroke();
fill(0,229,162);
ellipse(65,150,90,90);
//brightred
noStroke();
fill(255,0,0);
ellipse(140,40,50,50);
//darkred
noStroke();
fill(127,0,0,50);
ellipse(30,30,40,40);
//transparent
noStroke();
ellipse(100,90,180,180);
fill(255);

//white
stroke(255);
line(65,150,140,40);
//green
stroke(200,200,100);
line(65,150,30,30);
//blue
stroke(100,0,300);
line(140,40,30,30);
