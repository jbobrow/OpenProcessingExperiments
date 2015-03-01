
/*@pjs preload="a.png";*/

size(400, 400);
background(255);  

PImage img;
size(400, 400);  
img = loadImage("a.png"); 
image(img, 0, 0, 400, 400);      


stroke(0);
strokeWeight(3);
line(0, 350, 400, 350);
line(350, 0, 350, 400);
line(0, 100, 300, 400);
line(0, 100, 400, 100);
line(100, 0, 100, 400);

ellipse(350, 100, 50, 50); 
  






