
//hellow mundo
//Processing Miro
///Idep_Barcelona2010
////Ana Paula Carvalho

//Objetivo:Una tentativa de crear un Miro todo en processing

// conf basica
size (650,450);
background (243,233,231);
smooth ();
  

// retangulo
noStroke ();
fill (75,77,76);
rect(0, height/2+50, width, height/2);
// retangulo alpha
noStroke ();
fill (74,74,76,80);
rect(0, height/2+100, width/2+800, height/2);


// linha
stroke (46,46,48);
strokeWeight(32);
line (0, height/2+80, width, height/2+40);
// linha alpha
stroke (46,46,48,70);
strokeWeight(45);
line (0, height/2+80, width, height/2+40);


// ellipse roja
noStroke (); 
fill (196,63,68);
ellipse ( 330,100, width-300, height/3);
// ellipse roja alpha
noStroke (); 
fill (178,40,53,80);
ellipse ( 340,90, width-360, height/4);



// ellipse negra
noStroke (); 
fill (46,46,48);
ellipse (590,140, height/15, width/20);
// ellipse negra alpha
noStroke (); 
fill (84,91,86,80);
ellipse (589,140, height/10, width/15);


// ellipse cinza
noStroke (); 
fill (75,77,76);
ellipse (630,220, height/15, width/20);

// ellipse cinza alpha
noStroke (); 
fill (125,98,74,80);
ellipse (628,220, height/15+10, width/20+10);

// ellipse roja pequena
noStroke (); 
fill (196,63,68);
ellipse ( 480,180, width/20, height/15);

// ellipse roja pequena alpha
noStroke (); 
fill (233,107,15,50);
ellipse ( 483,180, width/20+15, height/15+15);

// ellipse azul
noStroke (); 
fill (77,125,187);
ellipse (100,220, height/15-5, width/20-5);

// ellipse azul
noStroke (); 
fill (77,125,187,80);
ellipse (98,220, height/15, width/20);

// ellipse verde
noStroke (); 
fill (90,113,93);
ellipse (150,50, height/15-5, width/20-5);

// ellipse verde alpha
noStroke (); 
fill (87,174,87,70);
ellipse (145,50, height/10, width/15);

// ellipse vermelha cinza
noStroke (); 
fill (169,79,60);
ellipse (170,393, height/25, width/30);


// ellipse vermelha cinza alpha
noStroke (); 
fill (105,63,44, 100);
ellipse (170,400, height/10, width/15);


// ellipse amarela
noStroke (); 
fill (220,145,72);
ellipse (470,380, height/15+5, width/20+5);
filter(BLUR, 1);

// ellipse amarela alpha
noStroke (); 
fill (126,94,30,90);
ellipse (470,385, height/10+20, width/15+20);


//mancha
noStroke ();
fill (84,91,86,80);
triangle (530, 185, 525, 125, 600, 235);


// ellipse negra mancha
noStroke (); 
fill (46,46,48);
ellipse (545,170, height/15, width/20);


// ellipse negra mancha
noStroke (); 
fill (46,46,48);
ellipse (565,200, height/35, width/45);


// ellipse negra mancha
noStroke (); 
fill (46,46,48);
ellipse (576,212, height/35-5, width/45-5);
filter(BLUR, 2);


