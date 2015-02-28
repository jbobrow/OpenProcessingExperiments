
size(600,600);
//background(#FAEED1); //Background color - skintone
background(#FFFBF0);
smooth(); //Anti-Alias drawing

//Grid lines
/* line(100, 0, 100, 25);
line(200, 0, 200, 25);
line(300, 0, 300, 25);
line(400, 0, 400, 25);
line(500, 0, 500, 25);
line(600, 0, 600, 25);

line(0, 100, 25, 100);
line(0, 200, 25, 200);
line(0, 300, 25, 300);
line(0, 400, 25, 400);
line(0, 500, 25, 500);
line(0, 600, 25, 600); 
*/

// LEFT EYE 
fill(#432E01); //Sets fill for Left Pupil to Brown
noStroke(); // Left Pupil has no stroke
ellipse(150,200,40,40); //Left Pupil Circle

fill(#211701); // Sets fill for Left Inner Pupil to dark brown
noStroke(); // Left inner pupil has no stroke
ellipse(150,200,20,20); // Left Inner Pupil Circle

noFill();
stroke(#211701); //Sets stroke color for line above Left Pupil
strokeWeight(2);
bezier(115,200, 115, 190, 150, 160, 200, 200);
arc(110, 200, 10, 10, 0, PI);

//LEFT EYEBROW
noFill();
stroke(#211701); //Eyebrow Color - Dark Brown
strokeWeight(3);
bezier(80,130, 150, 90, 180, 90, 220, 110); // Top Curved Line
bezier(80,130, 140, 100, 180, 110, 220, 125); // Bottom Curved Line
line(220,110,220,125); // Line Connecting top and bottom curves

//RIGHT EYEBROW
noFill();
stroke(#211701); //Eyebrow Color - Dark Brown
strokeWeight(3);
bezier(330, 110, 370, 90, 400, 90, 470, 130); // Top Curved Line
bezier(330,125, 370, 110, 410, 100, 470, 130); // Bottom Curved Line
line(330,110,330,125); // Line Connecting top and bottom curves

// RIGHT EYE
fill(#432E01); //Sets fill for Right Pupil to Brown
noStroke(); // Right Pupil has no stroke
ellipse(400,200,40,40); //Right Pupil Circle

fill(#211701); // Sets fill for Right Inner Pupil to dark brown
noStroke(); // Right inner pupil has no stroke
ellipse(400,200,20,20); // Right Inner Pupil Circle

noFill();
stroke(#211701); //Sets stroke color for line above Right Pupil
strokeWeight(2);
bezier(350,200, 400, 160, 435, 190, 440, 200);
arc(445, 200, 10, 10, 0, PI);

//NOSES

fill(#211701);
ellipse(230, 360, 20, 3); // Left nostril
ellipse(310, 360, 20, 3); // Right nostril
noFill();
stroke(#211701);
strokeWeight(.5);
line(270, 155, 270, 300); 
strokeWeight(.25);
line(260, 150, 260, 305); 
arc (270, 340, 50, 50, radians(30), radians(270));

//HAIR
stroke(#211701);
strokeWeight(10);
line(275, -10, 310, 75);
line(290, -10, 338, 100);
line(306, -10, 359, 110);
line(322, -10, 375, 110);
strokeWeight(15);
line(340, -10, 407, 140);
stroke(#EADA98);
line(362, -10, 432, 150);
line(385, -10, 462, 170);
strokeWeight(20);
line(411, -10, 500, 200);
line(440, -10, 550, 250);
line(467, -10, 592, 280);
stroke(#211701);
line(490, -10, 610, 280);
line(500, -10, 620, 280);
strokeWeight(30);
line(530, -10, 650, 280);
line(560, -10, 680, 280);
line(580, -10, 700, 280);



//MOUTH
stroke(#D1A767);
fill(#D1A767);
strokeWeight(2);
bezier(150,430,240,380,300,380,400,430); //top lip line
bezier(150,430,240,520,300,520,400,430); //bottom lip 
stroke(#985E3A);
fill(#985E3A);
bezier(150,430,240,480,300,480,400,430); //inner mouth curve
stroke(#FFFFFF);
fill(#FFFFFF);
bezier(150,430,240,400,300,400,400,430); //teeth!
bezier(150,430,240,440,300,440,400,430); //teeth (down curve)

stroke(#000000);
fill(#000000);
point(380,480);
point(160,480);

//FACE LINES
strokeWeight(3);
stroke(#554615);
line(0,20,35,20);
line(0,40,35,40);
line(0,60,37,60);
line(0,80,37,80);
line(0,100,39,100);
line(0,120,40,120);
line(0,140,40,140);
line(0,160,42,160);
line(0,180,43,180);
line(0,200,45,200);
line(0,220,47,220);
line(0,240,50,240);
line(0,260,53,260);
line(0,280,54,280);
line(0,300,56,300);
line(0,320,57,320);
line(0,340,58,340);
line(0,360,60,360);
line(0,380,61,380);
line(0,400,63,400);
line(0,420,67,420);
line(0,440,72,440);
line(0,460,80,460);
line(0,480,90,480);
line(0,500,110,500);
line(0,520,135,520);
line(0,540,170,540);
line(0,560,200,560);
line(0,580,230,580);

