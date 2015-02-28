
//start 11.05

size(250,234);
smooth();
background(250,245,223);






// Eyes
beginShape();
vertex(0,40);
fill(33,33,31);
bezierVertex(13,6,93,4,158,35);
bezierVertex(161,37,139,49,123,61);
bezierVertex(109,72,73,83,52,76);
bezierVertex(29,76,0,54,0,40);
endShape();





// Eyes 2
beginShape();
vertex(0,41);
fill(139,197,112);
bezierVertex(32,17,93,16,158,35);
bezierVertex(130,45,101,56,77,66);
bezierVertex(51,64,37,59,29,55);
bezierVertex(21,50,3,48,0,41);
endShape();

// eyes dot white
noStroke();
fill(255,255,255);
beginShape();
vertex(40,27);
bezierVertex(50,17,85,20,90,24);
bezierVertex(94,29,83,60,58,60);
bezierVertex(45,56,41,50,36,36);
endShape();



// eyes dot 2
noStroke();
fill(0);
ellipse(63,38,34,34);


// eyes dot 2
noStroke();
fill(234,107,74);
ellipse(63,38,22,22);

// eyes dot 3
noStroke();
fill(0);
ellipse(63,38,8,8);

stroke(0);
bezier(15,59,8,64,4,75,6,78);




// papapa
beginShape();
stroke(0);
vertex(94,104);
noFill();
bezierVertex(92,80,131,83,128,90);
bezierVertex(133,92,124,135,123,182);
bezierVertex(123,192,129,233,106,233);
bezierVertex(81,233,70,207,70,196);
bezierVertex(70,184,73,162,85,145);
bezierVertex(90,140,95,116,94,104);
endShape();

// circle half 1
beginShape();
fill(0);
vertex(86,142);
bezierVertex(71,140,64,164,76,167);
bezierVertex(76,159,84,148,86,142);
endShape();

// circle half 1.2
beginShape();
fill(234,107,74);
vertex(86,142);
bezierVertex(100,145,92,170,76,167);
bezierVertex(76,166,84,148,86,142);
endShape();

// brabrabra red
//beginShape();
//fill(234,107,74);
//vertex(70,195);
//bezierVertex(111,186,122,194,122,214);
//bezierVertex(123,226,107,220,221,33);
//endShape();




// curve line1
beginShape();
noFill();
vertex(0,97);
bezierVertex(30,121,129,98,151,67);
bezierVertex(169,53,168,19,153,0);
endShape();

// curve line2
bezier(0,5,2,1,6,0,11,0);

// line 1
strokeWeight(1);
bezier(0,220,54,197,232,158,249,145);

// eye wingle
bezier(55,233,72,220,123,220,137,233);
bezier(38,71,33,74,32,86,35,87);
bezier(61,78,57,81,58,94,63,95);

//dumbell 1
fill(0);
ellipse(173,73,10,10);
ellipse(173,99,10,10);
line(173,78,173,94);

//dumbell 2
fill(0);
ellipse(22,174,9,9);
ellipse(49,170,9,9);
line(26,173,43,171);



//Star 1
line(2,162,0,165);
line(0,172,8,172);
line(0,178,5,185);

//Star 2
line(19,131,44,132);
line(20,140,38,125);
line(28,145,31,120);
line(22,122,39,141);

//Star 3
line(140,133,172,133);
line(155,114,153,148);
line(144,122,166,145);
line(144,144,165,122);

line(191,100,228,70);
line(189,69,220,105);
line(188,88,221,87);
line(208,66,204,105);



