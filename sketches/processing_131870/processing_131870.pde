

/* @pjs preload= "Zoom.png"; */

size(530, 510);
background(180,148,180);


fill(82,63,82);
noStroke();
rect(50, 50, 400, 350,4);

fill(153);
ellipse(250, 225, 250, 280);

fill(209);
strokeWeight(1);
ellipse(215, 218, 43, 89);

fill(255);
noStroke();
ellipse(285, 218, 43, 89);

line(60,50,60,400);
line(440,50,440,400);




quad(60,50,100,25,100,330,60,398);

fill(90,37,48);
quad(60,70,100,50,100,70,60,90);

  


noStroke();
fill(10,0,10);
triangle(477,50,100,25,100,330);


fill(204, 102, 30);
noStroke();
triangle(540,350,400,530,530,510);

PImage img;
  img = loadImage("Zoom.png");
  
  image(img, 60,90, 40,20);
  

  image(img, 60,110, 40,20);
  
  image(img, 60,130, 40,20);
  
  image(img, 60,150, 40,20);
  
  image(img, 60,170, 40,20);
  
  image(img, 60,190, 40,20);

  image(img, 60,220, 40,5);
  
  image(img, 60,230, 40,5);
 
  



