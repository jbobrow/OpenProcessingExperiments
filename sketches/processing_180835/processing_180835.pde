
// COS
size (800, 600);
background (255,0,0);
smooth ();
noStroke ();
fill (87,185,2);

ellipse (400, 300, 190, 200);
noStroke ();
ellipse (400, 260, 170, 195);
// ellipses darrere els ulls
ellipse (375, 175, 65, 65);
ellipse (425, 175, 65, 65);

// CORONA
noStroke ();
fill (245,195,30);
rect (377, 115, 45, 25);
//triÃ¡ngulo1
triangle (377, 118, 370, 80, 392, 95);
//triÃ¡ngulo2
triangle (377, 118, 400, 75, 422, 118);
//triÃ¡ngulo3
triangle  (409, 95, 430, 80, 422, 119);
stroke (3,3,3);
strokeWeight (3);
line (370, 80, 377, 138); 
line (378, 139, 420, 139);
line (420, 139,430, 80);

line (370, 80, 390, 92);
line (390, 92, 400, 75);
line (400, 75, 409, 92); 
line (409, 93, 430, 80);

// MOFLETES
noStroke ();
fill(255,76, 76);
ellipse (350, 215, 30, 20);
ellipse (450, 215, 30, 20);

// NAS
fill (3,3,3);
ellipse (395, 220, 3, 5 );
ellipse (405, 220, 3, 5);

// BOCA
noFill();
stroke (3,3,3);
strokeWeight (4);
curve (150, 140, 350, 250, 450, 250, 270, 230);

// ULLS
stroke (3,3,3);
fill (255,255,255);
strokeWeight(3); 
ellipse (375, 175, 50, 50);
ellipse (425, 175, 50, 50);

// OMBRA D'ULLS
stroke (206,206,206);
strokeWeight (10);
ellipse (375, 175, 35, 35);
ellipse (425,175, 35, 35);

// PUPILES
fill (255,255,255);
stroke (3,3,3);
strokeWeight (5);
ellipse (380, 175, 10, 10);
ellipse (420, 175, 10, 10);

// PARPELLES
noFill ();
strokeWeight (4);
stroke (3,3,3);
curve (350, 200, 360, 180, 390, 160, 370,140); //ESQUERRE
curve (430, 150, 410, 160, 440, 180, 430, 170); // DRET

//MANS 
noFill ();
stroke (87,185,2);
strokeWeight (17);
curve  (510, 350, 490, 300, 520, 200, 450, 230);
curve (450, 200, 520, 200, 490, 180, 520, 270);
strokeWeight (15);
stroke (33,131,45);
ellipse (490, 176, 10, 10);


//CAMES
//esquerra
stroke (87,185,2);
strokeWeight (40);
curve (100, 200, 350, 350, 250, 250, 100, 190);
curve (290, 250, 330, 380, 250, 270, 250, 250);
//ombra
stroke (3,3,3);
strokeWeight (3);
curve (205,230, 255,265, 330,358, 180,300);   
//dreta
stroke (87,185,2);
strokeWeight (40);
curve (650, 200, 540, 250, 440,350, 610, 190);
curve (500, 250, 535, 270, 460,380, 400, 250);
//ombra
stroke (3,3,3);
strokeWeight (3);
curve (600, 400, 545, 250, 460,370, 600,300);


//PEUS
//peu1
fill (87,185,2);
noStroke ();
ellipse (290, 395, 100, 20);
//ungles
fill (255,0,0);
arc(250, 387, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(250, 400, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(265, 402, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(285, 404, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(346, 387, 10, 10, 0, PI+QUARTER_PI, OPEN);

//peu2
fill (87,185,2);
ellipse (500, 395,100, 20); 
fill (255,0,0);
arc(546, 388, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(546, 398, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(501, 403, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(525, 403, 10, 10, 0, PI+QUARTER_PI, OPEN);
arc(448, 392, 10, 10, 0, PI+QUARTER_PI, OPEN);

//TEXT
textSize(50);
fill (255,255,255);
text("KEEP CALM", 270, 320); 
fill(70,54,183);
textSize (35);
text("AND", 365, 375);
textSize (50);
fill(255,255,255);
text("KISS ME", 310, 450); 

