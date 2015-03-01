
size(600,600); // Jane Snowman
background(245);

stroke(196,216,240);
fill(196,216,240);
rect(0,378,600,222);

stroke(35);
fill(252);
ellipse(300,475,250,250); // bottom circle of snowman
ellipse(300,300,200,200); // middle circle of snowman
ellipse(300,135,150,150); // top circle of snowman

stroke(30,105,240);
fill(30,105,240);
ellipse(270,115,15,15);  // left eye
ellipse(330,115,15,15);  // right eye

stroke(255,111,0);
fill(255,111,0);
triangle(285,135,285,153,340,144); // nose

stroke(35);
fill(35);
rect(220,40,160,30); // base of hat
quad(240,40,360,40,360,5,240,5); // top of hat

stroke(255,13,0);
fill(255,13,0);
ellipse(300,270,20,20); // top botton
ellipse(300,330,20,20); // top botton

strokeWeight(7);
stroke(210,140,10);
noFill();
line(200,300,50,145); // left arm
line(50,200,100,200); // left bottom finger
line(100,200,100,150); // left top finger
line(400,300,550,145); // right arm
line(550,200,500,200); // right bottom finger
line(500,200,500,150); // right top finger
