
//Kandinsky assignment
  //replicating a portion of kandinsky's painting

size(300,300);
background(240,224,188);



//adjusting the background to inconsistency of painting canvas
smooth();
noStroke();
fill(135,230,215,30);
beginShape();
vertex(width,150);
vertex(width/2,225);
vertex(75,225);
vertex(75,75);
vertex(width,75);
vertex(width,0);
vertex(0,0);
vertex(0,height);
vertex(width,height);
endShape(CLOSE);




//arcs
stroke(150);
strokeWeight(4);
fill(255);
arc(200,130,70,70,PI,TWO_PI);

stroke(0);
strokeWeight(1);
noFill();
arc(200,130,72,72,PI,TWO_PI);

stroke(225,231,106);
strokeWeight(4);
fill(255);
arc(272,130,70,70,PI,TWO_PI);

stroke(0);
strokeWeight(1);
noFill();
arc(272,130,72,72,PI,TWO_PI);

stroke(0);
strokeWeight(1);
noFill();
arc(235,165,70,70,PI,TWO_PI);





//grid fill
noStroke();
//black
fill(0);
beginShape();
vertex(0,7);
vertex(0,0);
vertex(47,0);
vertex(68,19);
vertex(54,40);
endShape(CLOSE);


beginShape();
vertex(68,19);
vertex(78,4);
vertex(108,30);
vertex(95,44);
endShape(CLOSE);

beginShape();
vertex(108,30);
vertex(117,22);
vertex(126,32);
vertex(117,42);
endShape(CLOSE);

beginShape();
vertex(117,42);
vertex(106,54);
vertex(119,66);
vertex(130,54);
endShape(CLOSE);

beginShape();
vertex(117,22);
vertex(132,9);
vertex(125,0);
vertex(93,0);
endShape(CLOSE);

beginShape();
vertex(19,94);
vertex(33,107);
vertex(11,130);
vertex(0,119);
endShape(CLOSE);

beginShape();
vertex(12,192);
vertex(0,184);
vertex(0,168);
vertex(23,179);
endShape(CLOSE);

fill(156,168,84);
beginShape();
vertex(18,93);
vertex(38,62);
vertex(0,41);
vertex(0,79);
endShape(CLOSE);

beginShape();
vertex(4,169);
vertex(26,146);
vertex(40,158);
vertex(23,180);
endShape(CLOSE);

beginShape();
vertex(82,57);
vertex(94,44);
vertex(105,55);
vertex(95,65);
endShape(CLOSE);

fill(226,214,166);
beginShape();
vertex(26,146);
vertex(12,130);
vertex(33,106);
vertex(47,118);
endShape(CLOSE);

fill(125,185,185);
beginShape();
vertex(82,57);
vertex(53,41);
vertex(39,63);
vertex(63,75);
endShape(CLOSE);

fill(241,184,154);
beginShape();
vertex(79,85);
vertex(95,67);
vertex(110,75);
vertex(94,94);
endShape(CLOSE);

fill(151,96,31);
beginShape();
vertex(126,30);
vertex(140,13);
vertex(151,28);
vertex(139,43);
endShape(CLOSE);





//ellipses
noStroke();
fill(240,210,100);
ellipse(125,280,85,85);

stroke(0);
strokeWeight(.25);
fill(231,181,146);
ellipse(125,280,67,67);

stroke(0);
strokeWeight(.25);
fill(71,146,185);
ellipse(120,280,54,54);



//black line
stroke(54,57,46);
strokeWeight(6);
line(width,40,48,90);

//red line
stroke(140,37,30);
strokeWeight(6);
line(width,56,40,135);

//vertical diagonal
stroke(0);
strokeWeight(2);
line(240,0,168,280);
line(150,225,235,225);
line(150,247,240,247);
line(10,height,180,189);
strokeWeight(.5);
line(280,0,width,20);
line(75,height,155,230);

//curves
noFill();
arc(width-50,130,50,50,PI,PI-PI/2);

//horizontal line
stroke(0);
strokeWeight(2);
line(width,130,56,130);

//grid pattern
stroke(0);
strokeWeight(2);
line(175,0,12,192);
line(12,192,0,184);
line(0,168,23,179);
line(0,120,40,159);
line(0,80,63,130);
line(0,41,94,94);
line(0,7,110,75);
line(47,0,118,66);
line(80,0,0,120);
line(138,0,0,140);
line(4,169,152,0);
line(125,0,151,28);
line(77,3,129,52);
line(93,0,137,42);



