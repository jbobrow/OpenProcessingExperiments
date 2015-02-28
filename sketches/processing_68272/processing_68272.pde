
// name: Peter Teguh Salim
// e-mail: psalim@andrew.cmu.edu
// Copyright: Â© Peter Teguh Salim August 2012  Pittsburgh, PA 15213  All Rights Reserved

size(400,400);
background (255,240,189);

// T section cut
fill(0);
rect(130, 90, 100, 20);
rect(170, 190, 20, 160);
rect(130, 110, 60, 60);
noStroke();
fill(255,240,189); // to subtract
ellipseMode(CENTER);
ellipse(130, 170, 80, 120);

// P section cut
fill(0);
noStroke();
rect(30, 150, 20, 200);
arc(100, 160, 60, 140, 3*PI/2, 5*PI/2);
rect(30, 90, 70, 20);
rect(60, 210, 40, 20);

// S section cut
arc(280, 190, 100, 200, PI, 2*PI);
fill(255,240,189); // to subtract
arc(280, 190, 60, 160, PI, 2*PI);
fill(0);
rect(230, 190, 20, 50);
rect(250, 230, 20, 10);
arc(310, 290, 40, 120, 3*PI/2, 5*PI/2);
rect(290, 230, 20, 40);
rect(250, 250, 40, 20);
rect(230, 330, 80, 20);
rect(230, 310, 20, 20);

// P
noFill();
stroke(0, 0, 0, 70);
arc(130, 130, 60, 140, 3*PI/2, 5*PI/2);
line(130, 60, 100, 90);
line(135, 200, 105, 230);
line(70, 50, 30, 90);
line(270, 50, 70, 50);
line(130, 60, 160, 60);
rect(60, 270, 110, 20);
line(60, 210, 80, 190);
line(80, 190, 70, 190);
line(70, 190, 100, 160);
line(70, 190, 70, 200);
rect(70, 230, 30, 30);
line(60, 270, 70, 260);
line(100, 260, 130, 230);
line(130, 230, 130, 205);
line(130, 220, 170, 220);
line(50, 350, 90, 310);
line(90, 310, 90, 290);
line(90, 310, 170, 310);
line(50, 150, 90, 110);
line(30, 150, 70, 110);
line(130, 90, 160, 60);
fill(255,240,189);
noStroke();
triangle(147, 75, 153, 90, 160, 80); 

// T
stroke(0,0,0,70);
noFill();
beginShape();
vertex(170, 190);
vertex(220, 140);
vertex(220, 160);
vertex(190, 190);
endShape();
quad(230, 90, 270, 50, 270, 70, 230, 110);
line(240, 100, 240, 130);
line(220, 160, 200, 160);
beginShape();
vertex(240, 240);
vertex(240, 300);
vertex(190, 350);
endShape();

// S
quad(230, 310, 270, 270, 290, 270, 230, 330);
line(230, 350, 310, 270);
line(250, 250, 260, 240);
beginShape();
vertex(290, 230);
vertex(320, 200);
vertex(300, 200);
vertex(300, 210);
vertex(310, 210);
endShape();
quad(270, 230, 300, 200, 300, 210, 270, 240);
line(250, 230, 300, 180);
line(300, 180, 310, 180);
line(300, 180, 300, 110);
line(260, 100, 310, 50);
line(330, 190, 370, 150);
arc(310, 150, 120, 200, 3*PI/2, 2*PI);
beginShape();
vertex(310, 230);
vertex(360, 180);
vertex(340, 180);
endShape();
arc(360, 240, 40, 120, 3*PI/2, 5*PI/2);
line(313, 350, 363, 300);

// scale figures
noStroke();
fill(140, 7, 7);
ellipseMode(CENTER);
ellipse(50, 50, 10, 10);
ellipse(80, 300, 10, 10);
ellipse(110, 300, 10, 10);
ellipse(212, 200, 10, 10);
ellipse(260, 290, 10, 10);
stroke(140, 7, 7);
line(80, 300, 80, 330);
line(80, 330, 75, 340);
line(80, 330, 85, 340);
line(110, 300, 110, 330);
line(110, 330, 105, 340);
line(110, 330, 115, 340);
beginShape();
noFill();
vertex(50, 50);
vertex(50, 80);
vertex(38 ,75);
vertex(40, 80);
endShape();
beginShape();
vertex(200, 180);
vertex(210, 200);
vertex(210, 230);
vertex(205, 240);
vertex(210, 230);
vertex(215, 240);
endShape();
beginShape();
vertex(260, 290);
vertex(260, 320);
vertex(265, 310);
vertex(270, 320);
endShape();

// fills
fill(7, 42, 98, 98);
noStroke();

beginShape();
vertex(30, 90);
vertex(70, 50);
vertex(270, 50);
vertex(230, 90);
vertex(130, 90);
vertex(160, 60);
vertex(130, 60);
vertex(100, 90);
endShape();

fill(98, 7, 14, 98);
beginShape();
vertex(60, 270);
vertex(70, 260);
vertex(100, 260);
vertex(130, 230);
vertex(130, 220);
vertex(170, 220);
vertex(170, 270);
endShape();

fill(210, 210, 21, 98);
beginShape();
vertex(250, 230);
vertex(300, 180);
vertex(310, 180);
vertex(310, 190); 
vertex(330, 190);
vertex(340, 180);
vertex(360, 180);
vertex(310, 230);
vertex(290, 230);
vertex(320, 200);
vertex(300, 200);
vertex(270, 230);
endShape();
triangle(250, 330, 310, 270, 310, 330);

//instagrammed
fill(255, 240, 189, 42);
rect(0,0,400,400);

//saveFrame("hw1.jpg");

