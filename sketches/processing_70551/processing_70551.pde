
// BACKGROUND


size(600,600);
background(75,130,30); //creating the background.

noStroke(); //adding a lighter layer to the background.
fill(80,170,30);
beginShape();
vertex(0,0);
vertex(500,0);
vertex(300,300);
vertex(0,500);
endShape();

fill(45,110,20); //adding background that represents shoulders
quad(0,540,0,600,600,600,600,500);


//DRAWING THE HEAD AND NECK


fill(190,185,20); //adding the neck.
rect(255,450,100,100);

rect(230,525,150,30); //adding the lower neck.

ellipse(230,540,30,30); //adding the curved part.
ellipse(375,540,30,30);

triangle(210,525,230,525,218,550); //adding the angular parts to the neck area.
triangle(375,525,400,525,390,545);

strokeWeight(4); //Head
stroke(200,185,0);
fill(200,175,0);
ellipse(300,275,400,400);


// ABSTRACT FACIAL SHAPES


noStroke(); //Left eye triangle
fill(120,150,0);
triangle(250,150,290,250,170,220);

beginShape(); //Right eye shape
vertex(305,275); //right eye duct. points rotate clockwise.
vertex(320,150);
vertex(370,210);
vertex(440,170);
vertex(425,260);
endShape();

fill(170,170,20);
beginShape(); //Mid-eye shape
vertex(250,150);
vertex(290,250);
vertex(305,275);
vertex(320,150);
vertex(290,75);
endShape();

fill(200,200,0); //Face upper left shape
quad(250,150,170,220,150,145,190,140);

fill(210,200,0); //Quad above right eye shape
quad(370,210,440,170,455,150,320,75);

fill(170,180,0); //Odd right shape on face
beginShape();
vertex(455,150);
vertex(440,170);
vertex(425,260);
vertex(445,350);
vertex(445,410);
curveVertex(460,425);
curveVertex(480,375);
curveVertex(480,360);
curveVertex(485,350);
curveVertex(490,320);
curveVertex(490,300);
curveVertex(485,280);
curveVertex(480,200);
curveVertex(460,225);
endShape();

fill(150,150,20); //Shape underneath mouth
beginShape();
vertex(360,310);
vertex(425,260);
vertex(445,350);
vertex(445,410);
vertex(355,465);
endShape();

fill(110,150,20); //Shape left of left eye
quad(170,220,105,250,115,350,200,260);

fill(210,200,0); //Shape below left eye
beginShape();
vertex(290,250);
vertex(240,270);
vertex(200,260);
vertex(115,350);
vertex(180,435);
endShape();

fill(170,170,20); //Triangle underneath nose
triangle(230,350,360,320,355,465);

fill(130,150,0); //Shape beneath nose
beginShape();
vertex(230,350); //Starts at upper point. Rotates clockwise.
vertex(355,465);
vertex(320,475);
vertex(290,475);
vertex(250,465);
vertex(215,455);
vertex(180,435);
endShape();


// FACIAL FEATURES

//Eyes
strokeWeight(4); //Adding the left sclera
stroke(200,230,0);
fill(230,230,0);
beginShape();
vertex(290,250); //eye duct point. points circle counter-clockwise.
vertex(250,205);
vertex(200,210);
vertex(170,220);
vertex(200,260);
vertex(240,270);
endShape();

beginShape(); //right sclera
vertex(305,275); //eye duct point. points circle clockwise.
vertex(350,240);
vertex(400,245);
vertex(425,260);
vertex(400,300);
vertex(360,310);
endShape();

noStroke(); //Adding the irises
fill(100,180,0);
ellipse(263,245,40,40); //left
ellipse(337,275,40,40); //right

fill(0,50,0); //Adding the pupils
ellipse(270,245,25,25); //left
ellipse(330,275,25,25); //right

fill(240,240,225); //Light in pupils
ellipse(275,240,7,7); //left
ellipse(335,270,7,7); //right

//Nose
strokeWeight(3);
stroke(210,210,0);
fill(200,200,0);
beginShape();
vertex(300,275); //top of nose
vertex(250,350);
curveVertex(360,500);
curveVertex(280,380);
curveVertex(300,405);
curveVertex(300,455);
endShape();

//Mouth
strokeWeight(3);
stroke(0,50,0);
fill(0,60,0);
beginShape();
curveVertex(300,400);
curveVertex(330,430);
curveVertex(390,360);
curveVertex(420,350);
curveVertex(300,410);
endShape();

//Tongue
fill(160,90,0);
ellipse(420,380,40,40);
noStroke();
quad(390,375,420,400, 435,380, 407,360);
strokeWeight(3);
stroke(0,50,0);
line(407,360,415,360);
line(390,375,400,385);
line(400,365,435,390);

// ABSTRACT OBJECTS FOR THE NECK


noStroke(); //Neck rectangle
fill(80,130,30);
rect(290,490,40,40);

fill(70,100,50); //Neck rectangle
rect(330,475,25,15);

fill(100,130,70); //Neck quadrilateral
quad(330,530,330,555,385,550,350,540);



