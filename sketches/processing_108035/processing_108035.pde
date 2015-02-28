
size(800,800);
background(255);



//antennae
stroke(164, 199, 57);
strokeWeight(10);

fill(164, 199, 57);
line(400,200,400-100,200-125);
line(400,200,400+100,200-125);

//head
strokeWeight(0);
ellipseMode(CENTER);
ellipse(400,200,200,200);

//body
//rectMode(CENTER);
rect(300,200,200,200, 0, 0, 25, 25);

//arms
rect(300-75,200,200/4,200-45,25);
rect(300+225,200,200/4,200-45,25);

//legs
rectMode(CENTER);
rect(400+40,200+200,200/4,200-25,25);
rect(400-40,200+200,200/4,200-25,25);

//neck
strokeWeight(10);
stroke(255, 255, 255);
line(400-100,200,400+100,200);

//eyes
fill(255, 255, 255);
ellipse(400-35,200-50,10,10);
ellipse(400+35,200-50,10,10);
