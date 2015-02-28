
size(300,300);
background(0,232,255);
smooth();
colorMode(RGB);

//fish-body
fill(255,145,0);
noStroke();
ellipse(150,150,55,40);

//fish-fin
stroke(208,3,255);
fill(208,3,255);
arc(155,167.5,25,25,PI/2,PI);
stroke(208,3,255);
fill(208,3,255);
triangle(178,150,200,137.5,200,167.5);

//fish-eye
stroke(255);
fill(0);
ellipse(135,150,5,5);

//sand
fill(232,225,183);
stroke(232,225,183);
rect(0,280,300,20);

//seaweed
stroke(66,206,54);
strokeWeight(4);
line(100,280,120,220);
line(120,220,110,200);
line(115,280,100,210);
line(95,280,100,260);
line(100,260,85,240);
line(85,240,95,220);
line(50,280,65,230);
line(100,280,45,250);
line(45,250,30,220);
line(30,220,45,210);
line(65,230,50,220);

//crab-body
fill(255,3,19);
stroke(255,3,19);
ellipse(250,255,50,25);

//crab-eyes
strokeWeight(2);
line(250,242.5,245,230);
line(250,242.5,255,230);
strokeWeight(5);
stroke(0);
point(255,230);
point(245,230);

//crab-claws
stroke(255,3,19);
strokeWeight(2);
line(225,255,210,260);
line(210,260,200,250);
line(275,255,290,260);
line(290,260,300,250);
quad(300,250,290,235,280,235,290,255);
quad(200,250,190,235,200,225,210,235);

//crab-legs
line(260,260.5,285,280);
line(255,260.5,275,280);
line(250,260.5,265,280);
line(225,260.5,205,280);
line(230,260.5,215,280);
line(235,260.5,225,280);

//bubbles
noFill();
stroke(255);
ellipse(125,120,10,10);
ellipse(135,90,10,10);






