
PImage Mario;
Mario = loadImage("Mario.gif");

  
size (1100,500);
background(62,206,245);

stroke(209,76,27);          // Début de l'escalier
strokeWeight(3);
fill(245,150,62);
rect(150,348,50,50);
rect(200,348,50,50);
rect(250,348,50,50);

rect(200,298,50,50);
rect(250,298,50,50);

rect(250,248,50,50);


rect(490,348,50,50); 
rect(490,298,50,50); 
rect(490,248,50,50); 

rect(540,348,50,50); 
rect(540,298,50,50); 

rect(590,348,50,50);          // Fin de l'escalier


fill(58,219,27);             // Tube
stroke(43,180,16);
rect (320,198,150,200);
rect (287,180,210,50);       // Fin Tube

fill(255,243,0);
stroke(255,220,0);
rect (30,90,100,100);

noStroke();
fill(255,220,0);
ellipse (40,100,5,5);
ellipse (120,100,5,5);
ellipse (40,180,5,5);
ellipse (120,180,5,5);

fill(#FFF300);
noStroke ();
ellipse (850,20,150,150);

PFont police;
police = loadFont("DS-Digital-Bold-25.vlw");
textFont(police,25);
fill(0);
text("Manque-t-il quelque chose ?",750,200);
fill(255,220,0);
textFont(police,80);
text("?",65,160);

fill(247,229,20);
noStroke();
rect(0,400,1250,200);
