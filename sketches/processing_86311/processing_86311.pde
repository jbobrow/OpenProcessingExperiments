
size (500,700);
background (0);
smooth ();
noStroke ();

// on va générer la forme blanche
fill(255);
arc (350,180,200,200,0,TWO_PI);
rect (250, 180, 200,110);

// on va générer la forme jaune/grise
fill (219,214,164);
arc (350,200,120,90,0,TWO_PI);
rect (290, 200, 120,90);

rect (325,290,50,300);
arc (350,590,50,50,0,PI);

// on va générer des formes marron

fill (90,55,9);
arc (125,570,50,50,0,TWO_PI);
rect (100, 565, 50,50);
arc (100,570,50,50,0,TWO_PI);
rect (75, 565, 50,50);
arc (40,570,50,50,0,TWO_PI);
rect (15, 565, 50,50);
arc (180,570,50,50,0,TWO_PI);
rect (155, 565, 50,50);

fill(90, 55, 9, 127); // blanc semi-transparent

rect (50, 535, 120,80);
translate(width/2, height/2);
rotate(radians(180));
arc (140,-185,120,100,0,PI);



