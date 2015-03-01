
/*
Day1_2_byHangDoThiDuc
*/

size(800, 600);
/*blue words predefined functions ready to use
right-click "Find in Reference" to see more info, also related functions*/

//my character body
fill(0, 140, 110);
noStroke();
triangle(350, 250, 400, 250, 395, 450); //dark left leg
triangle(395, 250, 450, 250, 405, 450); //dark right leg
triangle(400, 150, 450, 250, 350, 250); //Oberkp
fill(0, 149, 125);
triangle(350, 250, 395, 450, 350, 430); //light left leg
triangle(405, 450, 450, 250, 450, 430); //light right leg
triangle(325, 100, 400, 120, 360, 180); //left ear
triangle(480, 120, 400, 120, 440, 180); //right ear
fill(120, 190, 180);
ellipse(400, 150, 120, 120); //head
triangle(375, 250, 385, 260, 385, 300); //left hand
triangle(425, 250, 415, 260, 415, 300); //right hand

//glasses
stroke(0, 0, 0);
strokeWeight(6);
noFill();
ellipse(365, 145, 55, 55);
ellipse(435, 145, 55, 55);
rectMode(CENTER);
rect(400, 145, 5, 5);
point(365, 145);
point(435, 145);

//mouth
fill(0, 140, 110);
noStroke();
triangle(390, 185, 410, 185, 400, 195);

//shoes
triangle(320, 460, 395, 450, 350, 430);
triangle(405, 450, 480, 460, 450, 430);


