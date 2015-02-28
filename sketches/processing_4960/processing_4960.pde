
size(480, 320);
background(255);

//main donut
strokeWeight(2);
stroke(121, 76, 31);
fill(155, 101, 44);
ellipse(238, 158, 210, 210);



//multiple ellipses to make "frost"
noStroke();
fill(222, 141, 181);
ellipse(238, 108, 90, 90);
ellipse(180, 150, 80, 80);
ellipse(300, 140, 70, 80);
ellipse(220, 200, 90, 90);
ellipse(280, 200, 80, 70);
ellipse(238, 158, 90, 90);

//hole of donut
strokeWeight(1);
stroke(121, 76, 31);
fill(255);
ellipse(238, 158, 30, 30);

//eyes of donut
noStroke();
fill(0);
ellipse(188, 150, 10, 10);
ellipse(288, 150, 10, 10);

//mouth
stroke(0);
strokeWeight(3);
noFill();
beginShape();
vertex(218, 180);
bezierVertex(220, 200, 258, 200, 258, 180);
endShape();

