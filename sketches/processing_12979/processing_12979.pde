
size(200,200);
background(204,255,102);
//face
strokeWeight(5)
fill(204,153,102);
beginShape();
vertex(3+10,0+10);
vertex(3+10,160-30);
vertex(40+10,197-30);
vertex(160-10,197-30);
vertex(197-10,160-30);
vertex(197-10,0+10);
vertex(160-10,40+10);
vertex(40+10,40+10);
vertex(3+10,0+10);
endShape(CLOSE);

//귓바퀴
fill(255,153,102);
stroke(255,153,102);
strokeWeight(1);
beginShape();
vertex(8+15,0+35);
vertex(8+15,55);
vertex(8+35,55);
endShape(CLOSE);

beginShape();
vertex(8+170,0+35);
vertex(8+170,55);
vertex(8+150,55);
endShape(CLOSE);


//left eye
strokeWeight(2)
stroke(0);
fill(0);
beginShape();
vertex(60,85);
vertex(60,100);
vertex(70,100);
vertex(70,85);
endShape(CLOSE);

rect(57,85,2,2);

//right eye
beginShape();
vertex(60+70,85);
vertex(60+70,100);
vertex(70+70,100);
vertex(70+70,85);
endShape(CLOSE);

rect(70+71,85,2,2);

//nose
fill(153,102,0);
stroke(153,102,0);
beginShape();
vertex(90,100);
vertex(100,110);
vertex(103,110);
vertex(110,100);
endShape(CLOSE);

//mouth
stroke(0);
line(102,111,102,130);
line(85,130,120,130);
line(85,130,85,120);
line(120,130,120,120);

//left cheek 
fill(255,102,102);
stroke(255,102,102);
ellipse(60,110,20,5);


//right cheek 
ellipse(60+80,110,20,5);

//flower
fill(255,051,051);
stroke(255,051,051);
ellipse(100,20,3,3);
ellipse(96,24,3,3);
ellipse(104,24,3,3);
ellipse(100,28,3,3);

fill(255,255,0);
stroke(255,255,0);
ellipse(100,24,3,3);

stroke(102,204,102);
fill(102,204,102);
line(100,32,100,46);

beginShape();
vertex(100,46);
vertex(94,39);
vertex(92,42);
endShape(CLOSE);

beginShape();
vertex(100,46);
vertex(94+12,39);
vertex(92+16,42);
endShape(CLOSE);

//body
stroke(0);
strokeWeight(5);
fill(204,153,102);
beginShape();
vertex(60,167);
vertex(50,205);
vertex(150,205);
vertex(140,167);
endShape(CLOSE);

fill(255);
noStroke();
ellipse(100,225,70,100);

//hand
stroke(0);
fill(204,153,102);
ellipse(30+20,198,40,30);
line(20+20,200,20+20,195);
line(20+10+20,200,20+10+20,195);
line(20+20+20,200,20+20+20,195);
