
size(800, 500);
smooth();
strokeWeight(2);
background(160);
ellipseMode(RADIUS);

noStroke();
//Neck
/*line(380, 200, 380, 250);
line(420, 200, 420, 250);*/
fill(69, 59, 59);
rect(380, 200, 40, 60);

//Antenna
stroke(0);
line(400, 70, 400, 150);
noStroke();
fill(156, 15, 48);
ellipse(400, 75, 15, 15);

//Ears 
fill(156, 15, 48);
ellipse(340, 142, 10, 15); //left
fill(54, 141, 111);
rect(340, 127, 20, 30);
fill(156, 15, 48);
ellipse(460, 142, 10, 15); //right
fill(54, 141, 111);
rect(440, 127, 20, 30); 

//Head
/*rect(335, 90, 130, 100);*/
fill(72, 41, 14);
ellipse(400, 150, 50, 50); //upper face
fill(255);
ellipse(380, 150, 18, 40); //left eye
fill(0);
ellipse(380, 140, 10, 10);
fill(255);
ellipse(420, 150, 18, 40); //right eye
fill(0);
ellipse(420, 140, 10, 10);
fill(208, 196, 155);
ellipse(400, 180, 80, 35); //lower face
stroke(0);
fill(0);
ellipse(392, 160, 3, 3); //nose
ellipse(408, 160, 3, 3);
fill(255);
rect(365, 170, 70, 25); //mouth
fill(208, 196, 155);
//smile
arc(350, 183, 7, 10, radians(270), radians(450)); //using radians method
arc(450, 183, 7, 10, PI / 2, 3 * PI / 2); //using PI method
line(358, 183, 442, 183); //teeth: horizontal
line(383, 170, 383, 193); //teeth: vertical
line(400, 170, 400, 193);
line(418, 170, 418, 193);
noStroke();

//Arms
//arc(300, 400, 40, 170, PI, TWO_PI-PI/2); 
fill(69, 59, 59);
beginShape(); //(LEFT ARM)
vertex(300, 230); //points are clockwise
vertex(300, 320);
vertex(320, 400);
vertex(260, 400);
vertex(275, 283);
endShape(CLOSE);
fill(92, 79, 79);
triangle(280, 283, 290, 400, 265, 400); //highlights
fill(54, 141, 111);
rect(260, 380, 60, 40); //left hand
fill(69, 59, 59);
ellipse(266, 403, 4, 15); //fingers
ellipse(279, 403, 4, 15);
ellipse(292, 403, 4, 15);
ellipse(308, 408, 8, 8);
//arc(500, 380, 40, 150, TWO_PI-PI/2, TWO_PI); 
fill(69, 59, 59);
beginShape(); //(RIGHT ARM)
vertex(500, 230); //points are anticlockwise
vertex(500, 320);
vertex(480, 400);
vertex(540, 400);
vertex(525, 283);
endShape(CLOSE);
fill(92, 79, 79);
triangle(520, 283, 535, 400, 510, 400); //highlights
fill(54, 141, 111);
rect(480, 380, 60, 40); //right hand
fill(69, 59, 59);
ellipse(490, 408, 8, 8); //fingers
ellipse(508, 403, 4, 15); 
ellipse(521, 403, 4, 15);
ellipse(533, 403, 4, 15);

//Legs
fill(72, 41, 14);
triangle(376, 300, 354, 410, 394, 410); //left
triangle(424, 300, 410, 410, 450, 410); //right
fill(0);
arc(374, 420, 25, 30, PI, TWO_PI); //left foot
line(353, 420, 402, 420);
arc(430, 420, 25, 30, PI, TWO_PI); //right foot
line(403, 420, 454, 420);

//Body
fill(69, 59, 59);
ellipse(400, 330, 80, 50); //lower body
fill(72, 41, 14);
beginShape();
vertex(300, 230); //upper body
vertex(500, 230);
vertex(500, 280);
vertex(480, 330);
vertex(320, 330);
vertex(300, 280);
endShape(CLOSE);
fill(89, 55, 26);
rect(300, 240, 200, 30); //highlights
fill(116, 79, 46);
rect(300, 250, 200, 10);
fill(179, 163, 107);
ellipse(400, 310, 65, 70); //chest
fill(156, 15, 48);
ellipse(360, 280, 15, 15); //buttons
ellipse(440, 280, 15, 15);
fill(54, 141, 111);
ellipse(360, 280, 10, 10); 
ellipse(440, 280, 10, 10);
ellipse(400, 355, 5, 5);
stroke(255);
line(400, 270, 400, 350); //vertical
line(350, 310, 450, 310); //horizontal
line(370, 325, 430, 325);
line(390, 337, 410, 337);




