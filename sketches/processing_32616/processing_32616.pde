
size(500,800);
background(244,244,244);

smooth();
strokeWeight(2);
stroke(0,0,0);

//top star
line(60,0,60,80);
line(20,40,100,40);
line(30,80,90,0);
line(30,0,90,80);

//right bottom star
line(350,350,450,350);
line(400,300,400,400);
line(350,400,450,300);
line(350,300,450,400);

//right top star
line(470,50,500,80);
line(470,100,500,100);
line(470,150,500,120);

//top right line
line(400,10,400,80);


fill(0);
ellipse(10,30,30,20);
ellipse(400,1,30,20);
ellipse(400,70,30,20);

noFill();
beginShape();
curveVertex(10, 0);
curveVertex(10, 0);
curveVertex(10, 40);
curveVertex(10, 40);
endShape();

noFill();
beginShape();
curveVertex(300, 0);
curveVertex(250, 100);
curveVertex(200, 150);
curveVertex(5, 150);
curveVertex(0, 170);
curveVertex(0, 170);
endShape();

fill(237,28,36);
ellipse(5,130,30,20);

noFill();
beginShape();
curveVertex(0, 330);
curveVertex(0, 330);
curveVertex(60, 350);
curveVertex(60, 350);
curveVertex(100, 200);
curveVertex(100, 200);
endShape();

noFill();
beginShape();
curveVertex(20, 300);
curveVertex(20, 300);
curveVertex(10, 350);
curveVertex(10, 350);
curveVertex(0, 370);
curveVertex(0, 370);
endShape();

fill(0);
ellipse(20,300,30,20);

fill(237,28,36);
ellipse(15,450,40,30);


fill(0);
triangle(-100,700,50,600,200,700);


beginShape();
curveVertex(200,  0);
curveVertex(200,  0);
curveVertex(250,  300);
curveVertex(250,  300);
curveVertex(230,  530);
curveVertex(340,  510);
curveVertex(330,  300);
curveVertex(330,  300);
curveVertex(350, 0);
curveVertex(350, 0);
endShape();

noFill();
beginShape();
curveVertex(300, 800);
curveVertex(300, 800);
curveVertex(400, 500);
curveVertex(400, 500);
curveVertex(0, 170);
curveVertex(0, 170);
endShape();

 

