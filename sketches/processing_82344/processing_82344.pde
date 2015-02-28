
size (500,800);
background (250,245,240);
smooth ();
noFill ();

// On va générer de la forme

int centreX;
centreX = 500;

int centreY;
centreY = 400;

//on va générer des ellipses bleus
stroke (0,0,255);
ellipse (centreX,centreY,600,600);
ellipse (centreX,centreY, 550,550);
ellipse (centreX,centreY, 500,500);
ellipse (centreX,centreY, 450,450);
ellipse (centreX,centreY,400,400);
ellipse (centreX,centreY, 350,350);
ellipse (centreX, centreY, 300,300);
ellipse (centreX,centreY,250,250);
ellipse (centreX,centreY, 200,200);

//on va générer des ellipses rouges

int centreX2;
centreX2 = 0;

stroke (255,0,0);
ellipse (centreX2,centreY,600,600);
ellipse (centreX2,centreY, 550,550);
ellipse (centreX2,centreY, 500,500);
ellipse (centreX2,centreY, 450,450);
ellipse (centreX2,centreY,400,400);
ellipse (centreX2,centreY, 350,350);
ellipse (centreX2, centreY, 300,300);
ellipse (centreX2,centreY,250,250);
ellipse (centreX2,centreY, 200,200);

//on va générer un triangle noir

fill(0);
noStroke ();
triangle (200,100,300,100,250,130);

// on va générer trois petits points

ellipse (250,650,20,20);
ellipse (250,700,20,20);
ellipse (250,750,20,20);


