
//Ashley Muller
//N00211495
//Recreation of Kandinsky’s Transverse Line 

size(400,273);
background(219, 196, 152); 

beginShape();
  vertex(88,2);
  vertex(71,23);
  vertex(88, 61);
  vertex(129, 19);
endShape(CLOSE);

noStroke();
fill(251, 237, 176);
triangle(129, 5, 174, 246, 322, 131);

fill(116, 82, 44);
beginShape();
  vertex(101, 99);
  vertex(10, 142);
  vertex(49, 264);
  vertex(173, 114);
 endShape();
 
 ellipse(178, 151, 36, 38);
 fill(224, 45, 25);
 triangle(173, 134, 195, 141, 169, 170);
 
 fill(219, 196, 152);
 beginShape();
   vertex(46, 126);
    vertex(25, 183);
    vertex(88, 218);
    vertex(125, 126);
  endShape();
  
  fill(251, 121, 63);
  ellipse(326, 15, 21, 20);
  
  fill(80, 89, 128);
  ellipse(68, 82, 47, 43);
  
  fill(204, 114, 26);
  triangle(193, 25, 189, 52, 219, 46);
  
  fill(0);
  ellipse(166, 81, 25, 24);
  
  fill(255);
  ellipse(166, 81, 17, 18);
  
  fill(0);
  ellipse(166, 81, 9, 8);
  
  beginShape();
    vertex(382, 88);
    bezierVertex(347, 26, 211, 86, 282, 182);
    bezierVertex(350, 77, 281, 126, 282, 182);
    vertex(282, 182);
   endShape();
   
  
  //no fill lines from here
  
  strokeWeight(2);
  stroke(0);
  noFill();
  beginShape();
    curveVertex(192, 167);
    curveVertex(179, 131);
    curveVertex(199, 79);
    curveVertex(265, 52);
    curveVertex(303, 54);
  endShape();
  
ellipse(317, 117, 143, 145);

strokeWeight(4);
beginShape();
  curveVertex(234, 258);
  curveVertex(206, 248);
  curveVertex(142, 172);
  curveVertex(116, 70);
  curveVertex(131, 39);
  curveVertex(159, 21);
 endShape();
 
 strokeWeight(4);
beginShape();
  curveVertex(258, 266);
  curveVertex(234, 256);
  curveVertex(210, 227);
  curveVertex(215, 199);
  curveVertex(238, 194);
  curveVertex(276, 210);
  curveVertex(286, 178);
  curveVertex(320, 169);
  curveVertex(391, 209);
  curveVertex(400, 233);
 endShape();
 
 strokeWeight(1.2);
 line(31, 45, 233, 6);
 
 strokeWeight(2);
 line(343, 2, 33, 268);
 
 strokeWeight(6);
 line(318, 1, 335, 35);
 
 //colour lines
  strokeWeight(4);
  stroke(251, 121, 63);
beginShape();
  curveVertex(33, 74);
  curveVertex(27, 71);
  curveVertex(23, 57);
  curveVertex(42, 58);
  curveVertex(73, 80);
  curveVertex(87, 98);
  curveVertex(96, 110);
  curveVertex(98, 111);
 endShape();
 
//no colour
strokeWeight(2);
stroke(0);
line(104, 56, 37, 115);

