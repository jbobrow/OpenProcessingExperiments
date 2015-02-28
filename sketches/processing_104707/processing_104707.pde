
size(800,800);
background(242,238,212);

noStroke();
//lightblue
fill(205,232,226);
rect(0,0,205,100);
rect(0,300,100,300);
//red
fill(250,4,4);
rect(100,100,410,410);
rect(760,605,40,200);
//yellow
fill(253,203,65);
rect(510,0,255,295);
rect(0,600,100,200);
//black
fill(0);
rect(105,510,190,190);
rect(300,700,210,60);
//blue
fill(34,24,179);
rect(510,600,250,160);



strokeCap(SQUARE);

//HORIZONTAL GROUP 1

//First Horizontal line
stroke(0);
strokeWeight(15);
line(20,100,760,100);

//VERTICAL GROUP 1

//Vertical line, Top from Left
stroke(0);
strokeWeight(15);
line(200,20,200,100);

//Verical line, Second from Left, Straight down
stroke(0);
strokeWeight(15);
line(510,20,510,760);

//Verical line, Third from Left, Straight down
stroke(0);
strokeWeight(15);
line(765,20,765,790);

//HORIZONTAL GROUP 2


//Horizontal Line, Second Row, First from left
stroke(0);
strokeWeight(15);
line(20,300,105,300);

//Horizontal Line, Second Row, Second from left
stroke(0);
strokeWeight(15);
line(510,300,760,300);

//VERTICAL GROUP 2


//Vertical line, Second Row, Top from Left
stroke(0);
strokeWeight(15);
line(100,100,100,760);

//Vertical line, Second Row, Second from Left
stroke(0);
strokeWeight(15);
line(637,300,637,510);

//HORIZONTAL GROUP 3

//Horizontal Line, Third Row
stroke(0);
strokeWeight(15);
line(100,510,760,510);

//VERTICAL GROUP 3


stroke(0);
strokeWeight(15);
line(300,510,300,790);

//HORIZONTAL GROUP 4

//Horizontal Line, Fourth Row
stroke(0);
strokeWeight(15);
line(20,605,800,605);

//Horizontal Line, Fifth Row
stroke(0);
strokeWeight(15);
line(100,700,510,700);

//Horizontal Line, Sixth Row
stroke(0);
strokeWeight(15);
line(293,760,772,760);
