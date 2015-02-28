
/*@pjs preload= "puppyhead.jpg"; */

size (500, 500);
    
background (74,255,247);
 
fill (10,30,50);
strokeWeight(10);
stroke (0, 0, 0);
rect (0, 50, 500, 400);

fill (255); 
rect (100, 250, 100, 275);
rect (275, 100, 275, 100);

fill (245,3,3) ; 
ellipse(250, 250, 275, 275);


PImage img;
img = loadImage("puppyhead.jpg");
image(img, 110, 400, 80, 70);



