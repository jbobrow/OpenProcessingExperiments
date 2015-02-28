
size(340, 600);
smooth();
strokeWeight(2);
background(204);
ellipseMode(RADIUS);

//neck
stroke(102);
line(150, 300, 150, 190);
line(170, 300, 170, 190);
line(190, 300, 190, 190);

//left leg
stroke(102);
line(100, 530, 100, 490);
line(120, 530, 120, 490);
line(140, 530, 140, 490);

//right leg
stroke(102);
line(200, 530, 200, 490);
line(220, 530, 220, 490);
line(238, 530, 238, 490);


//left arm
stroke(102);
line(40, 330, 100, 250);
line(50, 340, 100, 290);
line(56, 350, 100, 310);

stroke(255);
fill(120);
quad(40, 330, 60, 350, 50, 360, 30, 340);

//right arm
stroke(102);
line(300, 330, 240, 250);
line(290, 340, 240, 290);
line(284, 350, 240, 310);

stroke(255);
fill(120);
quad(300, 330, 280, 350, 290, 360, 310, 340);
noStroke();

// Antennae
stroke(0);
smooth(); 
strokeWeight(6); 
strokeJoin(ROUND);
line(170, 310, 20, 110);
line(170, 310, 320, 130);

line(70, 110, 20, 190);
line(80, 130, 40, 190);
line(90, 150, 60, 190);

line(260, 170, 280, 210);
line(270, 170, 290, 190);

strokeWeight(2);

//body
noStroke();
fill(0);
rect(100, 250, 140, 220);
stroke(255);
fill(120);
rect(100, 470, 140, 20);
//circles
fill(255);
ellipse(170, 310, 40, 40);
fill(0);
ellipse(170, 310, 30, 30);
fill(255);
ellipse(170, 310, 20, 20);
fill(0);
ellipse(170, 310, 10, 10);
fill(255);
ellipse(170, 310, 2, 2);


//head
noStroke();
fill(0);
ellipse(170, 130, 70, 70);

//eyes

fill(255); 
ellipse(150, 120, 17, 17);
fill(255); 
ellipse(190, 120, 17, 17);
fill(0); 
ellipse(150, 120, 8, 8);
fill(0); 
ellipse(190, 120, 8, 8);
fill(0, 255, 0); 
ellipse(150, 120, 3, 3);
fill(225, 0, 0); 
ellipse(190, 120, 3, 3);

//smile
fill(225);
arc(170, 165, 20, 20, QUARTER_PI, PI+QUARTER_PI);

//hairs
fill(102);
ellipse(140, 51, 15, 15);
ellipse(110, 70, 15, 15);
ellipse(90, 100, 15, 15);
//ellipse(170, 51, 15, 15);
triangle(160,60,180,60,170,0);
ellipse(200, 51, 15, 15);
ellipse(230, 70, 15, 15);
ellipse(250, 100, 15, 15);

//hands
fill(0);
ellipse(30, 360, 15, 15);
ellipse(10, 350, 8, 8);
ellipse(10, 370, 8, 8);
ellipse(25, 381, 8, 8);
ellipse(45, 375, 8, 8);

ellipse(310, 360, 15, 15);
ellipse(330, 350, 8, 8);
ellipse(330, 370, 8, 8);
ellipse(315, 381, 8, 8);
ellipse(295, 375, 8, 8);

//feets
fill(0);
ellipse(120, 550, 30, 30);
ellipse(220, 550, 30, 30);

//lace
stroke(225);
//fill(225);
quad(100, 520, 140, 540, 140, 520, 100, 540);
quad(200, 520, 240, 540, 240, 520, 200, 540);

//bow
stroke(255);
fill(120);
quad(140, 200, 200, 240, 200, 200, 140, 240);


