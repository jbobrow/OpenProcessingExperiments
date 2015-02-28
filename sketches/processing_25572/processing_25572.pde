
size(650, 800);
background(0,191,255);
text("family",300,50);
fill(205,92,92);
text("family", 300, 100);
fill(205,92,92,90);
text("family", 300, 150);
//BABY ROBOT - arms below
line(360, 225, 400, 300);
line(480, 300, 520, 235);
fill(238,232,170);
ellipse(515,245,25,25);
//legs
line(440, 380, 420, 440);
line(440, 380, 490, 440);
ellipse(420,460,40,40);
ellipse(500, 460, 40, 40);
//neck
line(440, 260, 440, 230);
//head
rect(405,180,70,50);
rect(415, 190,15,8); //left eye
rect(450, 190, 15, 8); //right eye
fill(0);
rect(419,194, 7,4);
rect(454, 194, 7, 4);
//mouth
rect(425,210,30,10); 
//body
fill(180,20,90);
rect(400, 260, 80, 120);
// BIG ROBOT lines for legs below
line(150,700, 200, 600);
line(350, 750, 200, 600);
//feet below
fill(60,190,87);
ellipse(150, 750, 100, 100);
ellipse(350, 750, 100, 100);
//body
rect(100, 300, 200, 300);
//arms
line(300, 400, 350, 250);
line(100, 400, 50, 350);
line(50, 350, 25, 500);
//hands
ellipse(360, 225, 50, 50);
ellipse(25, 500, 50, 50);
//neck
line(200, 300, 200, 250);
//head, eyes
rect(125, 150, 150, 100);
rect(155, 175, 25, 15); //eye left
rect(220, 175, 25, 15); //eye right
fill(0);
rect(163, 185, 10, 5); //eye left
rect(227, 185, 10, 5); //eye right
//mouth
fill(0);
rect(165, 215, 70, 25);
//arrow
fill(225);
noStroke();
beginShape();
vertex(110,530);
vertex(230,400);
vertex(220,390);
vertex(260,380);
vertex(260,420);
vertex(247, 410);
vertex(127, 540);
endShape(CLOSE);
//arrow
fill(225);
noStroke();
beginShape();
vertex(470,317.5);
vertex(470,330);
vertex(430,330);
vertex(430,340);
vertex(420, 322.5);
vertex(430,310);
vertex(430, 317.5);
endShape(CLOSE);


