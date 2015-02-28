
size(380,290);
background(51,108,196);
smooth();

stroke(0);
fill(0,0,0,220);
triangle(80,140,25,45,140,45);
triangle(80,140,45,280,110,280);

stroke(255,255,255,190);
strokeWeight(13);
fill(1,9,62,220);
ellipse(80,140,50,50);

fill(170,190,227,10);
stroke(0);
strokeWeight(7);
ellipse(80,140,120,120);

noStroke();
fill(255,183,0);
rect(17,7,50,9);

fill(183,49,0);
beginShape();
vertex(280,70);
bezierVertex(330,90,370,60,360,10);
bezierVertex(360,60,330,80,280,65);
endShape();

fill(250,180,0);
beginShape();
vertex(280,55);
bezierVertex(330,60,340,25,340,20);
bezierVertex(340,15,340,50,280,50);
endShape();

fill(255,100,3);
triangle(230,190,300,270,370,190); //hell unten groß
fill(206,10,0);
triangle(200,185,290,185,290,5); //dunkler oben groß

fill(255,24,3);
quad(215,45,237,62,253,38,230,22);

triangle(290,185,305,175,290,175); //winziges dreieck unten rot
fill(255,175,0);
triangle(290,175,312,160,290,160); //winziges dreieck oben gelb

fill(255,255,255);
rect(290,147,72,8);           //schmales weißes rechteck

fill(0);
triangle(320,163,335,190,350,163);   //schwarzes dreieck ganz rechts

triangle(290,105,290,140,350,140);
fill(175,44,0);
triangle(290,105,350,140,350,105);

fill(0);
triangle(140,180,190,180,165,135);
triangle(165,180,145,225,185,225);
triangle(165,225,150,272,180,272);

fill(0,0,0,200);
beginShape();
vertex(235,290);
bezierVertex(265,235,330,230,360,290);
bezierVertex(330,250,265,255,235,290);
endShape();






