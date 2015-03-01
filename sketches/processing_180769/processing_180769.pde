

size(500,400, P2D);
background(63,221,252);
noStroke();

//background_______________________
  int blue = color (94,225,242);
  int white = color (246,250,192);
  
  //triangle 1 --clockwise order follow triangles
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(-5,50);
  vertex(0,0);
  vertex(60,-5);
 
  endShape();
  
  //triangle 2
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(180,-5);
  vertex(300,-5);
  endShape();
  
  //triangle 3
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(400,-5);
  vertex(550,10);
  endShape();
  
  //triangle 4
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(505,140);
  vertex(505,260);
  endShape();
  
  //triangle 5 (inf)
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(505,400);
  vertex(400,405);
  endShape();
  
  //triangle 6 (inf))
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(100,405);
  vertex(0,400);
  vertex(-5,380);
  endShape();
  
    //triangle 4
  beginShape();
  fill(white);
  vertex(255,220);
  fill(blue);
  vertex(-5,150);
  vertex(-5,280);
  endShape();
    
  //sol
  fill(250,235,63);
  ellipse(255,220,180,180);

//ninot
  //cap_____________________
  fill(249,249,249);
   //capblanc
  rect(229,249,75,58);
  rect(221,266,8,33);
  rect(302,259,8,32);
  rect(237,299,66,8);
  rect(262,307,10,8);
  //cap ombra rosa
  fill(214,203,209);
  rect(221,250,8,16);
  rect(213,259,8,40);
  rect(229,299,8,8);
  //cap ombra marro
  fill(161,176,158);
  rect(213,250,8,9);
  rect(205,259,8,40);
  
  //cos_______________________
  //cos blanc
  fill(249,249,249);
  rect(245,315,34,41);
  rect(238,323,8,17);
  rect(230,316,8,15);
  rect(221,316,9,8);
  
  //cos ombra rosa___
  fill(214,203,209);
  //coll i braç
  rect(254,307,8,8);
  rect(238,315,8,8);
  //esquena i cames
  rect(238,340,7,23);
  rect(230,364,7,7);
  rect(262,356,8,8);
  
  //cos ombra marro___
  fill(161,176,158);
  //coll i braços
  rect(238,307,16,8);
  rect(221,324,8,8);
  rect(213,316,8,8);
  rect(279,315,8,16);
  rect(287,315,8,8);
  //esquena i cames
  rect(245,356,17,8);
  rect(262,364,8,8);
  rect(223,364,7,7);
  rect(231,331,7,33);
  rect(270,356,8,8);
  
  //ulls i boca negres________
  fill(9,9,9);
  stroke(104,104,104);
  rect(230,266,7,8);
  rect(295,266,8,8);
  rect(254,274,33,16);
  noStroke();
  rect(271,290,8,8);
  //llengua rosa
  fill(223,38,106);
  rect(255,283,16,7);
  rect(263,290,8,8);
  fill(100,14,46);
  rect(270,283,1,15);
  
  //barret________________
  //vermell
  fill(196,16,16);
  rect(237,217,16,24);
  //ombra vermella
  fill(130,7,13);
  rect(229,225,8,16);
  //ornament groc
  fill(240,151,43);
  rect(229,217,8,8);
  rect(221,225,8,8);



