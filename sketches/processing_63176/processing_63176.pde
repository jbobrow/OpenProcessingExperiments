
size (600, 600);
background (255);
float d=100;

//head
fill (200);
stroke (100);
strokeWeight(3);
ellipseMode (CENTER);
ellipse (width/2, height/2, 2*width/3, 2*height/3);


//earL
fill (200);
noStroke ();
ellipseMode (CENTER);
ellipse (width/6, height/2, d, height/6);


//earR
fill (200);
noStroke ();
ellipseMode (CENTER);
ellipse (5*width/6, height/2,  d, width/6);


//eyeL
fill (255);
noStroke ();
arc (225, height/2, width/6, height/6, 0, PI*(d/50));

//eyeR
fill (255);
noStroke ();
arc (375, height/2, width/6, height/6, 0, PI*(d/50));

//eyeL
fill (255);
noStroke ();
arc (225, height/2, width/6, height/6, 0, PI);

//eyeR
fill (255);
noStroke ();
arc (375, height/2, width/6, height/6, 0, PI);

//eyeballL
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (225, height/2, width/24, height/24, 0, PI*(d/50));

//eyeballR
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (375, height/2, width/24, height/24,0, PI*(d/50));

//eyeballL
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (225, height/2, width/24, height/24, 0, PI);

//eyeballR
fill (0);
noStroke ();
ellipseMode (CENTER);
arc (375, height/2, width/24, height/24,0, PI);

//nostrilL
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (275, 375, width/24, height/24, 0, PI);

//nostrilr
fill (255);
noStroke ();
ellipseMode (CENTER);
arc (325, 375, width/24, height/24, 0, PI);

//mouth
fill (255);
noStroke ();
rectMode (CENTER);
rect (300, 437, width/(d/4), d/2);

//hair
fill (0);
noStroke ();
triangle (width/2,height/6, 3*width/6, height/6, 3*width/6, height/2);



