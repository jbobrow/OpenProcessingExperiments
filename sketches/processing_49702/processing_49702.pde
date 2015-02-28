
size(900, 700);

background(90, 200, 230);

/*fill(200, 10, 10);
noStroke();
rect(450, 100, 10, 500);
stroke(0);*/

//DESK

strokeWeight(9);
fill(140, 70, 20);
quad(50, 500, 850, 500, 890, 650, 10, 650);
fill(130, 60, 20);
rect(10, 655, 880, 40);

//=============================================


//STAND
noFill();

//vertical arcs
//ellipse(600, 400, 400, 400);
strokeWeight(5);
arc(600, 400, 370, 400, .76*PI, 1.24*PI);
arc(300, 400, 370, 400, -.26*PI, .24*PI);

//base
fill(10);
quad(420, 521, 480, 521, 510, 581, 390, 581);
fill(20);
quad(425, 520, 475, 520, 490, 560, 410, 560);

strokeWeight(3);
line(510, 581, 490, 560);
line(390, 581, 410, 560);
strokeWeight(5);

//vertical straight
fill(0);
rect(445, 100, 10, 440);

ellipse(450, 540, 40, 20);


//=============================================

//LAMPSHADE
strokeWeight(4);
fill(100);

//filling in color
noStroke();
quad(360, 99, 270, 220, 630, 220, 540, 99);
stroke(0);

//sides
line(360, 99, 270, 220);
line(540, 99, 630, 220);

//top opening;
fill(255, 255, 50);
ellipse(450, 100, 180, 60);
fill(100);

//bottom;
arc(450, 220, 360, 110, 0, PI);

//cross;
strokeWeight(2);
stroke(200, 200, 70);
line(400, 76, 500, 122);
line(375, 114, 528, 88);

strokeWeight(2);

//============================================

//RAYS (lamp on!)

stroke(255, 255, 0);

//top
line(370, 10, 400, 60);
line(530, 10, 500, 60);
line(420, 5, 430, 50);
line(480, 5, 470, 50);

//bottom
line(340, 300, 300, 370);
line(560, 300, 600, 370);
line(380, 310, 360, 390);
line(520, 310, 540, 390);

//=============================================

//SHADOW (lamp off!)

/*fill(0);
stroke(0);
strokeWeight(3);
quad(480, 521, 512, 581, 530, 576, 500, 523);
quad();*/




