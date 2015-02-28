
//Assignment no.2
//Kandinsky Painting 
//Betty Cui
//September 10,2012

background(0,0,0);
size(500,300);
smooth();



//purple shape background
fill(102,51,153);
beginShape() ;
vertex(110,125);
vertex(180,300);
vertex(450,300);
vertex(350,0);
endShape(CLOSE);

//pink curvy shape on top of purple

noStroke();
fill(220,102,153,150);
beginShape() ;
vertex(180,90);
vertex(305,0);
vertex(310,40);
vertex(360,300);
vertex(220,300);
vertex(200,240);
vertex(155,100);
endShape(CLOSE);

//greenish curve out

noStroke();
fill(102,255,204,180);
beginShape();
vertex(100,50);
vertex(160,120);
vertex(340,0);
vertex(210,0);
endShape();


//pink quad
fill(227, 148, 179);
quad(0, 80, 100, 60, 80, 80, 0, 100);
//green quad
fill(195, 230, 196,180);
quad(0, 250, 30, 300, 50, 270, 0, 125);

//left top yellow curve
fill(245, 173, 17);
beginShape();
curveVertex(0, 0);
curveVertex(0, 0);
curveVertex(25,10);
curveVertex(50, 10);
curveVertex(100, 0);
curveVertex(100, 0);
endShape();

//yellow quad right top
fill(245, 173, 17);
quad(490,-20,358,20,362,35,510,20);

//blue quad right top

fill(125,166,209);
quad(500,40,500,80,377,90,370,70);

//ellipse left bottom
fill(195, 230, 196,180);
ellipse(10,330,150,123);

//orange quad
fill(227,100,30,180);
beginShape();
curveVertex(0,145);
curveVertex(0,145);
curveVertex(70,135);
curveVertex(90,125);
curveVertex(90,125);
vertex(90,125);
vertex(125,150);
curveVertex(125,150);
curveVertex(125,150);
curveVertex(120,175);
curveVertex(0,200);
curveVertex(0,200);
endShape(CLOSE);

//orange bottom quad
fill(227,100,30,230);
quad(10,265,30,300,65,300,35,230);

//green square
fill(54,181,143);
beginShape();
vertex(20,130);
vertex(20,140);
vertex(30,140);
vertex(30,130);
endShape();

//pink square
fill(227, 148, 179);
beginShape();
vertex(450,100);
vertex(450,110);
vertex(460,110);
vertex(460,100);
endShape();

//red musical note
fill(230,62,11);
beginShape();
curveVertex(255,125);
curveVertex(255,125);
curveVertex(275,150);
curveVertex(280,170);
curveVertex(280,170);
endShape(CLOSE);
//ecllipse
fill(230,62,11);
ellipse(276,172,20,20);

//green square2
fill(140,227,132);
beginShape();
vertex(290,230);
vertex(290,240);
vertex(300,240);
vertex(300,230);
endShape();

//quads

fill(255,214,120);
rect(250,70,40,8);

fill(150,237,135);
rect(256,80,45,8);

fill(229,140,245);
rect(262,90,45,8);

//blue shape
fill(94,125,196);
beginShape();
vertex(180,120);
vertex(195,125);
vertex(210,140);
vertex(260,300);
endShape(CLOSE);

//quads 2
fill(255,214,120,220);
rect(220,170,40,8);

fill(232,225,195);
rect(225,190,40,8);

//green square 3
fill(42,163,71);
beginShape();
vertex(230,130);
vertex(230,140);
vertex(240,140);
vertex(240,130);
endShape();

//yellow organge square
fill(235,146,45);
beginShape();
vertex(235,150);
vertex(235,160);
vertex(245,160);
vertex(245,150);
endShape();

//red square
fill(227,46,36);
beginShape();
vertex(300,60);
vertex(300,70);
vertex(310,70);
vertex(310,60);
endShape();

fill(237,225,171);
beginShape();
vertex(330,120);
vertex(330,130);
vertex(340,130);
vertex(340,120);
endShape();

//pink shape
fill(235, 148, 179);
beginShape();
vertex(135,70);
vertex(155,90);
vertex(255,30);
vertex(250,15);
endShape();


