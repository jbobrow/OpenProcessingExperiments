
size(260,400);
background(#A719A5);
smooth();


//feet 1

fill(0);
beginShape(TRIANGLES);
vertex(80,360);
vertex(105,353);
vertex(109,358);
endShape();

//feet 2
fill(0);
beginShape(TRIANGLES);
vertex(176,366);
vertex(155,353);
vertex(151,359);
endShape();

//legbot 1
fill(0);
beginShape(TRIANGLES);
vertex(105,353);
vertex(94,310);
vertex(109,310);
endShape();

//legbot 2
fill(0);
beginShape(TRIANGLES);
vertex(155,353);
vertex(166,310);
vertex(151,310);
endShape();

//leggtop 1
fill(0);
beginShape();
vertex(97,310);
vertex(105,310);
vertex(115,278);
vertex(99,278);
endShape();

//leggtop 2
fill(0);
beginShape();
vertex(163,310);
vertex(154,310);
vertex(144,278);
vertex(159,275);
endShape();




//body
fill(#CE1B36);
noStroke();

beginShape();
vertex(95,280);
vertex(130,284);
vertex(165,280);
vertex(148,198);
vertex(130,190);
vertex(111,198);


endShape(CLOSE);


//arm 1
fill(#ADA7A7);
beginShape();
vertex(108,203);
vertex(115,203);
vertex(98,230);
vertex(95,230);
endShape(CLOSE);

//arm 2
fill(#ADA7A7);
beginShape();
vertex(153,203);
vertex(146,203);
vertex(162,230);
vertex(165,230);
endShape(CLOSE);

//arm1bot
fill(0);
beginShape();
vertex(92,230);
vertex(96,229);
vertex(100,233);
vertex(87,260);
vertex(85,260);
endShape();

//arm2bot
fill(0);
beginShape();
vertex(168,230);
vertex(164,229);
vertex(160,233);
vertex(173,260);
vertex(175,260);
endShape();

//hand1 right
fill(0);
beginShape();
vertex(85,272);
vertex(78,270);
vertex(84,260);
vertex(90,260);
vertex(95,262);
endShape();

//hand1 left
fill(0);
beginShape();
vertex(82,277);
vertex(84,272);
vertex(95,262);
vertex(91,276);
endShape();

//hand2 right
fill(0);
beginShape();
vertex(175,272);
vertex(182,270);
vertex(176,260);
vertex(170,260);
vertex(165,262);
endShape();

//hand2 left
fill(0);
beginShape();
vertex(178,277);
vertex(176,272);
vertex(165,262);
vertex(169,276);
endShape();

//NECK
fill(#F2ABF1);
beginShape();
vertex(119,191);
vertex(130,202);
vertex(145,191);
vertex(130,180);

endShape(CLOSE);

//SHOULDER 1
fill(#F2ABF1);
beginShape();
vertex(112,210);
vertex(101,195);
vertex(109,193);
vertex(116,205);
endShape(CLOSE);


//SHOULDER 2
fill(#F2ABF1);
beginShape();
vertex(148,210);
vertex(159,195);
vertex(149,193);
vertex(144,205);
endShape(CLOSE);

//head
fill(#AFD37E);
strokeWeight(2);
beginShape();
vertex(84,170);
vertex(132,192);
vertex(176,170);
vertex(185,92);
vertex(130,100);
vertex(75,92);

endShape(CLOSE);

fill(0);
beginShape();
vertex(130,92);
vertex(75,92);
vertex(86,102);
vertex(130,103);
vertex(130,110);

endShape();

fill(0);
beginShape();
vertex(130,92);
vertex(187,92);
vertex(176,102);
vertex(130,103);
vertex(130,110);

endShape();

{
stroke(0);
noFill();
beginShape();
curveVertex(90,170);
curveVertex(86,102);
curveVertex(130,102);
curveVertex(90,110);

endShape();

stroke(0);
noFill();
beginShape();
curveVertex(170,170);
curveVertex(175,102);
curveVertex(130,102);
curveVertex(180,110);

endShape();
}
//hair triangle
fill(0);
beginShape(TRIANGLE);
vertex(78,110);
vertex(76,94);
vertex(93,109);
endShape(CLOSE);

//hair triangle
fill(0);
beginShape(TRIANGLE);
vertex(182,110);
vertex(186,94);
vertex(167,109);
endShape(CLOSE);

beginShape();
curveVertex(10,200);
curveVertex(75,92);
curveVertex(185,92);
curveVertex(0,110);
endShape();

stroke(0);

//tupe
fill(0);
beginShape();
vertex(105,50);
vertex(110,85);
vertex(150,85);
vertex(158,65);
vertex(170,58);
vertex(150,50);
endShape(CLOSE);

//ojos
noStroke();
fill(#BC0243);
ellipse(160,140,35,47);

ellipse(102,140,35,47);

fill(#B77F93);

ellipse(155,137,15,24);
ellipse(168,150,10,14);

ellipse(109,137,15,24);
ellipse(94,150,10,14);


fill(0);
ellipse(130,170,18,2);
