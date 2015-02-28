
/*@pjs preload="1002.png";*/
PImage img;

size(400, 400);
background(7, 202, 140);
img = loadImage("1002.png");

color c1 = color(0, 140, 220);
fill(c1);
stroke(0);
strokeWeight(1);
line(300, 0, 400, 100);

stroke(0);
strokeWeight(1);
line(200, 0, 400, 200);

stroke(0);
strokeWeight(1);
line(100, 0, 400, 300);

stroke(0);
strokeWeight(1);
line(0, 0, 400, 400);

stroke(0);
strokeWeight(1);
line(-100, 0, 400, 500);

stroke(0);
strokeWeight(1);
line(-200, 0, 400, 600);

stroke(0);
strokeWeight(1);
line(-300, 0, 400, 700);



  
 stroke(0);
 strokeWeight(3);
ellipse(200, 234, 270, 100);

 
 stroke(0);
 strokeWeight(3);
ellipse(200, 200, 380, 50);


 stroke(0);
 strokeWeight(3);
ellipse(200, 80, 300, 80);


 stroke(0);
 strokeWeight(3);
ellipse(200, 300, 250, 50);

 stroke(0);
 strokeWeight(3);
ellipse(200, 64, 250, 100);

 stroke(0);
 strokeWeight(3);
ellipse(200, 434, 250, 100);

 stroke(0);
 strokeWeight(3);
ellipse(200, 134, 250, 100);
 
 noStroke();
ellipse(200, 234, 250, 100);
 
 stroke(0);
 strokeWeight(3);
ellipse(200, 64, 250, 100);
 
 noStroke();
ellipse(200, 104, 250, 100);
 
 
 tint(0, 0, 100, 100);
image(img, 0, 0, 490, 490);

 


