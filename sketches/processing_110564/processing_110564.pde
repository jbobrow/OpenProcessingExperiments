
size(277,168);
background(255,0,0);

//arm, top left corner
fill(0,0,255);
beginShape();
vertex(0,0);
vertex(35,0);
vertex(0,35);
endShape(CLOSE);

//arm
beginShape();
vertex(0,50);
vertex(35,100);
vertex(15,125);
vertex(0,100);
endShape(CLOSE);

//body
beginShape();
vertex(55,0);
vertex(50,120);
vertex(10,168);
vertex(277,168);
vertex(277,0);
vertex(55,0);
endShape();

//breast
strokeWeight(5);
ellipse(115,10,60,60);


strokeWeight(1);


//guitar side
//beginShape();
//fill(240,140,0);
//curveVertex(240,0);
//curveVertex(240,0);
//curveVertex(270,60);
//curveVertex(260,100);
//curveVertex(230,140);
//curveVertex(225,168);
//curveVertex(170,150);
//curveVertex(170,200);
//curveVertex(170,200);
//endShape();

//guitar
fill(206,140,0);
beginShape();
curveVertex(180,0);
curveVertex(180,0);
curveVertex(150,20);
curveVertex(130,70);
curveVertex(50,140);
curveVertex(38,150);
curveVertex(30,168);
curveVertex(30,168);
curveVertex(180,168);
curveVertex(220,100);
curveVertex(250,70);
curveVertex(250,70);
curveVertex(260,40);
curveVertex(240,0);
curveVertex(240,0);
endShape();



//guitar2
fill(0);
beginShape();
vertex(250,0);
vertex(210,40);
vertex(200,30);
vertex(230,0);
endShape();

//guitar3
fill(136,135,100);
ellipse(165,100,50,55);


//hand
//fill(253,195,146);
//beginShape();
//curveVertex(35,100);
//curveVertex(35,100);
//curveVertex(45,100);
//curveVertex(60,100);
//curveVertex(70,95);
//curveVertex(80,100);
//curveVertex(100,110);
//curveVertex(130,120);
//curveVertex(100,130);
//curveVertex(70,120);
//curveVertex(70,120);
//curveVertex(100,150);
//curveVertex(150,130);
//curveVertex(150,130);
//endShape(CLOSE);
