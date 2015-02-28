
/*****************************************
 * Assignment 01
 * Name:         Michelle Neuburger
 * E-mail:       mneuburger@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    9/12/2012
 * 
 * Drawing of a webcomic character.
***********************************************/
  
  
//Set up window size, background, ellipse mode, smooth
  background(171,137,250);
  smooth();
  size(600,600);
  ellipseMode(CENTER);
  
//horns
  noStroke();
  fill(255,111,0);
  beginShape();
    vertex(247,237);
    vertex(277,242);
    vertex(262,262);
  endShape(CLOSE);
  beginShape();
    vertex(347,242);
    vertex(377,237);
    vertex(362,262);
  endShape(CLOSE);
  
//head
  fill(155);
  noStroke();
  ellipse(312,270,100,75);
  
//hat
  fill(3,0,255);
  arc(312,270,102,75,2.970,6.444);
  fill(255);
  stroke(255);
  noFill();
  ellipse(290,250,6,6);
  ellipse(331,250,6,6);
  bezier(310,260,305,269,329,269,327,260);
  bezier(292,260,287,269,311,269,309,260);
  
//shirt
  noStroke();
  fill(0);
  beginShape();
    vertex(275,300);
    vertex(350,300);
    vertex(361,375);
    vertex(263,375);
  endShape(CLOSE);
  
//shoes
  noStroke();
  fill(3,0,255);
  ellipse(290,407,40,20);
  ellipse(331,407,40,20);
   
//legs
  stroke(70);
  fill(100);
  beginShape();
    vertex(350,405);
    vertex(270,405);
    vertex(263,375);
    vertex(361,375);
  endShape(CLOSE);
  line(310,405,310,375);
  
//jacket
  stroke(0);
  fill(84,118,5);
  beginShape();
    vertex(279,295);
    vertex(260,310);
    vertex(245,405);
    vertex(270,405);
  endShape(CLOSE);
  beginShape();
    vertex(346,295);
    vertex(365,310);
    vertex(376,405);
    vertex(350,405);
  endShape(CLOSE);
  
//shirt symbol
  noFill();
  ellipseMode(CORNER);
  strokeWeight(5);
  stroke(84,118,5);
  bezier(298,353,311,260,327,386,341,352);
  ellipse(280, 340, 20,20);
  
//eyes
  ellipseMode(CENTER);
  noStroke();
  fill(242,192,24);
  ellipse(290,280,15,10);
  ellipse(331,280,15,10);
  fill(0);
  ellipse(290,280,6,6);
  ellipse(331,280,6,6);
  
//hair
  beginShape();
    vertex(262,272);
    vertex(262,302);
    vertex(275,295);
  endShape(CLOSE);
  beginShape();
    vertex(362,272);
    vertex(362,302);
    vertex(350,295);
  endShape(CLOSE);
  
//mouth
  stroke(0);
  noFill();
  strokeWeight(1);
  bezier(310,290,305,299,329,299,327,290);
  bezier(292,290,287,299,311,299,309,290);
