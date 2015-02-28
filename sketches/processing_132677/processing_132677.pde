

/* @pjs preload= "background.jpeg"; */

size(900,900);
background(255);
smooth();

PImage img;
 img = loadImage("background.jpeg");
 image(img,50,50);
 
 stroke(255,225,127);
 strokeWeight(8);
 noFill();
 strokeCap(SQUARE);
 
 ellipse(450,677,285,97);
 line(400,205,425,205);
 line(475,205,500,205);
 
 stroke(243,134,174);
 
 arc(450,625,365,125,radians(-45),radians(225));
 line(430,186,415,170);
 line(468,186,485,170);
 
 stroke(54,187,165);
 
 arc(450,575,436,150,radians(-15),radians(195));
 line(450,155,450,178); 
 stroke(255);
 strokeWeight(12);
 strokeCap(ROUND);

 arc(450,482,500,256,radians(180),radians(360));
 arc(450,482,500,170,radians(0),radians(180));
 arc(450,509,500,170,radians(0),radians(180));
 line(200,509,200,482);
 line(700,509,700,482);
 line(325,580,325,557);
 line(450,594,450,567);
 line(575,580,575,557);
 ellipse(270,490,25,25);
 ellipse(383,525,25,25);
 ellipse(517,525,25,25);
 ellipse(630,490,25,25);
 line(450,277,450,205);
 
 
 fill(54,187,165);
 arc(450,429,348,302,radians(180),radians(360));
 arc(450,429,348,120,radians(0),radians(180));
 
 fill(255);
 ellipse(450,277,53,23);
 
 noFill();
 strokeWeight(8);
 
 arc(450,429,300,245,radians(185),radians(250));
 


