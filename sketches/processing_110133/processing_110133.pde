
//"Sumi Ink Club Sketch"
//Viirj Kan 


size(640, 480);
background(255);
smooth();

int centerX = width/2;
int centerY = height/2;

translate(50,-30);
//Left: fat zig zag 
fill(224, 57, 38);
strokeWeight(30);
stroke(224, 57, 38);
line(0, 190, 36, 200);
line(36, 200, 7, 270);
line(7, 270, 74, 320);
line(74, 320, 0, 445);



//Left: zigzags 
strokeWeight(0);
beginShape();
vertex(0, 470);
vertex(0, 445);
vertex(144, 320);
vertex(188, 310);
vertex(0, 470);
vertex(144, 320);
vertex(80, 260);
vertex(110, 170);
vertex(32, 148);
vertex(60, 80);
vertex(65, 120);
vertex(138, 150);
vertex(115, 255);
vertex(188, 310);
endShape();



//Left: eyeball: top curve
noFill();
strokeWeight(10);
beginShape();
vertex(115, 255);
bezierVertex(115, 255, 180, 180, 220, 210);
endShape();
//Left: eyeball: bottom curve
beginShape();
vertex(115, 255);
bezierVertex(115, 255, 265, 265, 220, 210 );
endShape();

//left: eyeball: circle
ellipseMode(CENTER);
fill(224, 57, 38);
ellipse(200, 225, 45, 45);

//teardrop: left curve
strokeWeight(6);
beginShape();
vertex(206, 263);
bezierVertex(205, 263, 180, 300, 221, 320);
endShape();
//teardrop: right curve
strokeWeight(6);
beginShape();
vertex(205, 263);
bezierVertex(205, 263, 245, 300, 220, 320);
endShape();

//middle: zigzags
noFill();
strokeWeight(7);
strokeJoin(ROUND);
beginShape();
vertex(255, 108);
vertex(190, 164);
vertex(260, 166);
vertex(250, 252);
vertex(270, 216);
//intersection of 2 zigzags
vertex(252, 350);
vertex(295, 300);
vertex(300, 360);
vertex(350, 295);
vertex(310, 405);
vertex(360, 370);
vertex(360, 430);
vertex(396, 380);
vertex(400, 456);
vertex(425, 410);
vertex(450,460);
vertex(400,500);
endShape();

//zigzag 2: bottomLeft
beginShape();
vertex(252, 350);
vertex(183,392);
vertex(244,383);
vertex(226,436);
vertex(276,420);
vertex(270,464);
vertex(308,438);
vertex(313, 478);
endShape();

//zigzag middle 1: fatBold
strokeWeight(28);
beginShape();
vertex(450,460);
vertex(450,358);
vertex(388,331);
vertex(394,261);
vertex(337,240);
vertex(307,158);
endShape();

//zigzag middle 1: fatBold
strokeWeight(22);
beginShape();
vertex(450,460);
//eyeball intersect
vertex(504,307);
vertex(459,293);
vertex(466,210);
vertex(420,187);
vertex(405,104);
endShape();

//eyeball 2
//vertex(504,307);


//bottomLeft: HandShape: finger1
noFill();
strokeWeight(7);
beginShape();
curveVertex(31, 486);
curveVertex(31, 486);
curveVertex(68,  445);
curveVertex(111, 430);
curveVertex(168, 428);
curveVertex(175, 454);
curveVertex(121, 457);
curveVertex(121, 457);
endShape();


//bottomLeft: HandShape: finger2
beginShape();
curveVertex(175, 454);
curveVertex(175, 454);
curveVertex(189,457);
curveVertex(189,469);
curveVertex(128,475);
curveVertex(128,475);
endShape();

//bottomLeft: HandShape: finger3
beginShape();
curveVertex(189,469);
curveVertex(189,469);
curveVertex(183,474);
curveVertex(189,486);
curveVertex(189,486);
endShape();

//bottomLeft: HandShape: finger4Thumb
beginShape();
vertex(68,  445);
bezierVertex(68, 445, 109, 380, 117, 428);
endShape();

//bottomLeft: HandShape: arcs
//arc(50, 55, 50, 50, 0, HALF_PI);
strokeWeight(8);
arc(125,405,30,30,PI+QUARTER_PI,TWO_PI);
arc(125+15,405-15,30,30,PI+QUARTER_PI,TWO_PI);





//Eyeball#2: copied

//Left: eyeball: top curve
translate(290, centerY-370);
scale(1.2);
noFill();
strokeWeight(10);
beginShape();
vertex(115, 255);
bezierVertex(115, 255, 180, 180, 220, 210);
endShape();
//Left: eyeball: bottom curve
beginShape();
vertex(115, 255);
bezierVertex(115, 255, 265, 265, 220, 210 );
endShape();

//left: eyeball: circle
ellipseMode(CENTER);
fill(224, 57, 38);
ellipse(200, 225, 45, 45);

//teardrop: left curve
strokeWeight(6);
beginShape();
vertex(206, 263);
bezierVertex(205, 263, 180, 300, 221, 320);
endShape();
//teardrop: right curve
strokeWeight(6);
beginShape();
vertex(205, 263);
bezierVertex(205, 263, 245, 300, 220, 320);
endShape();




