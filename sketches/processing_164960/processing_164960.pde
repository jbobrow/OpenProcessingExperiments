
/*@pjs preload="sasasasasa.png;*/

PImage img;

size(400,400);

background(189,219,151);

img = loadImage("sasasasasa.png");

tint(153,125,73);
image(img,218,292);

stroke(138,86,41,180);
strokeWeight(10);
line(0,50,400,50);
line(0,350,400,350);
line(50,0,50,400);
line(350,0,350,400);

stroke(153,125,73);
noFill();
strokeWeight(2);
ellipse(300,320,50,43); //head

fill(153,125,73);
stroke(153,125,73);
strokeWeight(1);
ellipse(278,301,23,21); //left year
ellipse(323,301,23,21); //righ tyear
ellipse(288,320,18,15); //left eye
ellipse(312,320,18,15); //right eye
ellipse(300,327,5,2);

stroke(153,125,73);
strokeWeight(1);
line(300,327,300,332); //hananosita
line(300,332,298,335); //okuti
line(300,332,302,335); //okuti





