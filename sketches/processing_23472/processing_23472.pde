
// -----Background info----
size(450, 300);
//background(192, 198, 219);


// ----------shapes--------


//feet
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
ellipse(206, 136, 125, 225);
//--------------------------

//eyes
smooth();
rect(148, 94, 116, 03);
smooth();
ellipse(206, 96, 45, 45);
smooth();
ellipse(206, 96, 40, 40);
smooth();
ellipse(206, 96, 15, 15);
smooth();
ellipse(206, 96, 5, 5);
//----------------------------

//belt
smooth();
rect(205, 204, 03, 44);
smooth();
rect(157, 204, 97, 03);
//--------------------------

//mouth
smooth();
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
