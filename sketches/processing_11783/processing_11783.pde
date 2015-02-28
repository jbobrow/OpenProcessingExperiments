
//Sievers, Lab 1
//By: Caroline Sievers
//Sept. 1, 2010
//http://blogs.villagevoice.com/music/Images/morandi_20.jpg

size(400, 350);
background(240, 200, 80);


//bottom part of background

fill(170);
noStroke();
smooth();
rect(0, 220, 400, 150);

//bottom part of vase

fill(240, 200, 90);
noStroke();
rect(100, 185, 100, 100);

//top part of vase

fill(240, 190, 80);
smooth();
noStroke();
triangle(150, 70, 100, 185, 200, 185);
fill(240, 190, 80);
noStroke();
smooth();
rect(137, 67, 25, 32);
fill(240, 190, 80);
ellipse(149, 70, 25, 40);

//blue rectangle
fill(10, 210, 220);
stroke(0);
rect(190, 135, 75, 150);

//brown rectangle
fill(70, 50, 50);
noStroke();
rect(265, 240, 110, 48);

//ball
fill(10, 230, 200);
quad(190, 270, 210, 325, 170, 320, 165, 290);
fill(60, 40, 50);
quad(190, 270, 217, 275, 227, 300, 210, 325);


