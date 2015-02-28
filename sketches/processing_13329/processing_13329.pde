
size(200,200);
background(#c2e4f2);
// 너부리

int[] a = {0,10,20,30,40,50,60,70,80,90,100};
int[] b = {0,100,200,300,400,500,600,700,800,900};

//팔
fill(#ba8849);
noStroke();

beginShape();
vertex(55,100);
vertex(10,120);
vertex(15,121);
vertex(11,124);
vertex(16,125);
vertex(13,128);
vertex(85,105);
endShape(CLOSE);

beginShape();
vertex(145,100);
vertex(190,120);
vertex(185,121);
vertex(189,124);
vertex(184,125);
vertex(187,128);
vertex(115,105);
endShape(CLOSE);

fill(255);
beginShape();
vertex(23,115)
vertex(10,120);
vertex(15,121);
vertex(11,124);
vertex(16,125);
vertex(13,128)
vertex(27,123)
endShape(CLOSE);

beginShape();
vertex(177,115)
vertex(190,120);
vertex(185,121);
vertex(189,124);
vertex(184,125);
vertex(187,128)
vertex(173,123)
endShape(CLOSE);

//몸통
fill(#ba8849);
noStroke();
ellipse(100,160,125,140);



//얼굴

noStroke();
fill(#ba8849);
beginShape();

vertex(a[7],b[0]);
vertex(a[6]+5,b[0]+25);
vertex(a[1]+5,b[1]-25);
vertex(a[2]+2,b[1]-22);
vertex(a[1]+5,b[1]-19);
vertex(a[2]+2,b[1]-16);
vertex(a[1]+5,b[1]-14);
vertex(a[10],b[1]+20);

vertex(b[2]-15,a[8]+6);
vertex(b[2]-22,a[8]+4);
vertex(b[2]-15,a[8]+1);
vertex(b[2]-22,a[7]+8);
vertex(b[2]-15,a[7]+5);
vertex(b[1]+35,a[2]+5);
vertex(b[1]+30,a[0]);

endShape(CLOSE);

noStroke();
fill(#ece3e1);

beginShape();

vertex(b[1]-13,a[0]);
vertex(b[1]-12,a[2]-1);
vertex(b[1]+13,a[2]-1);
vertex(b[1]+14,a[0]);

endShape(CLOSE);

//코

noStroke();
fill(255);
ellipse(b[1],120,73,75);

stroke(130);
line(100,120,63,105);
line(100,120,137,105);

noStroke();
fill(#ba8849);
beginShape();
vertex(100,120);
vertex(63,105);
vertex(62,150);
vertex(137,150);
vertex(150,137);
vertex(137,105);

endShape(CLOSE);

//배 흰부분

noStroke();
fill(255);
ellipse(100,170,70,80);

noStroke();
fill(0);

ellipse(100,113, 20,20);

//귀부분

noStroke();
strokeWeight(1);
fill(#ece3e1);

beginShape();
vertex(a[7],b[0]);
vertex(a[6]+5,b[0]+25);
vertex(a[7]+2,b[0]+22);
vertex(a[7]+5,b[0]);
endShape(CLOSE);

beginShape();

vertex(b[1]+30,a[0]);
vertex(b[1]+35,a[2]+5);
vertex(b[1]+28,a[2]+2);
vertex(b[1]+25,a[0]);

endShape(CLOSE);

noStroke();
fill(#c2e4f2);

beginShape();

vertex(b[1]-9,a[0]);
vertex(b[1]-8,a[2]-4);
vertex(b[1]+8,a[2]-4);
vertex(b[1]+9,a[0]);

endShape(CLOSE);

//눈

noStroke(0);
fill(0);
beginShape();
vertex(93,51);
bezierVertex(85,28,40,58,43,73);
bezierVertex(55,93,80,63,95,83);
vertex(95,83);
endShape(CLOSE);

beginShape();
vertex(107,51);
bezierVertex(115,28,160,58,155,73);
bezierVertex(145,93,120,63,105,83);
vertex(105,83);
endShape(CLOSE);

fill(255);
beginShape();
vertex(75,50);
bezierVertex(70,43,33,70,90,75)
vertex(87,70);
endShape(CLOSE);

beginShape();
vertex(125,50);
bezierVertex(130,43,167,70,110,75)
vertex(113,70);
endShape(CLOSE);


fill(0);
ellipse(80,65,2,2);
ellipse(120,65,2,2);
