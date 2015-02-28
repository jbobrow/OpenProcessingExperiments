
background(71,85,86);
size(600, 600);
noStroke();
fill(226, 214, 190);
rect(275, 300, 50, 130);
ellipse(300, 200, 350, 300);
//ears
arc(140, 210, 115, 70, radians(90), radians(360) );
arc(460, 210, 115, 70, radians(-90), radians(90) );
//eyes and glasses
fill(255, 255, 255, 80);
rect(145, 160, 130, 90, 15);
rect(325, 160, 130, 90, 15);
fill(122, 149, 130);
ellipse(210, 210, 10, 20);
ellipse(390, 210, 10, 20);
//nose
ellipse(300, 250, 50, 30);
//mouth
stroke(122, 149, 130);
strokeWeight(4);
noFill();
arc(299, 300, 40, 30, radians(0), radians(180));
//hair
noStroke();
fill(161, 149, 123);
beginShape();
vertex(450, 110);
vertex(445, 70);
vertex(445, 100);
vertex(400, 60);
vertex(300, 20);
vertex(350, 50);
vertex(300, 44);
vertex(210, 50);
vertex(190, 44);
vertex(200, 50);
vertex(225, 58);
vertex(180, 80);
vertex(150, 100);
vertex(120, 150);
vertex(122, 180);
vertex(130, 160);
vertex(130, 200);
vertex(150, 170);
vertex(160, 140);
vertex(180, 120);
vertex(170, 150);
vertex(180, 200);
vertex(200, 130);
vertex(220, 110);
vertex(245, 100);
vertex(225, 122);
vertex(210, 150);
vertex(190, 200);
vertex(230, 140);
vertex(280, 105);
vertex(320, 100);
vertex(260, 130);
vertex(210, 180);
vertex(280, 140);
vertex(310, 125);
vertex(360, 110);
vertex(330, 135);
vertex(250, 160);
vertex(350, 150);
vertex(430, 130);
vertex(445, 155);
vertex(455, 200);
vertex(458, 178);
vertex(455, 150);
vertex(460, 160);
vertex(475, 220);
vertex(470, 150);
vertex(460, 130);
vertex(485, 145);
endShape();
//sweater
fill(115, 95, 86);
beginShape();
vertex(300, 430);
vertex(275, 395);
vertex(275, 375);
vertex(245, 400);
vertex(160, 450);
vertex(180, 600);
vertex(420, 600);
vertex(440, 450);
vertex(325, 375);
vertex(325, 395);
vertex(300, 430);
endShape();
//shirt
fill(122, 149, 130);
beginShape();
vertex(275, 375);
vertex(250, 375);
vertex(245, 400);
vertex(255, 410);
vertex(265, 390);
vertex(300, 430);
vertex(275, 395);
endShape();
beginShape();
vertex(325, 375);
vertex(350, 375);
vertex(355, 400);
vertex(345, 410);
vertex(335, 390);
vertex(300, 430);
vertex(325, 395);
endShape();



