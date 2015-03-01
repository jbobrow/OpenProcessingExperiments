
size(500, 400);
background(153, 215, 222);
noStroke();

//Hole
fill(180, 67, 23);  
ellipse(250, 300, 360, 210);
fill(170, 60, 20);
ellipse(250, 291, 340, 180);
fill(0, 0, 0);                      
ellipse(250, 285, 320, 170);

//Face/head
fill(129, 204, 151);
noStroke();
ellipse(250, 270, 240, 140);
fill(0, 0, 0, 20);
ellipse(250, 205, 150, 200);
fill(129, 204, 151);
ellipse(250, 190, 160, 210);

//mouth
noStroke();
fill(218, 218, 218);
arc(250, 240, 100, 80, 0, PI);
fill(225, 225, 225);
arc(250, 240, 100, 45, 0, PI);

//eyes 
noStroke();
fill(0, 0, 0, 20);
ellipse(203, 165, 56, 76);
ellipse(297, 165, 56, 76);
fill(225, 225, 225);
ellipse(200, 160, 50, 70);
ellipse(300, 160, 50, 70);

//antennas 
stroke(0, 0, 0);
noFill();
strokeWeight(5);
stroke(120, 200, 145);
arc(180, 100, 70, 90,PI+HALF_PI, TWO_PI);
arc(320, 100, 70, 90,PI, PI+HALF_PI);
noStroke();
fill(129, 204, 151);
ellipse(170, 60, 30, 30);
ellipse(330, 60, 30, 30);
fill(0, 0, 0, 10);
ellipse(168, 62, 25, 25);
ellipse(332, 62, 25, 25);

//body
strokeWeight(1);
stroke(0, 0, 0, 30);
line(170, 300, 180, 330);
line(330, 300, 320, 330);
