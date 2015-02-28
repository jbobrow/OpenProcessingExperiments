
size(500, 500);
background(#ffffff);

//eye
strokeWeight(6);
strokeJoin(ROUND);
ellipse(100,239,154,154); //leftwhite
ellipse(411,239,154,154); //rightwhite
fill(#000000);
ellipse(100,239,13,13); //leftblack
ellipse(411,239,13,13); //rightblack
//nose
noFill();
strokeWeight(7.0);
strokeJoin(MITER);
beginShape();
vertex(269, 239);
vertex(294, 260);
vertex(277, 285);
endShape();
//eyebrows
line(171, 171, 87, 121);
line(349, 167, 416, 121);
//mouth
beginShape();
vertex(289, 303);
vertex(304, 324);
vertex(222, 339);
endShape();
beginShape();
vertex(270, 395);
vertex(284, 370);
vertex(232, 381);
endShape();
fill(#000000);
quad(222,339,284,328,270,373,232,381);



