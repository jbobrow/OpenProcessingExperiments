
size(500, 500);
background(255,255,255);
smooth();

fill(0, 150, 0);
beginShape();
//head
ellipse(300, 200, 300, 200);
//spikes
line(430, 100, 400, 125);
line(430, 100, 430, 150);
line(400, 70, 370, 112);
line(400, 70, 400, 125);
line(370, 40, 340, 103);
line(370, 40, 370, 110);
line(340, 20, 340, 102);
//arc - to - spike
line(340, 20, 275, 80);
endShape(CLOSE);

noFill();
beginShape();
arc(250, 80, 50, 50, 0, PI/2);
endShape();

//eyes
fill(255, 255, 255);
beginShape();
ellipse(200, 170, 30, 25);
ellipse(260, 170, 30, 25);
endShape();

//pupils
fill(0, 0, 0);
beginShape();
ellipse(200, 170, 10, 10);
ellipse(260, 170, 10, 10);
endShape();


//Mouth
noFill();
arc(200, 220, 60, 60, 0.4, PI/2);

//body
fill(0, 0, 0);
beginShape();
line(170, 350, 230, 290);
line(400, 350, 340, 296);
line(170, 350, 170, 500);
line(400, 350, 400, 500);
line(230, 290, 275, 370);
line(340, 296, 275, 370);
line(275, 370, 275, 500);
ellipse(285, 400, 10, 10);
ellipse(285, 430, 10, 10);
ellipse(285, 460, 10, 10);
endShape(CLOSE);

//bowtie
fill(0, 0, 0);
beginShape();
float theX = 280;
float theY = 255;
int bowtieDiam = 10;
triangle(theX+20, theY+50, theX+20, theY+70, theX-8, theY+60);
triangle(theX-20, theY+50, theX-20, theY+70, theX+8, theY+60);
ellipse(theX, theY+60, bowtieDiam, bowtieDiam);
endShape();

//pocket
line(325, 400, 325, 430);
line(375, 400, 375, 430);
line(325, 430, 350, 435);
line(350, 435, 375, 430);
