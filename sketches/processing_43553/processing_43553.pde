
size (500,500);
background (#F2FFAD);

//green
color c5 = color (#185015);
//blue
color c6 = color (#5DAAFA);
//red
color c7 = color (#FC5036);
//yellow
color c8 = color (#FCE426);
//dark green
color c9 = color (#0A3108);
//black
color c10 = color (0,0,0,0);
//brown
color c11 = color (#3E2210);

smooth();

//Hintergrund Streifen
fill(c6,100);
beginShape();
vertex(20,0);
vertex(500,480);
vertex(500,360);
vertex(80,0);
endShape();

//Hintergrund Streifen
fill(c8,100);
beginShape();
vertex(460,0);
vertex(0,460);
vertex(0,320);
vertex(380,0);
endShape();

//roter Farbkreis
fill(c7,100);
stroke(c10,100);
strokeWeight(2);
ellipse(170,330,40,40);

fill(c7,100);
stroke(c10,100);
strokeWeight(2);
ellipse(170,330,40,40);

fill(c7,100);
stroke(c10,100);
strokeWeight(2);
ellipse(170,330,40,40);

//gelber Kreis
fill(c8,100);
stroke(c9,100);
strokeWeight(1);
ellipse(150,270,130,130);

//blauer Kreis
fill(c6,100);
stroke(c10,100);
strokeWeight(2);
ellipse(80,280,35,35);

fill(c6,100);
stroke(c10,100);
strokeWeight(2);
ellipse(80,280,35,35);

fill(c6,100);
stroke(c10,100);
strokeWeight(2);
ellipse(80,280,35,35);

//blauer kleiner Kreis
fill(c6,100);
stroke(c9,100);
ellipse(160,205,70,70);

//kleinerer grüner Kreis
fill(c5,60);
stroke(c9,100);
strokeWeight(1);
ellipse(300,230,120,120);

//gelber kleinerer Kreis
fill(c8,60);
stroke(c9);
strokeWeight(1);
ellipse(280,300,100,100);

//grüner Kreis
fill(c5,100);
stroke(c9,100);
strokeWeight(1);
ellipse(210,260,150,150);

fill(c5,60);
noStroke();
strokeWeight(0);
ellipse(210,260,150,150);

//größerer roter Kreis
fill(c7,100);
stroke(c9,100);
strokeWeight(1);
ellipse(215,160,110,110);

fill(c7,100);
noStroke();
strokeWeight(0);
ellipse(215,160,110,110);

//roter Kreis
fill(c7,100);
stroke(c10);
strokeWeight(3);
ellipse(200,230,50,50);

//schwarzer Mittelpunkt
fill(c10);
noStroke();
ellipse(200,230,10,10);

//grüner Umkreis
stroke(c9);
strokeWeight(16);
noFill();
ellipse(250,250,450,450);

//Hauptlinie
stroke(c9);
strokeWeight(1.5);
line(280,50,175,410);

//Antennen - Hauptlinie
strokeWeight(0.5);
line(250,85,290,105);

strokeWeight(0.5);
line(250,70,290,95);

//Schnittlinie
stroke(c9);
strokeWeight(1.5);
line(110,100,420,140);

//Schnittlinie #2
strokeWeight(0.5);
line(180,80,130,380);

//Schnittlinie #3
line(130,90,440,280);

line(210,95,84,310);

strokeWeight(0.2);
line(310,70,289,440);

line(329,60,308,420);

strokeWeight(1.5);
line(319.5,63,300,395);

strokeWeight(0.5);
line(150,370,240,400);

line(140,385,220,360);

line(130,212,410,280);

line(130,222,410,290);

line(270,360,340,340);
line(270,370,340,350);
line(270,380,340,360);

strokeWeight(0.8);
line(50,280,420,310);

line(55,275,400,350);

fill(c9);
noStroke();
ellipse(321,377,20,20);

ellipse(80,320,10,10);

//Schnittpunkt - Linie
fill(c9);
noStroke();
ellipse(260,120,30,30);

//grüner Punkt
fill(c9);
noStroke();
ellipse(310,230,20,20);

fill(c7);
stroke(c9);
strokeWeight(5);
ellipse(90,180,30,30);

fill(c7);
stroke(c9);
strokeWeight(2);
ellipse(210,70,10,10);

fill(c9);
noStroke();
ellipse(220,380,5,5);

fill(c11);
stroke(c9);
ellipse(370,330,10,10);

