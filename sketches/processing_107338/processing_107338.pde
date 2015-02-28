
/* @pjs preload="road-side-view.jpg"; */

size(1000,714);

PImage img = loadImage("road-side-view.jpg");
image(img, 0,0);

//exhaust pipe
fill(153);
rect(20,600,50,15);

//car body
line(70,635,70,500);
line(70,635,170,635);
line(270,635,650,635);
line(750,635,900,635);
line(900,635,900,550);
line(900,550,700,450);
line(700,450,600,300);
line(600,300,200,300);
line(200,300,200,500);
line(200,500,70,500);

// rear wheel
ellipseMode(CORNER);
fill(0,0,255);
ellipse(171,585,100,100);

//front wheel
ellipse(650,585,100,100);

// rear window
fill(0,255,255,128);
stroke(255,255,255);
rect(220,310,170,170);

//front window
rect(400,310,190,170);


