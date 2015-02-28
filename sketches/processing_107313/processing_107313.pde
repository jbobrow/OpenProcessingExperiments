
    /* @pjs preload ="images.jpg"; */

//Ruben Mendez Processing Sketch

size(800,600); //size of frame
PImage img = loadImage("images.jpg");
image(img, 0,0);


//arc
fill(255,255,0);
arc(50, 50, 80, 80, 0, PI+QUARTER_PI, PIE);



//house
fill(0,220,150);
rect(500,300,150,150);
line(500,300,575,200);
line(575,200,650,300);



//house
fill(120,270,100);
rect(300,300,150,150);
line(300,300,375,200);
line(375,200,450,300);



//sun
fill(240,223,21);
ellipseMode(CORNER);
ellipse(650,20,150,150);

//window
fill(255,255,255);
rect(300,300,50,50);

//window
fill(255,255,255);
rect(500,300,50,50);

//tall building
fill(0,120,255);
rect(100,100,150,400);





