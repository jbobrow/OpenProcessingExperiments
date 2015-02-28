
//Homework #2, Section A
//Copyright Miranda Jacoby 2014 All Rights Reserved
//Contact: majacoby@andrew.cmu.edu

size(400, 400);
background(153, 234, 232);

//Setting variables referncing bounding circle 
float x = 0;
float y = 0;
float wd = 200;
float ht = 200;



//Nathan's Face (Sorry Jim!)
noStroke();
fill(237, 204, 172);

//hair
fill(70, 14, 4);
ellipse(  x + wd,  y + ht *.65,  wd,  .45 * ht);
ellipse(  x + wd,  y + ht *.85,  wd,  .45 * ht);
ellipse(  x + wd,  y + ht *.95,  wd,  .45 * ht);

//ears
fill(237, 204, 172);
ellipse(  x + wd *.55,  y + ht,  .15 * wd,  .15 * ht);
ellipse(  x + ht *1.45,  y + ht,  .15 * wd,  .15 * ht);

//beard
fill(70, 14, 4);
ellipse(  x + wd,  y + ht *1.15,  wd,  ht);

//face base
fill(237, 204, 172);
rectMode(CENTER);
rect(  x + wd,  y + ht,  .80 * wd,  .80 * ht,  .30 * wd);

//tuft of hair (on top of face)
fill(70, 14, 4);
ellipse(  x + wd,  y + ht *.75,  .75 * wd,  .35 * ht);

//eyes
fill(0);
ellipse(  x + wd *.80,  y + ht,  .07 * wd,  .20 * ht); 
ellipse(  x + wd *1.20,  y + ht,  .07 * wd,  .20 * ht);

//nose (Initial "J" from my last name, Jacoby)
stroke(234, 140, 141);
strokeWeight(5);
noFill();

beginShape();
curveVertex(  x + wd,  y + ht *.25);
curveVertex(  x + wd,  y + ht *.95);
curveVertex(  x + wd *.95,  y + ht *1.17);
curveVertex(  x + wd *.25,  y + ht);
endShape();

//mouth
stroke(0);
strokeWeight(3);
curve(   x + wd *.90,  y + ht,  x + wd *.90,  y + ht *1.25,  x + wd *1.10,  y + ht *1.25,  x + wd *1.10, y + ht);

//bounding circle (Includes initial "J" and most of Nathan's face)
//ellipse(  x + wd,  y + ht,  wd,  ht);


