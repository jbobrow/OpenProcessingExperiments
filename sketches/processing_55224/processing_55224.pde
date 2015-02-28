
background(175);
size(380,560);
smooth();

///HEAD
strokeWeight(4);
line(250,100,250,40);
strokeWeight(1);
fill(16,78,139);
ellipse(250,40,15,15);
noFill();

fill(70,130,180); //fill head blue
strokeWeight(3);
quad(120,100,260,100,260,200,120,200);
fill(0);
ellipse(140,140,10,10);
ellipse(240,140,10,10);
fill(255);
strokeWeight(2);
quad(150,160,230,160,230,180,150,180);

//TEETH
fill(198,226,255,255);
quad(160,160,170,160,170,180,160,180);
quad(180,160,190,160,190,180,180,180);
quad(200,160,210,160,210,180,200,180);
quad(220,160,230,160,230,180,220,180);
fill(255);

///BODY

fill(16,78,139); //blue body
strokeWeight(3);
quad(120,200,260,200,240,400,140,400);
noFill();
strokeWeight(2);

fill(255,0,0); //BOW TIE
ellipse(190,230,15,15);
triangle(160,220,182.5,230,160,240);
triangle(220,220,220,240,197.5,230);
fill(255);

fill(198,226,255,255); //door blue
quad(140,260,240,260,230,360,150,360);
noFill();
fill(0);
ellipse(220,300,10,10);

fill(255,0,0);
ellipse(160,380,5,10);
ellipse(180,380,5,10);
ellipse(200,380,5,10);
ellipse(220,380,5,10);
fill(255);

///ARMS
strokeWeight(10);
line(110,225,80,340);
strokeWeight(1);
strokeWeight(2);
fill(96,123,139);
ellipse(110,225,60,60);
fill(108,123,139);
strokeWeight(2);
arc(75,375,50,50,radians(95),radians(380));
line(75,375,98.49,383.55);
line(77.18,350.09,72.82,399.9);
fill(16,78,139);
ellipse(80,340,30,30);
fill(255);

strokeWeight(10);
line(270,225,300,340);
strokeWeight(1);
strokeWeight(3);
fill(108,123,139);
strokeWeight(2);
arc(305,375,50,50,radians(160),radians(445));
line(305,375,281.5,383.5);
line(302.82,350.1,307.17,399.9);
fill(96,123,139);
ellipse(270,225,60,60);
fill(16,78,139);
ellipse(300,340,30,30);
fill(255);

///TAIL
noStroke();
fill(255,0,0,100);
ellipse(190,420,120,20);
ellipse(195,445,100,20);
ellipse(200,470,90,20);
ellipse(210,495,80,18);
ellipse(225,520,70,16);
fill(175);
ellipse(190,420,90,10);
ellipse(195,445,80,10);
ellipse(200,470,70,10);
ellipse(210,495,60,9);
ellipse(225,520,50,8);

