

size(400, 400);
background(255);

noFill();

rect(0, 0, 399, 399);

strokeWeight(2);

//main
ellipse(200, 200, 200, 200);

//bigSatelites
ellipse(100, 100, 50, 50);
ellipse(300, 100, 50, 50);
ellipse(100, 300, 50, 50);
ellipse(300, 300, 50, 50);

//corners
ellipse(0, 0, 200, 200);
ellipse(400, 0, 200, 200);
ellipse(0, 400, 200, 200);
ellipse(400, 400, 200, 200);

strokeWeight(1);

//top edge
ellipse(25, 0, 50, 50);
ellipse(50, 0, 50, 50);
ellipse(75, 0, 50, 50);
ellipse(100, 0, 50, 50);
ellipse(125, 0, 50, 50);
ellipse(150, 0, 50, 50);
ellipse(175, 0, 50, 50);
ellipse(200, 0, 50, 50);
ellipse(225, 0, 50, 50);
ellipse(250, 0, 50, 50);
ellipse(275, 0, 50, 50);
ellipse(300, 0, 50, 50);
ellipse(325, 0, 50, 50);
ellipse(350, 0, 50, 50);
ellipse(375, 0, 50, 50);

//bottom edge
ellipse(25, 400, 50, 50);
ellipse(50, 400, 50, 50);
ellipse(75, 400, 50, 50);
ellipse(100, 400, 50, 50);
ellipse(125, 400, 50, 50);
ellipse(150, 400, 50, 50);
ellipse(175, 400, 50, 50);
ellipse(200, 400, 50, 50);
ellipse(225, 400, 50, 50);
ellipse(250, 400, 50, 50);
ellipse(275, 400, 50, 50);
ellipse(300, 400, 50, 50);
ellipse(325, 400, 50, 50);
ellipse(350, 400, 50, 50);
ellipse(375, 400, 50, 50);

//left edge
ellipse(0, 25, 50, 50);
ellipse(0, 50, 50, 50);
ellipse(0, 75, 50, 50);
ellipse(0, 100, 50, 50);
ellipse(0, 125, 50, 50);
ellipse(0, 150, 50, 50);
ellipse(0, 175, 50, 50);
ellipse(0, 200, 50, 50);
ellipse(0, 225, 50, 50);
ellipse(0, 250, 50, 50);
ellipse(0, 275, 50, 50);
ellipse(0, 300, 50, 50);
ellipse(0, 325, 50, 50);
ellipse(0, 350, 50, 50);
ellipse(0, 375, 50, 50);

//right edge
ellipse(400, 25, 50, 50);
ellipse(400, 50, 50, 50);
ellipse(400, 75, 50, 50);
ellipse(400, 100, 50, 50);
ellipse(400, 125, 50, 50);
ellipse(400, 150, 50, 50);
ellipse(400, 175, 50, 50);
ellipse(400, 200, 50, 50);
ellipse(400, 225, 50, 50);
ellipse(400, 250, 50, 50);
ellipse(400, 275, 50, 50);
ellipse(400, 300, 50, 50);
ellipse(400, 325, 50, 50);
ellipse(400, 350, 50, 50);
ellipse(400, 375, 50, 50);

//filledCorners
noStroke();
fill(0);
ellipse(0, 0, 50, 50);
ellipse(400, 0, 50, 50);
ellipse(0, 400, 50, 50);
ellipse(400, 400, 50, 50);


//mainIn
stroke(0);
noFill();

ellipse(200, 200, 100, 200);
ellipse(200, 200, 200, 100);

ellipse(200, 200, 50, 300);
ellipse(200, 200, 300, 50);

//smallSatelites
ellipseMode(CORNER);
ellipse(50, 140, 25, 25);
ellipse(320, 140, 25, 25);
ellipse(50, 240, 25, 25);
ellipse(320, 240, 25, 25);
ellipse(140, 50, 25, 25);
ellipse(240, 50, 25, 25);
ellipse(140, 320, 25, 25);
ellipse(240, 320, 25, 25);


ellipseMode(CENTER);
noStroke();
fill(0);

ellipse(200, 200, 25, 25);
