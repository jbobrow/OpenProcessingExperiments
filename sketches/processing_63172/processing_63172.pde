
size (600, 600);
smooth();
background(255);
noStroke();
fill(160, 170, 160);


//left eye
fill(0);
ellipse(130, 195,  52, 52);

stroke(0);
noFill();
ellipse(130, 195, 109, 109);

//right eye
fill(0);
ellipse(426, 195,  52, 52);

stroke(0);
noFill();
ellipse(426, 195, 109, 109);

//between eyes
stroke(0);
strokeWeight(8);
line(188, 195, 367, 195);
noStroke();

//nose
noStroke();
fill(0);
quad(254, 232,  304, 232,  359, 356,  214, 356);

noStroke();
fill(255);
ellipse(286, 354, 75, 75);

//mouth
noStroke();
fill(0);
rect(48, 407,  518, 34);
rect(48, 454,  518, 34);

//left eye brow
stroke(0);
strokeWeight(8);
line(55, 77, 197, 77);
noStroke();

stroke(0);
strokeWeight(8);
line(55, 91, 197, 91);
noStroke();

stroke(0);
strokeWeight(8);
line(55, 105, 197,105);
noStroke();

//right eye brow
stroke(0);
strokeWeight(8);
line(366, 77, 509, 77);
noStroke();

stroke(0);
strokeWeight(8);
line(366, 91, 509, 91);
noStroke();

stroke(0);
strokeWeight(8);
line(366, 105, 509, 105);
noStroke();

//warpaint left

stroke(0);
strokeWeight(1);
line(366, 105, 509, 105);
noStroke();





