
size(2560, 1440);
background(255, 121, 217);

//face
noStroke();fill(219,217,218);
ellipse(width/2, height/2-200, 500, 600);
//neck/ torso
//move up higher in order of code
fill(200);quad(1215,810, 1345, 810, 1400, 1000, 1190, 1000);
fill(196,186,186);ellipse(1290, 1350, 650, 1000);

//camera
stroke(0); strokeWeight(4);fill(110);
rect(900, 400, 750, 400, 30);
//flash pyramid
//top quad
fill(135);
strokeWeight(1);quad(1280, 380, 1240,380, 1245, 360, 1275, 360);
//no stroke these two small quads and triangles 
//small triangle and quad
fill(170);quad(1245,360, 1190, 430, 1180, 430, 1240, 360);
noStroke();triangle (1245,360, 1190, 430, 1240, 380);
//no stroke mirror small quad and triangle 
//small triangle and quad

stroke(0);strokeWeight(0);quad(1275,360, 1330, 430, 1340, 430, 1280, 360);
strokeWeight(0);triangle (1275,360, 1330, 430, 1280, 380);
//large trapezoid
strokeWeight(1);stroke(1);fill(200);quad(1200,420, 1320, 420, 1280, 380, 1240,380);
fill(150);quad(1200,420,1320,420, 1330, 430, 1190, 430);
fill(180);
strokeWeight(3);ellipse(width/2+100, 620, 280, 280);
fill(180); //this is coloring all the small pieces
rect(900,450, 100, 300, 0, 15,15, 0);
rect(width/2+100, 430, 50, 15);
fill(240);ellipse(width/2+100, 620, 250, 250);
fill(80);ellipse(width/2+100, 620, 150, 150);
fill(5);
ellipse(width/2+100, 620, 70, 70);
fill(255); ellipse(width/2+80, 620, 30,30);

//hand
//thumb
//noFill();
//beginShape();
//curveVertex(900, 1400);
//curveVertex(800, 1300);
//curveVertex(800, 1200);
//curveVertex(700, 1000);
//curveVertex(700, 900);
//
//endShape();

//new arm/hand
noStroke();fill(219,217,218);
rect(600, 600, 200, 250);
triangle(600, 850, 800, 850, 800, 1050);
//thumb
ellipse(650,555, 58, 90);
//not bad could be better
//NEW knuckle
ellipse(623, 600, 50,65);
ellipse(665, 510, 60, 80);
ellipse(800, 600, 300, 50);
ellipse(800, 668, 300, 50);
ellipse(800, 720, 300, 50);
ellipse(800, 780, 250, 50);
// arm
ellipse(850,985, 150, 200); 
ellipse(795, 900, 85, 90);
//match torso ellipse
fill(196,186,186);
quad(790, 1050, 872,885, 1250, 1200, 980, 1190);
//quad(1250, 1200, 980, 1190, 1050, 1440, 1230, 1440);

//hair
fill (180);
triangle(1200, 300, 1150, 300, 1190, 280);
triangle(1200, 310, 1150, 300, 1190, 290);
triangle(1220, 300, 1170, 300, 1210, 280);
triangle(1180, 300, 1130, 300, 1160, 280);

fill(180);
triangle(1400, 300, 1350, 300, 1390, 280);
triangle(1300, 300, 1250, 300, 1290, 280);
triangle(1250, 300, 1200, 300, 1240, 280);

fill(30);triangle(1400, 270, 1350, 270, 1390, 250);
triangle(1300, 270, 1250, 270, 1300, 250);
triangle(1200, 270, 1150, 270, 1190, 250);
triangle(1200, 300, 1150, 300, 1190, 280);

fill(30);
triangle(1300, 250, 1150, 250, 1250, 200);
triangle(1400, 250, 1250, 250, 1350, 200);
triangle(1420, 270, 1270, 270, 1370, 200);
triangle(1300, 320, 1150, 320, 1250, 270);
triangle(1460, 330, 1310, 330, 1410, 280);

fill(120);
triangle(1440, 260, 1290, 260, 1390, 210);
triangle(1320, 260, 1170, 260, 1270, 210);
triangle(1340, 270, 1190, 270, 1290, 220);
triangle(1360, 240, 1210, 240, 1310, 190);
triangle(1200, 300, 1050, 300, 1150, 250);
triangle(1230, 320, 1080, 320, 1180, 270);

triangle(1350, 300, 1200, 300, 1100, 250);
triangle(1400, 300, 1250, 300, 1200, 250);
triangle(1380, 270, 1230, 270, 1330, 220);
triangle(1430, 280, 1280, 280, 1380, 230);
triangle(1300, 260, 1150, 260, 1100, 210);
triangle(1440, 260, 1290, 260, 1240, 210);
triangle(1460, 290, 1310, 290, 1260, 240);
triangle(1480, 320, 1330, 320, 1280, 270);


