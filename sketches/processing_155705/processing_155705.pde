
/*
Day1_1_byHangDoThiDuc
*/

size(800, 600);
/*blue words predefined functions ready to use
right-click "Find in Reference" to see more info, also related functions*/

//Pig body
fill(250, 160, 160);
stroke(250, 160, 160);
ellipse(140, 400, 800, 480);

//Pig ears - triangle (x,y, x,y, x,y) of 1st, 2nd, 3rd point
fill(250, 170, 170);
stroke(250, 170, 170);
/*fill, stroke, strokeWeight etc. will affect all lines below*/
triangle(220, 100, 300, 120, 220, 180);
triangle(580, 100, 500, 120, 580, 180);

//Pig head
fill(250, 190, 190);
stroke(250, 190, 190);
ellipse(400, 300, 450, 400);

//Pig nose
fill(250, 170, 170);
stroke(250, 170, 170);
rectMode(CENTER); 
rect(400, 350, 200, 100); 

//Pig nostrils
stroke(250, 100, 100);
strokeWeight(8);
line(350, 330, 350, 370);
line(450, 330, 450, 370);

//Pig eyes
fill(0, 0, 0);
stroke(0, 0, 0);
strokeWeight(10);
ellipse(300, 220, 20, 20);
ellipse(500, 220, 20, 20);
stroke(255, 255, 255);
point(300, 225);
point(500, 225);


