
size (500,500);
smooth ();
background (255);

// je trace un rectangle rouge

noStroke ();
fill (255,0,0);
rect (0,260,500,120);
rect (180,0,10,500);

// je trace un rectangle blanc
fill(255);
rect (180,260,10,120);

// je trace un rectangle noir
fill (0);
rect (190,380,310,120);

//je trace deux ellipses grises + 1 arc noir

fill (144);
ellipse (100,260,50,50);
ellipse (320,100,80,80);


fill(0);
arc(100,260,50,50,0,PI);


