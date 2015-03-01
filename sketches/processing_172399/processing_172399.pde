
/* @pjs preload="super.jpg"; */

PImage img=loadImage("super.jpg");
background(0);
size(450,450);
stroke(255);
strokeWeight(20);
smooth();
beginShape();
vertex(20,60);
vertex(300,100);
vertex(250,150);
vertex(350,200);
vertex(150,300);
vertex(220,320);
endShape();
blend(img,0,0,450,450,0,0,450,450,DARKEST);


