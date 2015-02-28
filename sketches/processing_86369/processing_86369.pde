
size (500,700);
smooth ();
background (129,129,129);


//On va générer une forme rosée

noStroke(); 
fill (195, 157, 136);
ellipse (380, 130, 150, 80);
rect (305, 130, 150, 93);

// On va maintenant générer une forme couleur chaire

fill (236, 214, 164);
rect (315, 223, 130, 290);
rect (275, 513, 210, 110);
ellipse (380, 623, 210, 110);

//On va générer les griffes noires du koala

fill (0);
rect (418, 410, 15, 12);
ellipse (434, 416, 7, 12);

rect (422, 425, 15, 12);
ellipse (438, 431, 7, 12);

rect (422, 440, 15, 12);
ellipse (438, 446, 7, 12);

rect (418, 455, 15, 12);
ellipse (434, 461, 7, 12);

//On va générer la forme verte qui formera un koala

fill (18, 107, 51);
ellipse (220, 350, 200, 200);
rect (120, 350, 200, 193);

rect (320, 405, 95, 65);
ellipse (415, 438, 25, 65);

//On va créer le museau du koala

fill (255, 79, 79);
rect (205, 330, 30, 30);
ellipse (220, 330, 30, 25);
ellipse (220, 360, 30, 25);

// On va créer les yeux noirs

fill (0);
rect (180, 305, 10, 10);
ellipse (185, 315, 10, 10);
ellipse (185, 305, 10, 10);

rect (250, 305, 10, 10);
ellipse (255, 315, 10, 10);
ellipse (255, 305, 10, 10);

// On va généré des formes vertes qui doivent subir une rotation de PI/3

fill (18, 107, 51);
rotate(PI/3);
translate(120,80);
ellipse(400,0,230,240);

translate(120,80);
rect(350,-200,45,135);
ellipse(372,-200,45,35);

translate(120,80);
rect(20,-380,85,45);
ellipse(62,-380,85,65);

//On va créer le morceau d'oreille blanc dans cette même rotation

fill (255);
translate(120,80);
rect(-80,-462,45,35);
ellipse(-57,-458,45,25);

// On va créer les griffes de la patte arrière

fill (0);
translate(120,80);
rect(-5,-460,5,10);
ellipse(-2,-456,5,10);

rect(5,-463,5,10);
ellipse(8,-459,5,10);

rect(15,-463,5,10);
ellipse(18,-460,5,10);

rect(25,-460,5,10);
ellipse(28,-456,5,10);

//On va créer l'oreille gauche de couleur verte avec une rotation de PI/6

fill (18, 107, 51);
rotate(PI/3);
rect(-480,40,75,45);
ellipse(-442,90,75,65);

// on va créer le blanc de cette même oreille

fill (255);
rect(-465,50,45,35);
ellipse(-442,85,45,25);



