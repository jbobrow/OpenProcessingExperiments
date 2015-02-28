
size(600,600);

//background design
background(160, 110, 70);
fill(170, 130, 80);
noStroke();
for (int i = 0; i < 5; i++){
  for (int j = 0; j < 8; j++) {
    rect(i * 140, j * 90, 100, 60, 10);     
  }
}

//outline
stroke(0);
strokeWeight(15);
noFill();
beginShape();
curveVertex(200, 200);
curveVertex(200, 200);
curveVertex(195, 350);
curveVertex(181, 450);
curveVertex(165, 550);
curveVertex(160, 600);
curveVertex(160, 600);
endShape();

beginShape();
curveVertex(450, 200);
curveVertex(450, 200);
curveVertex(465, 350);
curveVertex(470, 450);
curveVertex(480, 550);
curveVertex(490, 600);
curveVertex(490, 600);
endShape();

beginShape();
curveVertex(260, 100);
curveVertex(260, 100);
curveVertex(300, 75);
curveVertex(350, 75);
curveVertex(390, 100);
curveVertex(390, 100);
endShape();

//body

noStroke();
fill(255, 245, 200);

beginShape();

curveVertex(168, 600);
curveVertex(168, 600);
curveVertex(170, 550);
curveVertex(188, 450);
curveVertex(196, 350);
curveVertex(204, 200);
curveVertex(253, 110);
curveVertex(300, 80);
curveVertex(350, 80);
curveVertex(400, 110);
curveVertex(449, 200);
curveVertex(462, 350);
curveVertex(466, 450);
curveVertex(475, 550);
curveVertex(485, 600);
curveVertex(485, 600);
endShape();

//ears
fill(0);
noStroke();
arc(200, 130, 100, 100, radians(90), radians(330), OPEN);
arc(450, 130, 100, 100, radians(210), radians(450), OPEN);

//eyes
stroke(0);
fill(240, 200, 150);
strokeWeight(15);
point(285, 200);
point(284, 200);
point(283, 201);
noStroke();
ellipse(385, 210, 80, 70);
stroke(0);
point(385, 210);
point(386, 211);

//nose
noStroke();
fill(170, 130, 100);
triangle(335, 200, 320, 248, 350, 250);

//whiskers
stroke(0);
strokeWeight(7);
line(180, 260, 100, 210);
line(180, 260, 100, 214);
line(180, 280, 100, 300);
line(180, 280, 100, 304);
line(480, 260, 550, 230);
line(480, 260, 550, 234);
line(480, 280, 550, 301);
line(480, 280, 550, 305);

//mouth
noFill();
strokeWeight(6);
arc(335, 250, 150, 100, 0, PI);
arc(335, 250, 147, 100, 0, PI);
arc(335, 250, 144, 100, 0, PI);
strokeWeight(12);
point(260, 253);
point(408, 253);

//hands
noStroke();
fill(0);
quad(279, 400, 296, 523, 233, 527, 217, 412);
ellipse(284, 523, 22, 18);
ellipse(266, 528, 30, 26);
ellipse(247, 525, 27, 19);
fill(255, 245, 200);
quad(275, 400, 288, 520, 240, 521, 220, 410);
ellipse(282, 518, 13, 13);
ellipse(265, 525, 19, 18);
ellipse(246, 520, 14, 13);

fill(0);
quad(379, 400, 365, 523, 425, 527, 440, 412);
ellipse(377, 522, 23, 20);
ellipse(396, 528, 27, 23);
ellipse(415, 525, 20, 19);
fill(255, 245, 200);
quad(382, 399, 373, 520, 418, 523, 437, 409);
ellipse(379, 518, 14, 14);
ellipse(396, 522, 17, 18);
ellipse(412, 520, 12, 12);

//texture
PGraphics sparkles = createGraphics(600, 600);
sparkles.beginDraw();
sparkles.background(180, 160, 130, 170);
for (int i = 0; i < 2000; i++) {
  sparkles.noStroke();
  float randX = random(700) - 50;
  float randY = random(700) - 50;
  sparkles.fill(255, 255, 255, 8);
  sparkles.ellipse(randX, randY, 100, 50);
}

for (int i = 0; i < 15; i++) {
  sparkles.fill(255, 255, 230);
  sparkles.ellipse(random(600), random(600), 6, 6);
}

sparkles.endDraw();
//blend(sparkles, 0, 0, 600, 600, 0, 0, 600, 600, MULTIPLY);
//blend(sparkles, 0, 0, 600, 600, 0, 0, 600, 600, BURN);
