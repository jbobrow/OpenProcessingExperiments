
size(500,500);
background(0,200,200); //canvas size and color

noStroke(); //background design
fill(255,50,50,150);
ellipse(0,500,400,400);

strokeWeight(15); //thick lines
stroke(250,50,100,100);
line(0,15,500,15);
line(485,0,485,500);
strokeWeight(10); //thinner lines
stroke(255,0,255,150);
line(0,30,500,30);
line(470,0,470,500);
strokeWeight(5); //thinnest lines
stroke(200,50,150,50);
line(0,45,500,45);
line(455,0,455,500);

strokeWeight(1); //thick dark pink lines
stroke(200,0,250);
line(10,0,10,500);
line(0,490,500,490);
strokeWeight(3); //thinner pink lines
stroke(250,80,190);
line(30,0,30,490);
line(10,470,500,470);
strokeWeight(5); //purple thin lines
stroke(200,30,150);
line(50,0,50,470);
line(30,450,500,450);



noFill();
stroke(50);
strokeWeight(10);
curve(100,200,275,265,285,310,200,150); //arm2

strokeWeight(1);
fill(75);
rect(240,310,40,50,15,17,17,15); //wheels
rect(260,340,40,50,15,17,17,15);
fill(0);
ellipse(270,365,25,50); //black
fill(255,255,0,100);
ellipse(270,365,10,20); //yellow

fill(200);
rect(150,240,125,125); //body
rect(176,266,75,75); //door
fill(0);
rect(185,285,5,40);

fill(200);
quad(105,195,230,195,275,240,150,240);
fill(175);
quad(105,195,150,240,150,365,105,320);
noStroke();
fill(185);
quad(140,205,220,205,245,230,165,230); //shadow


stroke(0);
fill(200);
rect(110,255,20,20,15,7,7,15); //arm1
fill(175);
ellipse(115,265,10,20);

fill(75);
rect(70,285,40,50,15,17,17,15); //wheels
rect(90,310,40,50,15,17,17,15);
rect(110,340,40,50,15,17,17,15);
fill(0);
ellipse(80,310,25,50); //black
ellipse(100,335,25,50);
ellipse(120,365,25,50);
fill(255,250,0); //yellow
ellipse(80,310,10,20);
ellipse(100,335,10,20);
ellipse(120,365,10,20);

noFill();
stroke(50);
strokeWeight(10);
curve(450,350,111,265,160,310,305,150); //arm1

strokeWeight(1);
fill(160);
ellipse(175,299,15,15); //thumbs
ellipse(270,300,15,15);
ellipse(165,310,30,30); //hands
ellipse(280,310,30,30);
noStroke();
fill(200);
ellipse(169,309,20,20); //highlights
ellipse(276,309,20,20); 

stroke(0);
fill(255);
ellipse(220,310,100,30); //plate
ellipse(220,305,100,30);
stroke(150);
ellipse(220,305,60,15);

stroke(0);
fill(200);
rect(188,200,20,20); //neck
fill(175);
quad(178,190,188,200,188,220,178,210); 

fill(200);
rect(175,125,75,75); //head
quad(150,100,225,100,250,125,175,125);
fill(175);
quad(150,100,175,125,175,200,150,175); 


noStroke();
fill(255,0,0,100);
ellipse(170,75,15,15); //antenna
ellipse(230,75,15,15);
fill(255,0,0,50);
ellipse(170,75,20,20); 
ellipse(230,75,20,20);
stroke(0);
line(170,75,195,110); 
line(210,110,230,75);
fill(255,0,0);
ellipseMode(CENTER);
ellipse(170,75,10,10);
ellipse(230,75,10,10); 
fill(255,255,255,150); //antenna highlights
noStroke();
ellipse(170,75,5,5);
ellipse(230,75,5,5);
fill(255,255,255,255);
ellipse(170,75,2,2);
ellipse(230,75,2,2); 

fill(0,0,0); //black
ellipse(200,150,20,20); //eyes
ellipse(230,150,20,20);
fill(0,255,0,100); //transparent green
ellipse(200,150,15,15);
ellipse(230,150,15,15);
fill(0,255,0,125); 
ellipse(200,150,10,10);
ellipse(230,150,10,10);
fill(0,255,0); //green
ellipse(200,150,5,5);
ellipse(230,150,5,5); 

fill(0,0,0); //black
rect(195,170,40,15,7); //mouth
fill(200,0,0,125); //red
rect(198,171,10,13,7);
fill(200,0,0,175);
rect(200,173,6,10,7);
fill(200,200,0,150); //yellow
rect(210,171,10,13,7);
fill(200,200,0,200);
rect(212,173,6,10,7);
fill(250,100,0,200); //orange
rect(222,171,10,13,7);
fill(250,100,0,250);
rect(224,173,6,10,7);

stroke(0);
fill(150,250,200);
rectMode(CENTER);
rect(220,283,30,50,12); //cup
ellipse(220,265,30,15);
noStroke();
fill(150,100,100); //tea
ellipse(220,268,25,10);

noFill();
stroke(255,255,255,100); //steam
strokeWeight(3);
curve(240,290,220,260,220,245,300,360);
strokeWeight(2);
curve(235,550,210,262,205,253,260,150);
curve(110,330,230,262,235,247,450,200);

fill(255);
noStroke();
triangle(340,165,290,175,320,195); //speech bubble
ellipse(390,200,150,345); 

stroke(0);
textSize(24); 
fill(0, 100, 155); //speech いただきます
text("i",385,60);
text("t",385,90);
text("a",383,120);
text("d",383,150);
text("a",383,180);
text("k",383,210);
text("i",385,240);
text("m",380,270);
text("a",383,300);
text("s",383,330);
text("u",382,360);

stroke(0); 
strokeWeight(3); //bolts on face
point(180,130);
point(245,130);
point(180,195);
point(245,195);

point(155,245); //bolts on body
point(270,245);
point(155,360);
point(270,360);


