
/* @pjs preload="qwop.jpg"; */

size(1200,500);

PImage img = loadImage("qwop.jpg");
image(img,0,0);

fill(185,106,67);
//stroke(185,106,67);

ellipse(100,350,50,50); //head
rect(125,345,175,10); //torso
line(300,350,350,225);//leg
line(350,225,325,205); //foot
line(300,350,350,400); //thigh
line(350,400,300,450); //calf
line(300,450,325,470); //foot
//arms
line(140,345,175,320);
line(175,320,158,280);
line(140,350,175,375);
line(175,375,210,335);


rect(20,20,50,50,10);
rect(90,20,50,50,10);
rect(1060,20,50,50,10);
rect(1130,20,50,50,10);
//rect(1100,20,50,50,10);

fill(0,0,0);
textSize(48);
text("Q", 26, 64); 
text("W", 92, 64); 
text("O", 1067,64); 
text("P", 1142, 64); 


