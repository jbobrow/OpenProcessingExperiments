
size (500, 650);
smooth();
background (200);
noStroke();

//background


//hover device 
fill(0, 0, 255);
noStroke();
beginShape();
  vertex(215, 415);
  vertex(235, 440);
  vertex(265, 440);
  vertex(285, 415);
endShape();

fill(0,0,255);
noStroke();
beginShape();
  vertex(244, 480);
  vertex(247, 500);
  vertex(251, 500);
  vertex(253, 480);
endShape();

//disk 3
fill(0,0,255);
noStroke();
ellipse(250, 500, 15, 15);

//disk 2
fill(0,0,255);
noStroke();
ellipse(250, 480, 60, 10);

fill(0,0,255);
noStroke();
beginShape();
  vertex(242, 460);
  vertex(244, 480);
  vertex(253, 480);
  vertex(255, 460);
endShape();

//disk 1
fill(0,0,255);
noStroke();
ellipse(250, 460, 80, 15);

fill(0,0,255);
noStroke();
beginShape();
  vertex(240, 440);
  vertex(242, 460);
  vertex(255, 460);
  vertex(257, 440);
endShape();

fill (0,0,255);
noStroke();
ellipse (250, 350, 150, 150);

fill (0);
noStroke();
ellipse (250, 250, 100, 100);

//black blur background
fill (0, 255, 0);
noStroke();
filter(BLUR, 50);
ellipse (250, 250, 100, 100);

//Background
smooth();
stroke(255,0,0,50);
strokeWeight(2);
for (int i = 0; i < 650; i += 4) {
  line (i, 0, i/2, 340);
}
stroke(255,0,0,50);
strokeWeight(2);
for (int i = 0; i < 680; i += 4) {
  line (i/2, 340, i*2, 680);
}

//head

//fill (0);
//ellipse (250, 350, 150, 150);

//fill (0);
//ellipse (250, 250, 100, 100);

//black blur background
//fill (0, 200, 0);
//filter(BLUR, 50);
//ellipse (250, 250, 100, 100);

fill (0);
ellipse (250, 250, 100, 100);

//eye
fill (250, 100, 0);
rect (220, 230, 15, 30);

//eye
fill (250, 100, 0);
rect (260, 230, 15, 30);

fill (0);
triangle (210, 230, 240, 250, 230, 210);


fill (0);
triangle (260, 240, 280, 230, 260, 210);

//body
fill (0);
ellipse (250, 350, 150, 150);


//control board
fill (0,100,200);
rect (220, 310, 60, 85);

fill (200);
noStroke();
rect (225, 315, 50, 75);

fill(0, 100, 200);
noStroke(); 
rect(230, 325, 40, 15);

noFill();
stroke(255);
strokeWeight(1);
strokeJoin(ROUND);
beginShape();
  vertex(230, 330);
  vertex(235, 330);
  vertex(236, 335);
  vertex(238, 328);
  vertex(240, 335);
  vertex(242, 328);
  vertex(244, 335);
  vertex(246, 326);
  vertex(248, 337);
  vertex(250, 326);
  vertex(252, 337);
  vertex(254, 328);
  vertex(256, 335);
  vertex(258, 328);
  vertex(260, 335);
  vertex(262, 328);
  vertex(264, 332);
  vertex(268, 332);
endShape();

//arms
fill(0);
noStroke();
ellipse(200, 300, 50, 50);

fill(0);
noStroke();
ellipse(300, 300, 50, 50);

fill(0);
noStroke();
ellipse(315, 360, 50, 50);

fill(0);
noStroke();
ellipse(185, 360, 50, 50);

//hover device 
fill(0);
noStroke();
beginShape();
  vertex(215, 415);
  vertex(235, 440);
  vertex(265, 440);
  vertex(285, 415);
endShape();

fill(0);
noStroke();
beginShape();
  vertex(244, 480);
  vertex(247, 500);
  vertex(251, 500);
  vertex(253, 480);
endShape();

//disk 3
fill(0);
noStroke();
ellipse(250, 500, 15, 15);

//disk 2
fill(0);
noStroke();
ellipse(250, 480, 60, 10);

fill(0);
noStroke();
beginShape();
  vertex(242, 460);
  vertex(244, 480);
  vertex(253, 480);
  vertex(255, 460);
endShape();

//disk 1
fill(0);
noStroke();
ellipse(250, 460, 80, 15);

fill(0);
noStroke();
beginShape();
  vertex(240, 440);
  vertex(242, 460);
  vertex(255, 460);
  vertex(257, 440);
endShape();

//arm 1
fill(0);
beginShape();
  vertex(195, 290);
  vertex(150, 250);
  vertex(100, 280);
  vertex(110, 285);
  vertex(148, 260);
  vertex(195, 300);
endShape();

fill(0);
noStroke();
ellipse(150, 260, 20, 20);

fill(0);
noStroke();
ellipse(100, 285, 20, 20);

fill(0);
beginShape();
  vertex(100, 285);
  vertex(70, 280);
  vertex(60, 300);
  vertex(75, 288);
  vertex(100, 285);
  vertex(95, 320);
  vertex(70, 325);
  vertex(90, 315);
  vertex(100, 285);
endShape();

//arm2
fill(0);
beginShape();
  vertex(310, 285);
  vertex(350, 260);
  vertex(400, 298);
  vertex(400, 305);
  vertex(350, 275);
  vertex(310, 292);
endShape();

fill(0);
noStroke();
ellipse(350,270,20,20);

fill(0);
noStroke();
ellipse(400,300,20,20);

fill(0);
noStroke();
ellipse(410, 310, 40, 30);

fill(0);
noStroke();
triangle(410, 300, 410, 320, 450, 350);

//arm3
fill(0);
noStroke();
beginShape();
  vertex(330, 370);
  vertex(350, 410);
  vertex(380, 420);
  vertex(380, 410);
  vertex(355, 400);
  vertex(330, 350);
endShape();

fill(0);
noStroke();
ellipse(350, 400, 20, 20);

fill(0);
noStroke();
ellipse(380, 415, 20, 20);

//arm4
fill(0);
noStroke();
beginShape();
  vertex(170, 350);
  vertex(140, 400);
  vertex(100, 420);
  vertex(100, 430);
  vertex(145, 410);
  vertex(170, 365);
endShape();

fill(0);
noStroke();
ellipse(100, 420, 20, 20);

fill(0);
noStroke();
ellipse(140,405,20,20);










