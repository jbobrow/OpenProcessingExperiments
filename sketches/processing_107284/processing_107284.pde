
//Ruben Mendez Processing Sketch

size(1200,500); //size of frame
PImage img = loadImage("images.jpg");
image(img, 0,0);


line(800,450,825,425); //legs
line(850,450,825,425);

//torso
line(825,425,825,375);

//arms
line(800,400,850,400);

//head
fill(300,200,150);
stroke(255,0,255);
ellipseMode(CORNER);
ellipse(800,325,50,50);


line(700,350,725,325);//Second stick figure/ legs
line(750,350,725,325);

//torso
stroke(255,120,50);
line(725,325,725,275);

//arms
line(700,300,750,300);

//head
fill(0,0,220);
ellipseMode(CORNER);
ellipse(700,225,50,50);

//house
fill(0,220,150);
rect(500,300,150,150);
line(500,300,575,200);
line(575,200,650,300);



//house
fill(120,270,100);
rect(300,200,150,150);
line(300,200,375,100);
line(375,100,450,200);


//arc
fill(215,255,0);
arc(350, 350, 80, 80, 0, PI+QUARTER_PI, PIE);



//fish
fill(23,1,91);
smooth();
triangle(91,44,159,44,125,102);
quad(125,44,91,153,125,212,159,153);
//draw tiny white circle
fill(255);
ellipseMode(CENTER);
ellipse(130,130,10,10);



