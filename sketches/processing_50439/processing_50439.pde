
 /*****************************************
 * Assignment 01
 * Name:         Warren Schwartz
 * E-mail:       wschwart@haverford.edu
 * Course:       CS 110 - 02
 * Submitted:    1/26/12
 * 
 * This is a sketch of a yellow submarine (like
 the one from the Beetles song). I attempted to
 make the vessel appear slightly three dimensional by
 adding shadows to some parts. The submarine is mostly
 made of rectangles and quadrilaterals, and the fish
 is mostly curves and custom shapes with curve
 vertexes.
 ***********************************************/


void setup(){
  //background setup
  colorMode(RGB);
  background(0,0,100);
  size(700,500);
  
  //submarine main hull and bow
  rectMode(CENTER);
  fill(255,255,0);
  smooth();
  strokeWeight(2);
  noSmooth();
  rect(340,250,150,75);
  smooth();
  ellipse(515,259,60,52);
  quad(415,287,415,213,515,233,515,286);

  //windows
  fill(100,100,255);
  strokeWeight(5);
  ellipse(300,238,20,20);
  ellipse(330,238,20,20);
  ellipse(360,238,20,20);

  //aft section and rudders
  strokeWeight(2);
  fill(255,255,0);
  triangle(112,243,92,214,93,242);
  fill(255,160,0);
  triangle(113,270,94,296,94,270);
  fill(255,255,0);
  strokeWeight(2);
  quad(265,212,116,243,116,270,266,286);

  //propellor and propellor duct
  rect(80,257,72,27);
  arc(45,257,50,27,1.57,4.71);
  rect(68,257,50,100);

  //periscope
  stroke(0,0,0);
  strokeWeight(2);
  fill(255,255,0);
  beginShape();
  curveVertex(360,166);
  curveVertex(360,166);
  curveVertex(365,129);
  curveVertex(371,119);
  curveVertex(388,117);
  curveVertex(386,103);
  curveVertex(361,107);
  curveVertex(351,139);
  curveVertex(348,166);
  endShape(CLOSE);
  fill(100,100,255);
  ellipse(387,110,5,10);

  //antennae
  fill(255,255,0);
  stroke(100);
  strokeWeight(5);
  line(338,135,338,116);
  noSmooth();
  stroke(100);
  strokeWeight(2);
  line(328,143,328,106);

  //conning tower
  smooth();
  stroke(0,0,0);
  strokeWeight(2);
  beginShape();
  vertex(376,212);
  vertex(359,146);
  vertex(323,146);
  vertex(296,212);
  endShape();
  arc(341,155,40,35,3.53,5.89);
  curve(257,220,313,188,363,187,395,226);
  curve(243,184,313,188,363,187,427,180);

  //water currents
  noFill();
  strokeWeight(7);
  stroke(100,100,255);
  curve(255,390,320,365,405,359,467,400);
  curve(367,342,403,358,497,383,572,371);
  curve(42,62,103,94,177,95,233,58);
  curve(142,99,177,95,248,58,308,49);

  //ambient bubbles
  fill(100,100,255);
  ellipse(142,451,60,60);
  ellipse(197,397,40,40);
  ellipse(128,349,30,30);
  stroke(255);
  curve(131,429,149,427,162,438,166,455);
  strokeWeight(4);
  curve(189,387,200,380,210,387,207,396);
  strokeWeight(3);
  curve(124,340,132,336,140,344,132,351);

  //shadow
  rectMode(CORNER);
  fill(255,160,0);
  noStroke();
  rect(45,288,47,18);
  fill(255,160,0);
  quad(94,260,116,261,117,269,94,269);
  quad(117,260,265,270,265,286,118,270);
  rectMode(CORNER);
  rect(267,271,147,15);
  quad(416,272,514,271,514,285,416,286);
  quad(516,271,544,261,536,277,517,284);
  strokeWeight(4);
  stroke(255,160,0);
  noFill();
  arc(515,259,56,47,0.2,1.4);
  fill(255,160,0);
  noStroke();
  arc(42,257,40,26,1.57,3.14);
  stroke(255,255,0);
  curve(498,270,519,268,540,260,567,230);
  curve(4,250,24,258,40,260,61,259);
  line(28,257,38,257);
  fill(255,255,0);
  line(40,247,40,258);
  stroke(0);
  strokeWeight(2);
  line(116,244,116,269);
  strokeWeight(3);
  stroke(255,160,0);
  line(372,117,383,116);
  line(372,115,382,114);
  line(370,118,369,115);
  
  //fish upper tail fin
  strokeWeight(4);
  stroke(5,20,5);
  fill(10,50,10);
  beginShape();
  curveVertex(548,98);
  curveVertex(570,78);
  curveVertex(600,48);
  curveVertex(646,30);
  curveVertex(626,61);
  curveVertex(601,106);
  curveVertex(597,117);
  endShape(CLOSE);

  //fish lower tail fin
  beginShape();
  curveVertex(568,97);
  curveVertex(594,129);
  curveVertex(619,159);
  curveVertex(635,178);
  curveVertex(594,170);
  curveVertex(564,148);
  curveVertex(542,122);
  endShape(CLOSE);

  //fish dorsal fin
  beginShape();
  curveVertex(494,78);
  curveVertex(501,72);
  curveVertex(518,31);
  curveVertex(557,15);
  curveVertex(547,32);
  curveVertex(552,43);
  curveVertex(542,48);
  curveVertex(551,58);
  curveVertex(543,74);
  curveVertex(550,89);
  endShape(CLOSE);

  //fish body
  strokeWeight(6);
  beginShape();
  curveVertex(633,75);
  curveVertex(606,117);
  curveVertex(565,156);
  curveVertex(487,154);
  curveVertex(448,109);
  curveVertex(496,67);
  curveVertex(568,74);
  curveVertex(606,108);
  curveVertex(632,159);
  endShape(CLOSE);

  //side fin
  strokeWeight(4);
  stroke(5,20,5);
  curve(494,110,501,130,527,146,550,146);
  curve(525,101,522,124,529,146,547,168);

  //fish eye
  noStroke();
  fill(0);
  ellipse(483,96,20,20);
  fill(255);
  ellipse(487,91,2,2);

  //gills
  noFill();
  stroke(5,20,5);
  strokeWeight(2);
  curve(498,72,514,88,510,113,491,124);
  curve(508,72,524,93,520,113,496,124);
  curve(528,72,534,103,530,113,516,124);

  //fish mouth
  strokeWeight(4);
  stroke(5,20,5);
  arc(465,119,40,40,0.2,1.57);
  arc(465,119,40,45,0.2,1.57);
}

