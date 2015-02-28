
//Carla Campos-Rodriguez
// February 5,2013
//Painting

size(183,275);
noStroke();
background(29,158,197);//background
//brownedgebottom
fill(50,26,37);
beginShape();
vertex(0,271);
vertex(62,268);
vertex(64,276);
vertex(1,276);
endShape(CLOSE);

stroke(50,26,37);
strokeWeight(5.5);
beginShape();
//vertex(63,276); old shape to triangle
vertex(57,276);
vertex(86,181);
vertex(148,241);
vertex(182,276);
endShape(CLOSE);

noStroke();
//green
//small green triangle left
fill(36,52,27); //green
beginShape();
vertex(63,273);
//vertex(90,194);
vertex(62,276);
vertex(61,276);
vertex(34,276);
endShape(CLOSE); 
//whitetriangle
fill(204,214,170); //white
beginShape();
vertex(62,276);
vertex(91,194);
vertex(180,276);
vertex(34,276);
endShape(CLOSE); 

//white triangle detail
fill(151,187,131); //creamish green
beginShape();
vertex(71,276);
vertex(84,252);
vertex(105,220);
vertex(134,235);
vertex(131,276);
endShape(CLOSE); 


//right white triangle detail
fill(134,134,101); // lightcreamish green
beginShape();
vertex(150,236);
vertex(174,157);
vertex(180,160);
vertex(182,268);
//vertex(131,276);
endShape(CLOSE); 

//brown lines
stroke(50,26,37); // first
strokeWeight(5.5);
fill(50,26,37);
line(141,276,165,161);

stroke(50,26,37); // fourth line
strokeWeight(5.5);
fill(50,26,37);
line(181,276,182,179);

stroke(50,26,37); // third line
strokeWeight(5.5);
fill(50,26,37);
line(159,276,182,182);

stroke(50,26,37); 
strokeWeight(5.5);
fill(50,26,37);// 2nd line fix curve
line(152,275,159,202);

// right green triangles
noStroke();
fill(86,87,36);
triangle(152,237, 158, 224, 155, 241);

//noStroke();
stroke(86,87,36); // third line
strokeWeight(4.3);
fill(86,87,36);
triangle(167,252, 177, 218, 179, 267);



//leaf one
noStroke();
fill(68,68,33);
beginShape();
vertex(0,50);
vertex(12,1);
vertex(61,0);
vertex(83,5);
vertex(105,60);
vertex(65,71);
vertex(58,79);
vertex(53,57);
vertex(49,57);
vertex(35,79);
vertex(28,77);
vertex(36,41);
endShape(CLOSE);

//leaf two
noStroke();
fill(68,68,33);
beginShape();
vertex(0,90);
vertex(7,80);
vertex(12,82);
vertex(36,87);
vertex(46,72);
vertex(45,75);
vertex(49,92);
vertex(67,71);
vertex(80,77);
vertex(90,80);
vertex(88,81);
vertex(79,114);
vertex(63,133);
vertex(49,129);
vertex(41,140);
vertex(14,135);
vertex(8,155);
vertex(1,148);
endShape(CLOSE);

//branch plus petals
noStroke();
fill(35,17,5);
beginShape();
vertex(15,43);
vertex(39,30);
vertex(58,34);
vertex(80,45);
vertex(115,84);
vertex(78,58);
vertex(69,83);
vertex(68,54);
vertex(59,52);
vertex(55,80);
vertex(54,51);
vertex(43,63);
vertex(39,40);
vertex(22,78);
vertex(11,55);
vertex(7,80);
vertex(0,56);
endShape(CLOSE);

// fix
noStroke();
fill(35,17,5);
beginShape();
vertex(0,56);
vertex(31,30);
vertex(44,29);
vertex(50,29);
vertex(61,26);
vertex(94,25);
vertex(82,33);
vertex(61,35);
vertex(73,40);
vertex(86,31);
vertex(118,29);
vertex(105,36);
vertex(75,39);
vertex(79,43);
vertex(108,45);
vertex(84,51);
vertex(93,57);
vertex(122,51);
vertex(96,61);
vertex(125,66);
vertex(102,69);
endShape(CLOSE);

//noStroke();
stroke(35,17,5); 
strokeWeight(5.5);
fill(35,17,5);
beginShape();
vertex(0,56);
vertex(0,3);
vertex(12,36);
vertex(16,2);
vertex(41,2);
vertex(36,21);
vertex(51,2);
vertex(71,3);
vertex(54,18);
vertex(109,2);
vertex(48,28);
vertex(50,30);
vertex(64,24);
endShape(CLOSE);

//second leaf
//noStroke();
stroke(35,17,5); 
strokeWeight(8);
fill(35,17,5);
beginShape();
vertex(0,125);
vertex(0,91);
vertex(7,114);
vertex(12,95);
vertex(22,81);
vertex(18,103);
vertex(38,76);
vertex(31,95);
vertex(43,84);
vertex(46,93);
vertex(57,80);
vertex(57,88);
vertex(67,87);
vertex(73,75);
endShape(CLOSE);

noStroke();
fill(35,17,5);
beginShape();
vertex(0,125);
vertex(87,92);
vertex(116,108);
vertex(84,101);
vertex(80,106);
vertex(112,118);
vertex(91,119);
vertex(64,106);
vertex(81,117);
vertex(103,133);
vertex(71,121);
vertex(90,145);
vertex(65,130);
vertex(62,136);
vertex(51,128);
vertex(49,134);
vertex(83,152);
vertex(53,145);
vertex(67,162);
vertex(40,148);
vertex(54,170);
vertex(26,146);
vertex(35,168);
vertex(13,140);
vertex(20,181);
vertex(10,172);
vertex(13,192);
vertex(0,166);
endShape(CLOSE);

//middle
stroke(35,17,5); 
strokeWeight(20);
line(0, 129, 82, 92);

//line yellow
noStroke();
fill(70,53,38);
beginShape();
vertex(0,129);
vertex(31,107);
vertex(85,91);
endShape(CLOSE);

//line yellow
noStroke();
fill(70,53,38);
beginShape();
vertex(0,55);
vertex(22,31);
vertex(40,22);
endShape(CLOSE);


//bottom yellow detail 
stroke(190,162,49); 
strokeWeight(4);
fill(190,162,49);
beginShape();
vertex(71,276);
vertex(75,272);
vertex(82,259);
endShape(CLOSE);




