
/*
"snodo" by Lorenzo, licensed under Creative Commons Attribution-Share Alike 3.0
*/
size(500,500);
background(137);
scale(5,5);

stroke(90);
smooth();
fill(170);
beginShape(); // CONTORNO
vertex(50,40);
curveVertex(78,11);
curveVertex(70,20);
curveVertex(90,50);
curveVertex(55,84);
curveVertex(19,13);
curveVertex(78,80);
curveVertex(11,90);
curveVertex(45,45);
curveVertex(45,45);
endShape();

noStroke(); // OMBRE
fill(110);/////
triangle(44,47,36,56,28,37);
triangle(50,41,56,38,76,70);
translate(3,0);
noFill();
strokeWeight(3);
stroke(110);/////
beginShape();
vertex(75,68);
bezierVertex(55,94,49,84,44,77);
endShape();

stroke(0);
strokeWeight(2);
beginShape();
vertex(60,90);
bezierVertex(50,92,40,94,20,93);
endShape();

stroke(255); // LUCI
beginShape();
vertex(38,34);
bezierVertex(65,60,65,80,49,80);
endShape();

strokeWeight(1);
beginShape();
vertex(11,90);
curveVertex(78,78);
curveVertex(11,90);
curveVertex(37,52);
curveVertex(37,52);
endShape();

