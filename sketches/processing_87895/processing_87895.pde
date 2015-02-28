
//applying size and background
size(200,200);
background(255);
//applying body

rectMode(CENTER);
stroke(0);
fill(0);
rect(100,100,20,100);
fill(36,39,111);
rect(100,80,20,100);

//head size
fill(255);
ellipse(100,70,70,60);

//eyes
noFill();
ellipse(80,70,30,30);
fill(0);
ellipse(80,70,20,20);
noFill();
ellipse(120,70,30,30);
fill(0);
ellipse(120,70,20,20);


//mouth
fill(150,0,0);
ellipse(100,90,20,15);


//Legs
stroke(0);
fill(255);
//left
line(90,150,80,160);
//right
line(110,150,120,160);

//arms

stroke(0);
fill(255);
//left
line(90,100,50,120);
//right
line(110,100,150,120);
