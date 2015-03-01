
//A snowman
size(800,700);
background(116,193,250);


//the first ellipse(the last part)
strokeWeight(3);
stroke(000,95);
fill(250,250,250);
ellipse(400,400,300,200);


//the second ellipse(the middle body)
ellipse(400,250,200,200);


//the third ellipse(the head)
ellipse(400,125,100,100);


//the left arm
stroke(162,83,23);
line(300,250,250,200);


//the fingers
line(250,200,252,180);
line(250,200,230,180);
line(250,200,228,200);


//the right arm
line(500,250,550,200);


//then fingers again
line(550,200,548,180);
line(550,200,570,180);
line(550,200,572,200);


//cloth
stroke(255,130,111);
fill(245,228,171);
rect(395,180,10,60);


//buttons
fill(188,32,32);
stroke(229,122,14);
ellipse(400,190,10,10);
ellipse(400,210,10,10);
ellipse(400,230,10,10);


//eyes
stroke(000);  
fill(000);
ellipse(375,125,10,10);
ellipse(425,125,10,10);


//light reflected in eyes
strokeWeight(1);
fill(250,250,250);
ellipse(377,123,7,7);
ellipse(427,123,7,7);


//mouth
strokeWeight(2);
fill(250,250,250);
stroke(000);
arc(398,130,60,67,QUARTER_PI,QUARTER_PI+HALF_PI);


//nose
stroke(242,27,27);
strokeWeight(6);
line(385,140,398,130);


//hat
stroke(000,99);
strokeWeight(3);
fill(209,185,185);
arc(400,30,100,150,QUARTER_PI,QUARTER_PI+HALF_PI);
stroke(209,185,185);


//Some gifts
stroke(234,226,59);
strokeWeight(5);
fill(64,203,125);
rect(600,400,100,80);


//vertical line
line(650,400,650,480);


//cross line
line(600,440,700,440);


//left side
strokeWeight(7);
stroke(250,0,0);


line(650,400,620,380);
line(650,400,615,385);
line(650,400,616,390);
line(650,400,624,375);
line(650,400,628,370);
line(650,400,632,365);
line(650,400,636,364);


//right side
line(650,400,670,365);
line(650,400,674,365);
line(650,400,678,370);
line(650,400,682,375);
line(650,400,686,385);
line(650,400,690,385);
line(650,400,688,380);


//finally
strokeWeight(12);
stroke(252,84,143);
point(650,398);




