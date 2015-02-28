
//Abby Frankola 
//afrankola
//copyright Abby Frankola September 2013

size(400, 400);
background(164,191,109);
 
noFill();
stroke(255);
strokeWeight(5);
strokeJoin(ROUND);
strokeCap(SQUARE);
beginShape();
vertex(140, 220);
vertex(160, 180);
vertex(170, 220);
endShape();
line(147, 210, 158, 210);


noFill();
stroke(255);
strokeWeight(5);
strokeJoin(ROUND);
strokeCap(SQUARE);
beginShape();
vertex(190, 190);
vertex(190, 180);
vertex(210, 195);
vertex(210, 200);
vertex(190, 210);
vertex(190, 220);
endShape();


noFill();
stroke(255);
strokeWeight(5);
strokeJoin(ROUND);
strokeCap(SQUARE);
beginShape();
vertex(230, 220);
vertex(230, 180);
vertex(250, 180);
endShape();
line(230, 210, 240, 210);

noFill();
stroke(255);
strokeWeight(.5);
beginShape();
vertex(200,100);
vertex(100,200);
vertex(200,300);
vertex(300, 200);
endShape(CLOSE);
beginShape();
vertex(100, 100);
vertex(100, 300);
vertex(300, 300);
vertex(300, 100);
endShape(CLOSE);
beginShape();
vertex(200,0);
vertex(0,200);
vertex(200,400);
vertex(400, 200);
endShape(CLOSE);
line(0,0,100,100);
line(400,0,300,100);
line(0,400,100,300);
line(400,400,300,300);

//saveFrame("hw1.jpg");


