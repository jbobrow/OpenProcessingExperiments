
size(340,540);
smooth();

//head
noStroke();
fill(160);
rect(120,100,100,80);

//neck
stroke(0);
line(140,180,140,200);
line(200,180,200,200);

//antennas
noStroke();
fill(0);
triangle(120,60,140,100,160,100);
triangle(220,60,200,100,180,100);
fill(128);
ellipse(120,60,20,20);
ellipse(220,60,20,20);

//eyes
fill(255);
ellipse(150,130,20,20);
ellipse(190,130,20,20);
fill(0);
ellipse(150,130,10,10);
ellipse(190,130,10,10);

//mouth
stroke(0);
strokeWeight(8);
strokeJoin(SQUARE);
line(142.5,160,152.5,160);
line(157.5,160,167.5,160);
line(172.5,160,182.5,160);
line(187.5,160,197.5,160);

//arms
noStroke();
fill(128);
strokeWeight(1);
quad(60,200,80,220,40,340,20,320);
quad(280,200,260,220,300,340,320,320);

//body
fill(0);
rect(60,200,220,200);

//buttons outline
fill(64);
strokeWeight(1);
rect(150,220,40,40);
rect(150,280,40,40);
rect(150,340,40,40);

//buttons
fill(128);
rect(160,230,20,20);
rect(160,290,20,20);
rect(160,350,20,20);

//breast pannels
fill(235);
rect(80,220,40,100);
rect(220,220,40,100);

//speakers
fill(160);
strokeWeight(1);
ellipse(100,360,40,40);
ellipse(240,360,40,40);
stroke(0);
ellipse(100,360,5,5);
ellipse(240,360,5,5);

//legs
line(90,400,90,420);
line(130,400,130,420);
line(210,400,210,420);
line(250,400,250,420);

//feet
noStroke();
fill(128);
rect(80,420,60,60);
rect(200,420,60,60);

