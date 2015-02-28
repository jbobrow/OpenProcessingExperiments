
size(496,800);
background(255,252,219); //setting background to gray



smooth();
strokeWeight(3);
noFill();

//using the width function gets values from current size of canvas
//YELLOW CIRCLE BELOW!


//dot1//
stroke(255);
fill(10);
ellipseMode(RADIUS);
ellipse(50,-5,20,20);
//since our canvas is 500px wide, width/4 means 500/4
//the reason for using width is to keep things proportional to the canvas


//dot2//
stroke(255);
fill(10);
ellipseMode(RADIUS);
ellipse(480,30,23,20);



//dot3//
stroke(255);
fill(10);
ellipseMode(RADIUS);
ellipse(362,316,40,40);


//dot4//
stroke(255);
fill(10);
ellipseMode(RADIUS);
ellipse(64,260,15,15);

//dot5//
stroke(255);
fill(10);
ellipseMode(RADIUS);
ellipse(132,330,10,10);


//dot6//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(144,350,15,15);

//dot7//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(162,492,15,13);

//dot8//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(168,576,18,16);


//line??//
stroke(0);
line(4,height/3,width/3,height/5); 



//triangle//
beginShape();
vertex(200, 380);
vertex(380, 20);
vertex(400, 180);
endShape(CLOSE);



//drawingline//
strokeWeight(4);
line(60,100,600,10);


//dot8//own creating now...//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(100,150,70,70);


//curve//
noFill();
beginShape();
curveVertex(5000,100);
curveVertex(888,1111);
curveVertex(20,300);
curveVertex(80,400);
curveVertex(99,100);
curveVertex(600,10);
endShape();

//own created dot//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(500,500,160,70);



//own created dot//
stroke(0);
fill(0);
ellipseMode(RADIUS);
ellipse(1,260,20,20);


//own created dot//
stroke(0);
fill(10);
ellipseMode(RADIUS);
ellipse(166,686,200,30);


//own created dot//
stroke(0);
fill(219,27,39);
ellipseMode(RADIUS);
ellipse(166,686,200,30);


//own created dot//
stroke(0);
fill(152,17,26);
ellipseMode(RADIUS);
ellipse(600,620,200,30);

//own created dot//
stroke(0);
fill(0);
ellipseMode(RADIUS);
ellipse(150,650,20,20);

//own created dot//
stroke(0);
fill(0);
ellipseMode(RADIUS);
ellipse(135,610,10,10);


//own created dot//
stroke(0);
fill(0);
ellipseMode(RADIUS);
ellipse(120,550,5,5);




//triangular//
fill(0);
triangle(218, 475, 355, 400, 286, 675);


//star//
line(199,75,200,135);
line(172,130,235,75);
line(175,104,230,107);
line(177,87,230,135);

 











