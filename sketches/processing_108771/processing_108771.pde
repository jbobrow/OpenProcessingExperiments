
//Homework one static composition
size(400,400);

//Green background
background(70,130,40);

//yellow circles
ellipseMode(CENTER);
noStroke();
fill(255,200,0);
ellipse(0,0,450,450);
ellipse(0,400,450,450);
ellipse(400,0,450,450);
ellipse(400,400,450,450);

//red rectangles
fill(191,54,8);
noStroke();
rect(0,0,400,10);
rect(0,0,10,400);
rect(390,0,10,400);
rect(0,390,400,10);

//white circles
fill(255);
ellipse(0,0,350,350);
ellipse(0,400,350,350);
ellipse(400,0,350,350);
ellipse(400,400,350,350);

//blue circles
fill(45,75,160);
stroke(0);
ellipse(0,0,300,300);
ellipse(0,400,300,300);
ellipse(400,0,300,300);
ellipse(400,400,300,300);

//blue triangles
noStroke();
quad(150,150,250,250,150,250,250,150);


