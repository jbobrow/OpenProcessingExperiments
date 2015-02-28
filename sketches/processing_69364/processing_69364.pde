
background(255);
size(600, 600);

//Creating an image of a tree with a pond like modern painter Mondrain.

// Establising the tree top. Bottom left circle.
fill(255,0,0);ellipse(225,300,180,180);
triangle(225,210,135,300,315,300);
fill(255,255,255);
triangle(225,390,135,300,315,300);

//Bottom right circle.
fill(255,255,255);ellipse(375,300,180,180);
triangle(375,210,285,300,465,300);
fill(255,0,0);
triangle(375,390,285,300,465,300);

//Top circle.
fill(255,255,255);
ellipse(300,200,180,180);
fill(255,0,0);
triangle(300,110,230,255,370,255);

//Rock by tree. And pond.
fill(255,255,0);quad(280,500,280,430,230,450,200,500);
quad(350,500,600,500,600,550,420,520);

//Rectangles.
fill(255,255,0);rect(500,100,75,75);
rect(75,400,25,50);
fill(0,0,255);rect(120,500,50,100);
rect(300,0,100,75);
rect(350,400,50,50);
rect(475,75,25,25);
fill(255,0,0); rect(25,50,125,75);

// Outlining the tree trunk and ground.
line(280,370,280,600);
line(320,370,320,600);
line(0,500,600,500);

//Adding abstract lines.
line(50,0,50,600); line(75,0,75,600);
line(0,200,210,200); line(390,200,600,200);
line(0,150,225,150); line(375,150,600,150);
line(150,0,150,250); line(150,350,150,600);
line(320,400,600,400); line(320,450,600,450);
line(0,400,280,400); line(0,450,230,450);
line(500,0,500,500); line(0,550,600,550);
line(500,533,500,600); line(0,75,600,75);

