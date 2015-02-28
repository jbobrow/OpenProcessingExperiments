
// -----Background info----
size(450, 300);
background(184, 229, 240);


// hair
smooth();
noStroke();
fill(160,45,32);
ellipse(166, 56, 50, 70);
smooth();
noStroke();
fill(160,45,32);
ellipse(246, 56, 50, 70);
smooth();
noStroke();
fill(160,45,32);
ellipse(206, 36, 50, 70);

//---------------------------

//feet
fill(224,154,61);
smooth();
beginShape();
vertex(220, 230);
vertex(240, 230);
vertex(240, 250);
vertex(260, 250);
vertex(260, 270);
vertex(220, 270);
endShape(CLOSE);
smooth();
fill(224,154,61);
beginShape();
vertex(192, 230);
vertex(172, 230);
vertex(172, 250);
vertex(152, 250);
vertex(152, 270);
vertex(192, 270);
endShape(CLOSE);
//---------------------



//body
smooth();
noStroke();
fill(255,175,0);
ellipse(206, 136, 125, 225);

//--------------------------

//eyes
smooth();
fill(28, 28, 28);
rect(148, 94, 116, 03);
smooth();
fill(28, 28, 28);
ellipse(206, 96, 48, 48);
smooth();
fill(255, 225, 225);
ellipse(206, 96, 40, 40);
smooth();
fill(170, 165, 163);
ellipse(206, 96, 15, 15);
smooth();
fill(28, 28, 28);
ellipse(206, 96, 5, 5);
//----------------------------

//belt
smooth();
stroke(28, 28, 28);
fill(160,45,32);
rect(205, 204, 03, 44);
smooth();
stroke(28, 28, 28);
rect(157, 204, 97, 06);
//--------------------------

//mouth
smooth();
fill(160,45,32);
noStroke();
beginShape();
vertex(240, 150);
vertex(230, 150);
vertex(230, 160);
vertex(185, 160);
vertex(185, 150);
vertex(175, 150);
vertex(175, 170);
vertex(240, 170);
endShape(CLOSE);

//----------------------------
