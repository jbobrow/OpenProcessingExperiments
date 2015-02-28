
size(600,600);
background(8,191,189);
smooth();


fill(255, 191, 191);
//neck
beginShape();
vertex(289,360);
vertex(445,306);
vertex(445,373);
vertex(491,421);
vertex(388,604);
vertex(265,608);
vertex(275,419);
vertex(296,396);
endShape(CLOSE);


//hair
fill(#BC4E04);
noStroke ();
beginShape();
vertex(487,280);
vertex(501,217);
vertex(486,109);
vertex(411,55);
vertex(346,37);
vertex(284,41);
vertex(219,96);
vertex(211,199);
endShape(CLOSE);

//face
fill(255, 191, 191);
ellipse(344, 239, 206, 313);

//bangs
beginShape();
fill(#BC4E04);
vertex(455,173);
vertex(417,138);
vertex(353,117);
vertex(300,133);
vertex(279,114);
vertex(241,149);
vertex(253,97);
vertex(350,54);
vertex(445,93);
endShape(CLOSE);

//lefteye
fill(255);
stroke(0);
bezier(262,225,288,199,306,218,312,224);

//lefteye2
bezier(262,225,286,226,294,222,304,219);

//righteye
bezier(348,225,358,219,376,200,411,222);

//btm lip
fill(255,3,19);
noStroke();
bezier(376,324,363,343,312,362,303,328);
//up lip
bezier(300,323,311,299,351,308,376,321);
//mouth
fill(255);
ellipse(338,322,60,10);
//nose
stroke(0);
noFill();
bezier(318,277,325,289,332,282,335,272);
bezier(335,272,363,296,363,263,344,241);
bezier(304,256,311,230,319,226,314,203);
bezier(304,256,302,269,296,285,320,275);
bezier(331,286,335,292,337,309,329,301);
bezier(302,280,295,289,290,296,289,313);
bezier(361,267,372,280,383,292,384,309);


//brows
fill(255,145,3);
noStroke();
bezier(302,200,283,190,255,184,249,207);
bezier(356,193,377,186,411,181,426,199);
