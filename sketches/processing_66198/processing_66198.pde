
size(250,234);

smooth();
background(249,244,222);

noFill();
bezier(0,195,14,202,54,224,76,226);//last curve
bezier(76,226,95,224,110,202,140,201);
bezier(140,201,175,200,185,224,218,224);
bezier(218,224,237,216,228,164,220,160);
line(207,height,209,224);

bezier(54,0,31,14,12,40,7,53); //curves on the top left
bezier(24,61,26,45,28,45,33,39); 
bezier(33,39,39,34,46,39,63,41);//linha02
bezier(63,41,72,43,75,36,74,34);

bezier(123,17,123,17,109,26,118,48);//curva do meio em cima
bezier(118,48,128,71,157,67,157,67);

bezier(153,0,153,0,166,24,168,48); //continução da curva do meio, em cima da elipse

noStroke();
fill(0);
ellipse(10,65,30,27); //elipse preta do canto esquerdo

fill(255,0,0); //elipse vermelha em cima da preta
ellipse(0,72,15,11);

ellipse(118,48,14,10); //ellipse do meio

//forma estranha de uma ellipse com outra ellipse vermelha e um triangulo em cima
fill(0);
ellipse(169,60,27,30);
triangle(177,55,172,67,192,67);
fill(255,0,0);
ellipse(177,62,10,11);

stroke(0);
line(191,0,191,8); //penultima curva canto superior direito

line(246,0,width,12); //linha no canto superior direto

noFill();
bezier(215,0,215,0,205,12,214,24);


/*beginShape();
vertex(102,134);
vertex(93,141);
curveVertex(62,111);
curveVertex(60,84);
curveVertex(70,64);
curveVertex(64,90);
curveVertex(70,110);
curveVertex(103,134);
curveVertex(103,134);
endShape(CLOSE);*/

/*fill(0);
beginShape();
curveVertex(71,  64);
curveVertex(71,  64);
curveVertex(64,  96);
curveVertex(91,  141);
vertex(91,  152);
curveVertex(58,  100);
curveVertex(71,  64);
curveVertex(71,  64);
endShape();*/

noStroke();
fill(0);
beginShape(); //tentaculo01 esq
curveVertex(71,  64);
curveVertex(71,  64);
curveVertex(64,  96);
curveVertex(91,  141);
curveVertex(91,  152);
curveVertex(58,  100);
curveVertex(71,  64);
curveVertex(71,  64);
endShape();

beginShape(); //tentaculo02 esq
curveVertex(42,  85);
curveVertex(42,  85);
curveVertex(37,  123);
curveVertex(78,  158);
curveVertex(90,  154);
curveVertex(49,  125);
curveVertex(42,  85);
curveVertex(42,  85);
endShape();

beginShape(); //tentaculo03 esq
curveVertex(29,  118);
curveVertex(29,  118);
curveVertex(43,  156);
curveVertex(81,  178);
curveVertex(83,  168);
curveVertex(49,  151);
curveVertex(29,  118);
curveVertex(29,  118);
endShape();

beginShape(); //tentaculo01 dir
curveVertex(224,  17);
curveVertex(224,  17);
curveVertex(217,  52);
curveVertex(148,  108);
curveVertex(156,  112);
curveVertex(219,  60);
curveVertex(224,  17);
curveVertex(224,  17);
endShape();

beginShape(); //tentaculo02 dir
curveVertex(239,  56);
curveVertex(239,  56);
curveVertex(226,  97);
curveVertex(167,  129);
curveVertex(175,  142);
curveVertex(189,  131);
curveVertex(228,  109);
curveVertex(239,  56);
curveVertex(239,  56);
endShape();

beginShape(); //tentaculo03 dir
curveVertex(239,  56);
curveVertex(239,  56);
curveVertex(226,  97);
curveVertex(167,  129);
curveVertex(175,  142);
curveVertex(189,  131);
curveVertex(228,  109);
curveVertex(239,  56);
curveVertex(239,  56);
endShape();

beginShape(); //objeto estranho no meio
vertex(120, 79);
bezierVertex(120, 79, 121, 90, 119, 100);
bezierVertex(121, 90, 120, 100, 117, 112);
bezierVertex(109, 113, 110, 134, 110, 156);
bezierVertex(123, 198, 123, 205, 123, 212);
bezierVertex(124, 212, 124, 234, 132, 234);
bezierVertex(124, 234, 132, 234, 144,208);
endShape();

beginShape(); //tentaculo03 dir
curveVertex(239,  56);
curveVertex(239,  56);
curveVertex(226,  97);
curveVertex(167,  129);
curveVertex(175,  142);
curveVertex(189,  131);
curveVertex(228,  109);
curveVertex(239,  56);
curveVertex(239,  56);
endShape();


ellipse(227,181,20,10); //ellipse em cima da curva de baixo

noFill();
stroke(255, 102, 0);
//curve(21,0,21,0,42,172);




/*beginShape();
curveVertex(0,195);
curveVertex(0,195);
curveVertex(76,225);
curveVertex(200,14);
curveVertex(200,150);
curveVertex(200,200);
vertex(0, 195);
vertex(220,160);
endShape(CLOSE);*/

