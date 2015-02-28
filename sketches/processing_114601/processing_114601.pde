
/*@pjs preload="back3_1.png";*/
PImage img;

size(400,400); 
background(255,255,255);

noStroke();
fill(255,255,255);
rect(50,50,100,100); 

stroke(0);
strokeWeight(10);
noFill();
ellipse(300,300,200,200);

stroke(0);
strokeWeight(30);
noFill();
ellipse(300,300,250,250);

stroke(0);
strokeWeight(5);
noFill();
ellipse(300,300,360,360);

stroke(0);
strokeWeight(5);
noFill();
ellipse(300,300,400,400);

stroke(0);
strokeWeight(3);
noFill();
ellipse(300,300,420,420);

stroke(0);
strokeWeight(20);
noFill();
ellipse(300,300,570,570);

stroke(0);
strokeWeight(5);
noFill();
ellipse(300,300,600,600);

noStroke();
fill(255,255,255);
triangle(0,50,0,60,300,300);

noStroke();
fill(255,255,255);
triangle(0,80,0,100,300,300);

noStroke();
fill(255,255,255);
triangle(0,350,0,370,300,300);

noStroke();
fill(255,255,255);
triangle(95,50,50,60,300,300);

noStroke();
fill(255,255,255);
triangle(50,380,50,390,300,300);

noStroke();
fill(255,255,255);
triangle(50,395,50,400,300,300);

noStroke();
fill(255,255,255);
triangle(180,70,200,70,300,300);

noStroke();
fill(255,255,255);
triangle(205,70,210,70,300,300);

noStroke();
fill(255,255,255);
triangle(205,70,210,70,300,300);

img = loadImage("back3_1.png");
tint(255,70);
image(img, 0, 0);

stroke(0,255,255);
strokeWeight(10);
noFill();
ellipse(300,300,100,100);


