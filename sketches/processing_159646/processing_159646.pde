
size(600,600);
background(178, 229, 255);


//left eye
stroke(208,180,232);
strokeWeight(2);
fill(255,255,255);
strokeWeight(3);
ellipse(150, 80, 190, 90);
stroke(180,191,232);
strokeWeight(8);
fill(227,180,232);
ellipse(150,75, 85,75);
//clouds in eye
fill(252, 252, 252);
noStroke();
ellipse(150, 80, 40, 20);
ellipse(160, 75, 25, 25);
ellipse(170,85, 50, 20);
ellipse(175, 75, 15, 10);
ellipse(135, 65, 15, 8);
ellipse(132, 60, 10, 8);
ellipse(130, 65, 11, 7);

//left eyebrow
//noFill();
//stroke(180,188,255);
//strokeWeight(3);
//beginShape();
//curveVertex(40,110);
//curveVertex(80, 30);
//curveVertex(220, 30);
//curveVertex(222, 100);
//curveVertex(225, 165);
//endShape();
//arc(90, 30, 40, 20, HALF_PI, PI);
//arc(100, 30, 40, 20, HALF_PI, PI);
//arc(110, 30, 40, 20, HALF_PI, PI);

//right eye
stroke(208,180,232);
strokeWeight(2);
fill(255,255,255);
strokeWeight(3);
ellipse(400, 80, 190, 90);
stroke(180,191,232);
strokeWeight(8);
fill(227,180,232);
ellipse(400,75, 85, 75);
//clouds in eye
fill(252, 252, 252);
noStroke();
ellipse(410, 70, 40, 20);
ellipse(400, 65, 25, 25);
ellipse(395, 75, 50, 20);
ellipse(382, 65, 15, 10);
ellipse(408, 100, 15, 10);
ellipse(415, 95, 10, 8);
ellipse(410, 96, 8, 10);

//right eyebrow
//noFill();
//stroke(180,188,255);
//strokeWeight(3);
//beginShape();
//curveVertex(310,110);
//curveVertex(330, 30);
//curveVertex(470, 30);
//curveVertex(222, 100);
//curveVertex(475, 165);
//endShape();


//clouds
noStroke();
fill(255,255,255);
ellipse(100,200, 350,50);
ellipse(40, 170, 75, 30);
ellipse(90, 170, 75, 60);
ellipse(150, 170, 75, 40);
ellipse(210, 180, 75, 30);
ellipse(400,500, 350,50);
ellipse(340, 470, 75, 30);
ellipse(390, 470, 75, 60);
ellipse(450, 470, 75, 40);
ellipse(480, 300, 250, 50);
ellipse(450, 270, 75, 30);
ellipse(580,320, 75, 30);
ellipse(510, 280, 75, 40);
ellipse(60, 400, 300, 50);
ellipse(80, 370, 90, 20);
ellipse(10, 370, 50, 20);
ellipse(10,430, 80, 20);

//nose
noFill();
beginShape();
stroke(180,191,232);
strokeWeight(3);
curveVertex(255,  100);
curveVertex(255,  120);
curveVertex(230, 250);
curveVertex(265, 300);
curveVertex(305, 250);
curveVertex(290, 120);
curveVertex(320, 150);
endShape();
noFill();
ellipse(265, 265, 100, 65);

//lips
noFill();
stroke(255,180,222);
//arc(265, 320, 200, 100, 0, PI);
//fill(255,180,222);
ellipse(250, 355, 65, 25);
ellipse(280, 355, 65, 25);
ellipse(265, 375, 75, 30);

//face
stroke(167, 175, 255);
ellipse(275,100, 500, 750);



