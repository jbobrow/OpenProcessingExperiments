
size (800, 500);
background (255);

// Strich C
pushMatrix ();
translate (0, 50);
noStroke ();
fill (0);
rect (0, 0, 50, 400);

// punkt oben
noStroke ();
fill (26, 197, 22);
ellipse (60, 0, 50, 50);
noStroke ();
fill (26, 197, 22);
ellipse (100, 0, 50, 50);

// punkt unten
noStroke ();
fill (26, 197, 22);
ellipse (60, 400, 50, 50);
noStroke ();
fill (26, 197, 22);
ellipse (100, 400, 50, 50);
popMatrix ();

// Strich A oben
pushMatrix ();
translate (140, 25);
noStroke ();
fill (131);
rect (0, 0, 80, 20);

// Strich A links
noStroke ();
fill (0);
rect (0, 25, 20, 450);

// Strich A rechts
noStroke ();
fill (0);
rect (60, 25, 20, 200);

// Strich A Mitte
noStroke ();
fill (0);
rect (30, 80, 20, 40);
popMatrix ();

pushMatrix ();
// Strich R oben
translate (170, 300);
noStroke ();
fill (131);
rect (0, 0, 80, 20);

// Strich R unten
noStroke ();
fill (131);
rect (0, 75, 80, 20);

// R punkt oben
noStroke ();
fill (26, 197, 22);
ellipse (67, 34, 28, 28);

// R punkt unten
noStroke ();
fill (26, 197, 22);
ellipse (67, 62, 28, 28);

// R Punkte schräg
noStroke ();
fill (26, 197, 22);
ellipse (15, 109, 28, 28);

noStroke ();
fill (26, 197, 22);
ellipse (30, 130, 28, 28);

noStroke ();
fill (26, 197, 22);
ellipse (45, 150, 28, 28);

noStroke ();
fill (26, 197, 22);
ellipse (60, 170, 28, 28);

noStroke ();
fill (26, 197, 22);
ellipse (75, 190, 28, 28);
popMatrix ();

pushMatrix ();
// Strich O links
translate (250, 25);
noStroke ();
fill (0);
rect (0, 0, 50, 225);

// Srich O rechts
noStroke ();
fill (0);
rect (100, 0, 50, 225);

// Punkt O oben
noStroke ();
fill (26, 197, 22);
ellipse (75, 25, 50, 50);

// Punkt O unten
noStroke ();
fill (26, 197, 22);
ellipse (75, 200, 50, 50);
popMatrix ();

pushMatrix ();
// Strich L
translate (300, 300);
noStroke ();
fill (0);
rect (0, 0, 50, 200);

// Punkte L
noStroke ();
fill (26, 197, 22);
ellipse (64, 186, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (92, 186, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (120, 186, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (148, 186, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (176, 186, 28, 28);
popMatrix ();

pushMatrix ();
// Strich I
translate (418, 100);
noStroke ();
fill (0);
rect (0, 0, 70, 360);
popMatrix ();

pushMatrix ();
// Punkt I
translate (453, 55);
noStroke ();
fill (131);
ellipse (0, 0, 75, 75);
popMatrix ();

pushMatrix ();
// Strich N links
translate (508, 100);
noStroke ();
fill (0);
rect (0, 0, 50, 360);

// Punkte N
noStroke ();
fill (26, 197, 22);
ellipse (64, 100, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (79, 120, 28, 28);
noStroke ();
fill (26, 197, 22);
ellipse (94, 140, 28, 28);

// N Strich rechts 
noStroke ();
fill (0);
rect (108, -80, 50, 360);

// Strich E oben
noStroke ();
fill (131);
rect (168, -80, 100, 20);

// Strich E Mitte
noStroke ();
fill (131);
rect (168, 90, 100, 20);

// Strich E unten
noStroke ();
fill (131);
rect (168, 260, 100, 20);
popMatrix ();
