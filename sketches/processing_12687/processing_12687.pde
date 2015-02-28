
size(600, 600);
background(225);
smooth(); //all line is smooth
ellipse(160, 140, 120, 120);
quad(160, 40, 280, 40, 260, 160, 200, 160);

fill(255);
beginShape();
vertex(0,140);
vertex(140, 180);
vertex(140,220);
vertex(0,180);
endShape(CLOSE);

fill(255);
ellipse(0,600,640,640);
fill(225);
ellipse(0,600, 600,600);
fill(255);
ellipse(600,0,320,320);
fill(225);
ellipse(600,0, 300,300);
fill(255);
ellipse(250, 440, 180, 180);
fill(225);
ellipse(250, 440, 140, 140);

strokeWeight(1);
fill(89); //grey
noStroke();
beginShape(); //cross1
vertex(140, 220);
vertex(160, 220);
vertex(160, 280);
vertex(220, 280);
vertex(220, 300);
vertex(160, 300);
vertex(160, 360);
vertex(140, 360);
vertex(140, 300);
vertex(80, 300);
vertex(80, 280);
vertex(140, 280);
endShape(CLOSE);

fill(89);
noStroke();
beginShape(); //cross2
vertex(40, 320);
vertex(60, 320);
vertex(60, 400);
vertex(140, 400);
vertex(140, 420);
vertex(60, 420);
vertex(60, 500);
vertex(40, 500);
vertex(40, 420);
vertex(0, 420);
vertex(0, 400);
vertex(40, 400);
endShape(CLOSE);

fill(89);
noStroke();
beginShape(); //cross3
vertex(180, 420);
vertex(200, 420);
vertex(200, 500);
vertex(280, 500);
vertex(280, 520);
vertex(200, 520);
vertex(200, 600);
vertex(180, 600);
vertex(180, 520);
vertex(100, 520);
vertex(100, 500);
vertex(180, 500);
endShape(CLOSE);

fill(89);
noStroke();
beginShape(); //cross4
vertex(40, 540);
vertex(60, 540);
vertex(60, 600);
vertex(40, 600);
endShape(CLOSE);

fill(0);
beginShape(); //bigshape
vertex(560, 260);
vertex(600, 280);
vertex(600, 600);
vertex(420, 600);
vertex(400, 580); //why this vertex is not drawing perpect??
endShape(CLOSE);

fill(255);
stroke(0);
beginShape();
vertex(280, 180);
vertex(440, 60);
vertex(460, 80);
vertex(300, 200);
endShape(CLOSE);

fill(255);
beginShape();
vertex(320, 240);
vertex(360, 200);
vertex(380, 220);
vertex(340, 260);
endShape(CLOSE);

fill(255);
beginShape();
vertex(380, 180);
vertex(540, 0);
vertex(580, 0);
vertex(400, 200);
endShape(CLOSE);

fill(255);
beginShape();
vertex(400, 0);
vertex(440, 0);
vertex(420, 20);
endShape(CLOSE);



