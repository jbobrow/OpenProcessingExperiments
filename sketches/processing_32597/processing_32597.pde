
size(235,147);
background(0,94,146);

//this will color the lower right background white
fill(239,238,234);
rect(200,74,70,90);

//this will color the top right background yellow
fill(250,230,167);
rect(175,-5,70,45);

//this will create the main outline of the gray figure
stroke(2,5,8);
strokeWeight(4);
fill(210,210,214);

beginShape();

curveVertex(74,147);
curveVertex(74,147);
curveVertex(69,115);
curveVertex(72,90);
curveVertex(82,65);
curveVertex(90,48);
curveVertex(108,24);
curveVertex(120,12);
curveVertex(144,4);
curveVertex(168,-3);
curveVertex(187,-3);
curveVertex(204,5);
curveVertex(216,14);
curveVertex(228,28);
curveVertex(239,44);
curveVertex(242,50);
curveVertex(230,73);
curveVertex(211,86);
curveVertex(203,109);
curveVertex(220,130);
curveVertex(228,134);
curveVertex(228,134);
vertex(210,height+2);

endShape(CLOSE);

//this will create the outer "eyes" of the creature 
stroke(8);
noFill();
ellipse(142,50,24,48);
ellipse(172,42,24,47);
ellipse(200,43,20,43);
ellipse(224,48,17,44);

//this will create the horizontal line below the eyes
beginShape();

curveVertex(157,69);
curveVertex(154,72);
curveVertex(157,69);
curveVertex(168,68);
curveVertex(182,63);
curveVertex(200,65);
curveVertex(207,65);
curveVertex(215,68);
curveVertex(228,71);
curveVertex(228,71);
//curveVertex(200,65);

endShape();

//here are the orange pupils of the eyes
strokeWeight(2);
fill(225,118,73);
ellipse(142,65,12,18);
ellipse(172,52,12,20);
ellipse(200,54,12,16);
ellipse(226,60,10,16);

//this is the orange circle under horizontal line
strokeWeight(1.5);
ellipse(214,75,10,10);

//this small circle fills in a "bald" spot
noStroke();
fill(0,0,0);
ellipse(222,76,7,8);

//this creates the black mouth of the creature
stroke(0);
strokeWeight(2);
fill(0);

beginShape();

curveVertex(144,height);
curveVertex(144,height);
curveVertex(134,134);
curveVertex(131,122);
curveVertex(134,109);
curveVertex(140,100);
curveVertex(148,95);
curveVertex(170,86);
curveVertex(175,85);
curveVertex(180,84);
curveVertex(189,82);
curveVertex(198,80);
curveVertex(204,80);
curveVertex(211,80);
curveVertex(211,83);
curveVertex(203,109);
curveVertex(220,130);
curveVertex(228,134);
curveVertex(228,134);
vertex(210,height+2);

endShape(CLOSE);

//this creates the small circle inside the mouth
noStroke();
fill(164,164,165);
ellipse(168,126,6,6);

//this creates the large circle outline in the mouth
noFill();
strokeWeight(2);
stroke(164,164,165);
ellipse(168,126,22,22);

//finishing touches
strokeWeight(4);
stroke(210,210,214);
line(80,height,139,height);



