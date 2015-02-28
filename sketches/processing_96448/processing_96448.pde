
size(400, 400);
rectMode(CORNERS);
ellipseMode(RADIUS);

background(255, 255, 255);

//CAMERA BODY

noStroke();
fill(10, 10, 10);
rect(50, 100, 350, 300);

stroke(30, 30, 30);
strokeWeight(10);

fill(10, 10, 10);
rect(50, 105, 125, 295);


//APPENDAGES

noStroke();
rect(85, 93, 120, 105);

fill(127, 127, 127);
rect(57, 97, 75, 104);

fill(10, 10, 10);
triangle(170, 100, 190, 70, 190, 100);
triangle(290, 100, 270, 70, 270, 100);
rect(190, 70, 270, 100);

//LENS COMPONENTS

stroke(50, 50, 50);
fill(30, 30, 30);
ellipse(230, 190, 95 , 95);

strokeWeight(4);
ellipse(230, 190, 85, 85);


//GREEN LENS

noStroke();
fill(102, 174, 91, 50);
ellipse(230, 190, 55, 55);

//GRAY LENS

fill(30, 30, 30, 120);
ellipse(230, 190, 25, 25);

strokeWeight(20);
stroke(179, 157, 192, 50);
fill(30, 30, 30);

ellipse(230, 190, 7, 7);

noStroke();
fill(40, 40, 40);
ellipse(230, 190, 1, 1);

fill(30, 30, 30);


