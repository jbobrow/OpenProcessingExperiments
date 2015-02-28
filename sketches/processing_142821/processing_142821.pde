
size(400,500);
background(255);


//gorro
fill(235,242,34);
beginShape();
curveVertex(width/2+width/8,height/8.75);
curveVertex(width/2+width/8,height/8.75);
curveVertex(width/2+width/5,height/4.5);
curveVertex(width/2+width/4,height/2.77);
curveVertex(width/2.65,height/2.75);
curveVertex(width/3.5,height/2.95);
curveVertex(width/3.5,height/2.95);
endShape();

beginShape();
curveVertex(width/2.75,height/8.5);
curveVertex(width/2.75,height/8.5);
curveVertex(width/4,height/2.77);
curveVertex(width/1.65,height/2.75);
curveVertex(width/1.75,height/2.8);
curveVertex(width/1.75,height/2.8);
endShape();

//patas
stroke(0);
strokeWeight(1);
fill(32,183,13);
beginShape();
vertex(width/2.31,height/1.85);
vertex(width/2.31,height/1.85);
vertex(width/2.15,height/1.3);
vertex(width/2.475,height/1.25);
vertex(width/1.65,height/1.25);
vertex(width/1.85,height/1.3);
vertex(width/1.775,height/1.85);
endShape(CLOSE);


line(width/2,height/3,width/2,height/1.25);


//cuerpo+brazos
fill(32,183,13);
stroke(0);
ellipse(width/2.6,height/2.35,width/11.43,height/5);
ellipse(width/2+width/8.6,height/2.35,width/11.43,height/5);
ellipse(width/2,height/2.35,width/3.55,height/3.125);

fill(255);
ellipse(width/2,height/2.35,width/5,height/4.5);


//cara
fill(32,183,13);
stroke(0);
strokeWeight(1);
ellipse(width/2,height/4.66,height/3.5,height/3.5);


//boca
fill(255,0,0);
stroke(1);

line(width/2.25,height/3.5,width/1.75,height/3.5);


beginShape();
curveVertex(width/2.25,height/3.5);
curveVertex(width/2.25,height/3.5);
curveVertex(width/2,height/2.95);
curveVertex(width/1.75,height/3.5);
curveVertex(width/1.75,height/3.5);
endShape(CLOSE);

//ojos
fill(255);
stroke(0);
strokeWeight(1);
ellipse(width/2.5,height/5,width/10,width/10);
ellipse(width/1.65,height/5,width/10,width/10);

fill(0);
ellipse(width/2.5,height/5,width/20,width/20);
ellipse(width/1.65,height/5,width/20,width/20);
strokeWeight(1);
line(width/1.5425,height/7.5,width/2.85,height/7.5);

stroke(0);
fill(235,242,34);
beginShape();
curveVertex(width/1.5425,height/7.5);
curveVertex(width/1.5425,height/7.5);
curveVertex(width/1.675,height/11.5);
curveVertex(width/2,height/15);
curveVertex(width/2.425,height/12);
curveVertex(width/2.85,height/7.5);
curveVertex(width/2.85,height/7.5);
endShape();





