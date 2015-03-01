
/*-- Happy Korea Thanksgiving Day 2014 --*/

//background
size(560, 278);
background(#fec901);


/*-- draw moon --*/
//moon-1
noStroke();
smooth();
fill(255, 212, 73);
ellipse(200, 139, 350, 350);

//moon-2
noStroke();
smooth();
fill(255, 227, 88);
ellipse(200, 139, 285, 285);

//moon-3
noStroke();
smooth();
fill(255, 250, 212);
ellipse(200, 139, 225, 225);


/*-- draw korean character --*/
//chu
stroke(#222033);
strokeJoin(ROUND);
strokeWeight(20);
arc(130, 98, 50, 70, 0, HALF_PI);
arc(195, 98, 50, 70, radians(90), radians(180));

strokeWeight(10);
rect(140, 60, 44, 10);
rect(130, 88, 65, 10);
rect(125, 160, 85, 10);
rect(159, 163, 10, 50); 

stroke(#eb2715);
rect(115, 160, 10, 10);


//seok
stroke(#222033);
strokeWeight(20);
arc(240, 130, 50, 70, 0, HALF_PI);
arc(290, 130, 50, 70, radians(90), radians(180));

strokeWeight(10);
rect(305, 130, 43, 10);
rect(338, 110, 10, 55);
rect(306, 185, 40, 10); 
rect(336, 190, 10, 30); 

stroke(#2898fa);
rect(336, 220, 10, 5);


/*-- persimmon --*/
noStroke();
fill(255, 122, 33);
ellipse(420, 80, 50, 50);
fill(64, 179, 68);
ellipse(430, 60, 20, 10);
fill(230, 76, 0);
arc(420, 80, 50, 50, 0, HALF_PI);

fill(255, 122, 33);
ellipse(460, 150, 30, 30);
fill(64, 179, 68);
ellipse(470, 140, 10, 5);
fill(230, 76, 0);
arc(460, 150, 30, 30, 0, HALF_PI);


/*-- persimmon --*/
noStroke();
fill(255, 122, 33);
ellipse(420, 80, 50, 50);
fill(64, 179, 68);
ellipse(430, 60, 20, 10);
fill(230, 76, 0);
arc(420, 80, 50, 50, 0, HALF_PI);

fill(255, 122, 33);
ellipse(460, 150, 30, 30);
fill(64, 179, 68);
ellipse(470, 140, 10, 5);
fill(230, 76, 0);
arc(460, 150, 30, 30, 0, HALF_PI);


/*-- text --*/
textSize(20);
fill(77, 71, 71);
text("[Chu-seok]", 365, 200); 
textSize(10);
text("Happy Korea Thanksgiving Day 2014", 365, 220); 
text("by. Sujin Lee", 480, 250); 



/*-- save a TIFF file named "chuseok" -- */
save("chuseok.tif");
