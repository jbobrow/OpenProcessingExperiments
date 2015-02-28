
size(640, 480);
smooth();

//middle rect (background)
noStroke();
fill(#cccdbe);
beginShape();
vertex(0, 195);
vertex(640, 195);
vertex(640, 360);
vertex(0, 360);
endShape(CLOSE);

//bottom rect (background)
noStroke();
fill(#d2d2ae);
beginShape();
vertex(0, 360);
vertex(640, 360);
vertex(640, 480);
vertex(0, 480);
endShape(CLOSE);

//lines

//1st line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(89,0,89,125);

//2nd line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(258,0,258,145);

//3rd line from left
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(450,0,450,165);

//beziers

//from top
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
beginShape();
vertex(0, 140);
bezierVertex(0, 85, 200, 167, 640, 175);
endShape();

stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(0,220,640,270);

//grey stroke above 3rd quad
stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
line(640,50,625,49);

stroke(#b4b3ab);
strokeWeight(1.5);
noFill();
beginShape();
vertex(0, 290);
bezierVertex(0, 300, 310, 355, 450, 360);
endShape();

//orange arc
stroke(#f6640f);
strokeWeight(5);
noFill();
beginShape();
vertex(206, 0);
bezierVertex(224, 4, 310, 15, 640, 30);
endShape();

//quads
fill(#a5a49e);
noStroke();
quad(205, 0, 228, 0, 0, 120, 0, 100);

fill(#a5a49e);
noStroke();
quad(480, 0, 500, 0, 0, 330, 0, 300);

fill(#a5a49e);
noStroke();
quad(220, 480, 640, 57, 640, 75, 110, 640);

//blue triangle
fill(#1a5a8f);
noStroke();
triangle(0, 100, 540, 110, 0, 120);

//black lines

stroke(0);
strokeWeight(3);
noFill();
line(0,330,395,140.5);

stroke(0);
strokeWeight(5);
noFill();
line(580,0,420,126);

//yellow black trapeze_from left
fill(#f8b834);
noStroke();
beginShape();
vertex(0, 80);
vertex(110, 100);
vertex(80, 180);
vertex(0, 165);
endShape(CLOSE);

fill(0);
noStroke();
beginShape();
vertex(126, 102);
vertex(255, 115);
vertex(200, 203);
vertex(120, 188);
endShape(CLOSE);

fill(#f8b834);
noStroke();
beginShape();
vertex(280, 118);
vertex(477, 140);
vertex(435, 240);
vertex(295, 210);
endShape(CLOSE);















