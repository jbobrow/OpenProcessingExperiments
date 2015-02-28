
/*@pjs preload="cat.png";*/

PImage img;

size(400,400);
background(255,250,205);


stroke(255,182,193);
strokeWeight(20);
line(0,0,0,200);
line(50,0,50,200);
line(100,0,100,200);
line(150,0,150,200);
line(200,0,200,200);
line(250,0,250,200);
line(300,0,300,200);
line(350,0,350,200);
line(400,0,400,200);

strokeWeight(25);
line(0,200,400,200);

noStroke();
fill(135,206,250);
ellipse(201,300,25,25);
ellipse(300,250,25,25);
ellipse(400,300,25,25);
ellipse(201,400,25,25);
ellipse(0,300,25,25);
ellipse(100,250,25,25);

noStroke();
fill(152,251,152);
ellipse(150,350,25,25);
ellipse(220,248,25,25);
ellipse(360,380,25,25);
ellipse(288,340,25,25);
ellipse(70,370,25,25);
ellipse(0,400,25,25);

noStroke();
fill(255,182,193);
ellipse(30,350,25,25);
ellipse(100,400,25,25);
ellipse(90,310,25,25);
ellipse(340,280,25,25);
ellipse(270,300,25,25);
ellipse(0,250,25,25);
ellipse(260,389,25,25);

noStroke();
fill(240,200,179);
ellipse(400,400,25,25);
ellipse(170,240,25,25);
ellipse(50,230,25,25);
ellipse(210,350,25,25);
ellipse(389,240,25,25);
ellipse(170,240,25,25);
ellipse(345,335,25,25);
ellipse(140,300,25,25);
ellipse(40,300,25,25);


img=loadImage("cat.png");

tint(100,149,237);
image(img,290,258,150,150);




