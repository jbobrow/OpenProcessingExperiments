
size(500,500);
background(#FFD5B4);

//eye
noStroke();
fill(0);
ellipse(150,200,20,20);
fill(255);
ellipse(150,200,10,10);
fill(0);
ellipse(360,200,20,20);
fill(255);
ellipse(360,200,10,10);

//colors
noStroke();
fill(#FFDEC4);
ellipse(255,280,15,10);
fill(#FFCCB4); //light
ellipse(120,300,80,40);
ellipse(400,300,80,40);
fill(#F5C7A3); //dark
ellipse(255,300,40,20);
ellipse(255,410,40,20);
rect(470,0,30,500);
rect(0,0,35,500);
quad(200,110,300,110,280,150,228,150);
triangle(0,0,110,0,0,230);
triangle(390,0,500,0,500,230);


stroke(0);
strokeWeight(8);
fill(250,99);
rect(50,150,180,100,18,18,25,25);
rect(280,150,180,100,18,18,25,25);

stroke(0);
strokeWeight(9);
noFill();
line(230,183,280,183);

stroke(0);
strokeWeight(9);
noFill();
line(0,160,50,183);
line(460,183,500,160);

noFill(); 
stroke(0);
strokeWeight(11);
beginShape();
curveVertex(100,0);
curveVertex(100,0);
curveVertex(75,15);
curveVertex(15,75);
curveVertex(0,100);
curveVertex(0,100);
endShape();

noFill(); 
stroke(0);
strokeWeight(11);
beginShape();
curveVertex(400,0);
curveVertex(400,0);
curveVertex(425,15);
curveVertex(485,75);
curveVertex(500,100);
curveVertex(500,100);
endShape();

fill(0); //hairsides
noStroke();
triangle(0,0,90,0,0,90);
triangle(410,0,500,0,500,90);

stroke(0); //eyebrows
strokeWeight(9);
line(90,110,200,110);
line(300,110,420,110);
line(90,110,60,120);
line(420,110,450,120);


strokeWeight(2); //nostrilsssss
point(245,300);
point(265,300);


noFill(); //mouth
stroke(0);
strokeWeight(4);
beginShape();
curveVertex(205,400);
curveVertex(205,400);
curveVertex(225,390);
curveVertex(255,380);
curveVertex(285,390);
curveVertex(305,400);
curveVertex(305,400);
endShape();
strokeWeight(6);
point(205,400);
point(305,400);

 //sides of face
beginShape();
stroke(0);
strokeWeight(6);
curveVertex(0,300);
curveVertex(0,300);
curveVertex(30,400);
curveVertex(55,450);
curveVertex(100,500);
curveVertex(100,500);
endShape();
beginShape();
curveVertex(500,300);
curveVertex(500,300);
curveVertex(470,400);
curveVertex(445,450);
curveVertex(400,500);
curveVertex(400,500);
endShape();
fill(0);
noStroke();
triangle(0,300,0,500,70,500);
triangle(51,450,70,500,100,500);
triangle(500,300,500,500,460,450);
triangle(400,500,450,440,500,500);
triangle(450,440,470,400,500,500);
stroke(0);
strokeWeight(1);
line(450,440,500,500);
