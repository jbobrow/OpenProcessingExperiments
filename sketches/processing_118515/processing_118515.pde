
size (800, 500);
background (255);

pushMatrix ();
// Strich C oben
translate (0, 0);
noStroke ();
fill (100);
rect (0, 0, 110, 70);

// Strich C unten
noStroke ();
fill (100);
rect (0, 430, 110, 70);

// Strich C links
noStroke ();
fill (0);
rect (0, 90, 20, 320);

// Strich C rechts
noStroke ();
fill (100);
rect (40, 90, 20, 320);

// Kästchen A
noStroke ();
fill (208, 5, 29);
rect (70, 90, 80, 120);
noStroke ();
fill (255);
rect (80, 110, 60, 80);

// Strich A rechts bzw. R links
noStroke ();
fill (100);
rect (160, 90, 20, 410);
popMatrix ();

pushMatrix ();
// Striche R waagrecht
translate (180, 140);
noStroke ();
fill (100);
rect (0, 0, 40, 10);
noStroke ();
fill (0);
rect (20, -10, 40, 10);
noStroke ();
fill (208, 5, 29);
rect (40, -20, 40, 10);
noStroke ();
fill (100);
rect (60, -30, 40, 10);
popMatrix ();

pushMatrix ();
// O
translate (220, 180);
noStroke ();
fill (0);
rect (0, 0, 140, 300, 200);
noStroke ();
fill (255);
rect (20, 20, 100, 260, 200);
popMatrix ();

pushMatrix ();
// Strich L senkrecht
translate (400, 90);
noStroke ();
fill (100);
rect (0, 0, 20, 370);

// Striche L unten
noStroke ();
fill (0);
rect (0, 400, 250, 10);
noStroke ();
fill (208, 5, 29);
rect (0, 380, 250, 10);
popMatrix ();

pushMatrix ();
// Strich I
translate (450, 250);
noStroke ();
fill (100);
rect (0, 0, 100, 210, 10);

noStroke ();
fill (0);
ellipse (50, -80, 100, 100);
popMatrix ();

pushMatrix ();
// Striche N
translate (580, 90);
noStroke ();
fill (100);
rect (0, 0, 10, 370);

noStroke ();
fill (208, 5, 29);
rect (20, 92.5, 10, 277.5);

noStroke ();
fill (0);
rect (40, 185, 10, 185);

noStroke ();
fill (208, 5, 29);
rect (60, 277.5, 10, 92.5);

noStroke ();
fill (0);
rect (80, 0, 10, 410);

// Strich E
noStroke ();
fill (100);
rect (100, 0, 50, 410);

// Punkte E
noStroke ();
fill (208, 5, 29);
ellipse (160, 15, 100, 30);

noStroke ();
fill (208, 5, 29);
ellipse (160, 395, 100, 30);

noStroke ();
fill (0);
ellipse (160, 205, 100, 30);
popMatrix ();
