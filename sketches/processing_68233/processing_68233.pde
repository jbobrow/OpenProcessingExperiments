
// M. Yvonne Hidle (mhidle)
// yvonnehidle@gmail.com 
// (C) M. Yvonne Hidle


// Set parameters
size(400,400);
background(235);
smooth();


//Background Grid
beginShape(QUAD_STRIP);
stroke(235);
strokeWeight(2);
fill(200,80);
vertex(0,0);
vertex(0,15);
vertex(30,0);
vertex(30,15);
vertex(50,0);
vertex(50,15);
vertex(80,0);
vertex(80,15);
vertex(90,0);
vertex(90,15);
vertex(130,0);
vertex(130,15);
vertex(190,0);
vertex(190,15);
vertex(200,0);
vertex(200,15);
vertex(250,0);
vertex(250,15);
vertex(300,0);
vertex(300,15);
vertex(330,0);
vertex(330,15);
vertex(350,0);
vertex(350,15);
vertex(380,0);
vertex(380,15);
vertex(400,0);
vertex(400,15);
endShape();

beginShape(QUAD_STRIP);
stroke(235);
strokeWeight(2);
fill(200,80);
vertex(0,15);
vertex(0,45);
vertex(30,15);
vertex(30,45);
vertex(50,15);
vertex(50,45);
vertex(80,15);
vertex(80,45);
vertex(90,15);
vertex(90,45);
vertex(130,15);
vertex(130,45);
vertex(190,15);
vertex(190,45);
vertex(200,15);
vertex(200,45);
vertex(250,15);
vertex(250,45);
vertex(300,15);
vertex(300,45);
vertex(330,15);
vertex(330,45);
vertex(350,15);
vertex(350,45);
vertex(380,15);
vertex(380,45);
vertex(400,15);
vertex(400,45);
endShape();

beginShape(QUAD_STRIP);
stroke(235);
strokeWeight(2);
fill(200,80);
vertex(0,45);
vertex(0,150);
vertex(30,45);
vertex(30,150);
vertex(50,45);
vertex(50,150);
vertex(80,45);
vertex(80,150);
vertex(90,45);
vertex(90,150);
vertex(130,45);
vertex(130,150);
vertex(190,45);
vertex(190,150);
vertex(200,45);
vertex(200,150);
vertex(250,45);
vertex(250,150);
vertex(300,45);
vertex(300,150);
vertex(330,45);
vertex(330,150);
vertex(350,45);
vertex(350,150);
vertex(380,45);
vertex(380,150);
vertex(400,45);
vertex(400,150);
endShape();

beginShape(QUAD_STRIP);
stroke(235);
strokeWeight(2);
fill(200,80);
vertex(0,150);
vertex(0,180);
vertex(30,150);
vertex(30,180);
vertex(50,150);
vertex(50,180);
vertex(80,150);
vertex(80,180);
vertex(90,150);
vertex(90,180);
vertex(130,150);
vertex(130,180);
vertex(190,150);
vertex(190,180);
vertex(200,150);
vertex(200,180);
vertex(250,150);
vertex(250,180);
vertex(300,150);
vertex(300,180);
vertex(330,150);
vertex(330,180);
vertex(350,150);
vertex(350,180);
vertex(380,150);
vertex(380,180);
vertex(400,150);
vertex(400,180);
endShape();

beginShape(QUAD_STRIP);
stroke(235);
strokeWeight(2);
fill(200,80);
vertex(0,180);
vertex(0,400);
vertex(30,180);
vertex(30,400);
vertex(50,180);
vertex(50,400);
vertex(80,180);
vertex(80,400);
vertex(90,180);
vertex(90,400);
vertex(130,180);
vertex(130,400);
vertex(190,180);
vertex(190,400);
vertex(200,180);
vertex(200,400);
vertex(250,180);
vertex(250,400);
vertex(300,180);
vertex(300,400);
vertex(330,180);
vertex(330,400);
vertex(350,180);
vertex(350,400);
vertex(380,180);
vertex(380,400);
vertex(400,180);
vertex(400,400);
endShape();


//Quads top
// Quad 1
noStroke();
fill(180);
quad(0,0,30,0,40,30,0,30);
// Quad 2
noStroke();
fill(80);
quad(30,0,50,0,45,25,40,30);
// Quad 3
noStroke();
fill(205);
quad(50,0,80,0,70,30,45,25);
// Quad 4
noStroke();
fill(130);
quad(80,0,100,0,90,25,70,30);
// Quad 5
noStroke();
fill(180);
quad(100,0,150,0,150,25,90,25);
// Quad 6
noStroke();
fill(200);
quad(150,0,200,0,200,40,150,25);
// Quad 6
noStroke();
fill(200);
quad(150,0,200,0,200,40,150,25);
// Quad 7
noStroke();
fill(100);
quad(0,30,40,30,20,50,0,45);
// Quad 8
noStroke();
fill(200);
quad(0,45,20,50,30,55,0,70);
// Quad 9
noStroke();
fill(140);
quad(20,50,45,25,70,30,30,55);
// Quad 10
noStroke();
fill(190);
quad(200,0,300,0,280,30,200,40);
// Quad 11
noStroke();
fill(170);
quad(300,0,330,0,320,20,280,30);
// Quad 12
noStroke();
fill(180);
quad(330,0,370,0,360,30,320,20);
// Quad 13
noStroke();
fill(160);
quad(370,0,400,0,400,35,360,30);


// Lines and points under quads (set A)
// Line 1
stroke(255);
strokeWeight(.5);
line(0,70,30,55);
// Point 1
stroke(255);
strokeWeight(5);
point(30,55);

// Line 2
stroke(255);
strokeWeight(1);
line(30,55,70,30);
// Point 2
stroke(255);
strokeWeight(6);
point(70,30);

// Line 3
stroke(255);
strokeWeight(2);
line(70,30,90,25);
// Point 3
stroke(255);
strokeWeight(8);
point(90,25);

// Line 4
stroke(255);
strokeWeight(3);
line(90,25,150,25);
// Point 4
stroke(255);
strokeWeight(10);
point(150,25);

// Line 5
stroke(255);
strokeWeight(4);
line(150,25,200,40);
// Point 5
stroke(255);
strokeWeight(12);
point(200,40);

// Line 6
stroke(255);
strokeWeight(5);
line(200,40,280,30);
// Point 6
stroke(255);
strokeWeight(13);
point(280,30);

// Line7
stroke(255);
strokeWeight(6);
line(280,30,320,20);
// Point 7
stroke(255);
strokeWeight(11);
point(320,20);

// Line8
stroke(255);
strokeWeight(4);
line(320,20,360,30);
// Point8
stroke(255);
strokeWeight(10);
point(360,30);

// Line9
stroke(255);
strokeWeight(2);
line(360,30,400,35);


// Lines and points under quads (set B)
// Line 1
stroke(255);
strokeWeight(.5);
line(0,70,30,65);
// Point 1
stroke(255);
strokeWeight(5);
point(30,65);

// Line 2
stroke(255);
strokeWeight(1);
line(30,65,70,50);
// Point 2
stroke(255);
strokeWeight(6);
point(70,50);

// Line 3
stroke(255);
strokeWeight(2);
line(70,50,90,45);
// Point 3
stroke(255);
strokeWeight(8);
point(90,45);

// Line 4
stroke(255);
strokeWeight(3);
line(90,45,150,55);
// Point 4
stroke(255);
strokeWeight(10);
point(150,55);

// Line 5
stroke(255);
strokeWeight(4);
line(150,55,200,70);
// Point 5
stroke(255);
strokeWeight(12);
point(200,70);

// Line 6
stroke(255);
strokeWeight(5);
line(200,70,280,60);
// Point 6
stroke(255);
strokeWeight(13);
point(280,60);

// Line7
stroke(255);
strokeWeight(6);
line(280,60,320,60);
// Point 7
stroke(255);
strokeWeight(11);
point(320,60);

// Line8
stroke(255);
strokeWeight(4);
line(320,60,360,70);
// Point8
stroke(255);
strokeWeight(10);
point(360,70);

// Line9
stroke(255);
strokeWeight(2);
line(360,70,400,85);


// Intials Y
// Y - first leg
stroke(90);
strokeWeight(14);
fill(255);
ellipseMode(CENTER);
ellipse(50,400,400,400);

// Y - second leg
noFill();
stroke(90);
strokeWeight(14);
strokeCap(SQUARE);
curveTightness(2);
curve(0,0,150,80,200,280,400,400);

// random white circle
stroke(255);
strokeWeight(1);
fill(255);
ellipseMode(CENTER);
ellipse(300,300,100,100);

// H - first leg
noFill();
stroke(90);
strokeWeight(14);
strokeCap(SQUARE);
curveTightness(2);
curve(0,0,250,200,300,300,400,400);

// H - second leg
noFill();
stroke(90);
strokeWeight(14);
strokeCap(PROJECT);
curveTightness(2);
curve(0,0,350,200,380,300,0,0);

// H - middle leg
stroke(90);
strokeWeight(14);
strokeCap(SQUARE);
line(270,250,335,250);

// saveFrame("w1.png");

