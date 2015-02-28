
size(158,130);
background(24,121,172);

//Circle w/fill
strokeWeight(2);
fill(172,64,6);
ellipse(165,138,50,50);

//green face
fill(55,68,40);
ellipse(0,50,270,300);

//black part of face
fill(0);
ellipse(0,50,160,300);

//white face
fill(251,248,243);
noStroke();
beginShape();
curveVertex(60,-20);
curveVertex(80,0);
curveVertex(80,73);
curveVertex(59,80);
curveVertex(50,80);
curveVertex(41,100);
curveVertex(47,86);
curveVertex(50,94);
curveVertex(41,99);
curveVertex(45,107);
curveVertex(37,118);
curveVertex(44,129);
curveVertex(17,130);
curveVertex(0,130);
curveVertex(0,0);
curveVertex(60,-20);
endShape();

//blond hair
fill(238,225,157);
stroke(120);
beginShape();
curveVertex(-20,0);
curveVertex(-1,-5);
curveVertex(25,-3);
curveVertex(25,-3);
curveVertex(0,60);
curveVertex(16,130);
curveVertex(16,130);
curveVertex(0,130);
curveVertex(-20,60);
endShape();

//Ojo izq
//line sup
noFill();
stroke(120);
beginShape();
curveVertex(33,25);
curveVertex(33,25);
curveVertex(52,18);
curveVertex(74,27);
curveVertex(74,27);
endShape();
//line inf
noFill();
stroke(120);
beginShape();
curveVertex(33,30);
curveVertex(33,30);
curveVertex(52,37);
curveVertex(74,32);
curveVertex(74,32);
endShape();
//ojo
fill(215);
ellipse(53,27,15,13);
//pupila
fill(120);
ellipse(53,27,2,2);

//Ojo derecho
//line sup
noFill();
stroke(15);
beginShape();
curveVertex(95,33);
curveVertex(95,33);
curveVertex(113,28);
curveVertex(129,38);
curveVertex(129,38);
endShape();
//line inf
noFill();
stroke(15);
beginShape();
curveVertex(95,33);
curveVertex(95,33);
curveVertex(114,41);
curveVertex(129,38);
curveVertex(129,38);
endShape();
//ojo
noFill();
ellipse(114,34,10,10);
//pupila
fill(120);
ellipse(114,34,2,2);

