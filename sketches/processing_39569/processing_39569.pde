
background(#30173B);
size(600,600);
smooth();

fill(0);
ellipseMode(CORNER);
ellipse(100,100,120,220);
ellipse(150,60,200,200);
ellipse(300,75,100,100);
ellipse(145,235,100,100);

noStroke();
fill(#FFB990);

beginShape();
vertex(163,360);
vertex(195,326);
vertex(208,295);
vertex(215,275);
vertex(215,220);
vertex(245,200);
vertex(265,210);
vertex(280,210);
vertex(300,180);
vertex(330,150);
vertex(360,140);
vertex(390,140);
vertex(400,180);
vertex(400,210);
vertex(392,225);
vertex(392,235);
vertex(396,250);
vertex(400,265);
vertex(403,272);
vertex(404,275);
vertex(405,280);
vertex(402,285);
vertex(387,289);
vertex(388,303);
vertex(386,308);
vertex(386,314);
vertex(380,319);
vertex(378,325);
vertex(378,334);
vertex(376,340);
vertex(370,348);
vertex(355,350);
vertex(325,350);
vertex(315,355);
vertex(295,390);
vertex(295,415);
vertex(220,370);
endShape(CLOSE);

ellipseMode(CENTER);
stroke(0,120);
strokeWeight(4);
line(363,208,384,205);
strokeWeight(5);
line(387,205,395,206);
strokeWeight(2);
line(345,214,361,208);

noStroke();
fill(255);
arc(355,235,40,40,-0.25,.35);

fill(#432C02);
ellipse(375,236,4,10);

stroke(0,230);
strokeWeight(2);
line(360,233,380,229);

PImage b;
b = loadImage("ear.png");
image(b, 203, 180);

noFill();
stroke(#E3AE00,255);
arc(265,295,15,15,-1.1,PI+1);
arc(265,250,12,12,1,TWO_PI-0.5);




