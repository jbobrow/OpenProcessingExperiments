
// Mani Nilchiani
// N00208257
// Recreating the visual compistion of a piece by Kandinsky, with a bit of text on top.

//Setting up the document
size(580,400);
background(#e9d2b3);

//Start Painting
stroke(0);

//Yellow big triangle
fill(#fce393);
noStroke();
triangle(255,386,190,9,521,220);

//Brown Ellipse on big yellow triangle
ellipseMode(CORNER);
fill(#815727);
noStroke();
ellipse(234,192,51,55);

//Red Triangle on top of brown ellipse above
fill(#db2b14);
noStroke();
triangle(249,200,283,210,249,240);

//Upper right corner Orange ellipse
fill(#ee8d3c);
stroke(#f3eeeb);
strokeWeight(5);
ellipseMode(CENTER);
ellipse(472,21,30,30);

//Huge complex ellipse on right
strokeWeight(3);
stroke(#222126);
fill(#222126);
ellipse(464,172,213,213);

//Upper left hand ellipses on the giant ellipse
noStroke();
fill(#d9cab7);
ellipse(385,137,30,30);
fill(#27212b);
ellipse(385,137,27,27);
fill(#81ab3d);
ellipse(385,137,10,10);

//Upper center ellipses on the giant ellipse
strokeWeight(1);
stroke(#000000);
fill(#fe9c45);
ellipse(453,90,20,20);
fill(#ffffd2);
stroke(#e14111);
ellipse(453,90,16,16);

//Black and White circles
//outer
ellipseMode(CENTER);
strokeWeight(4);
stroke(0);
fill(#fffee9);
ellipse(242,119,30,30);
//inner
noStroke();
fill(0);
ellipse(242,119,12,12);

//Red triangle on top of big yellow triangle
fill(#e25125);
noStroke();
triangle(279,34,320,57,274,73);

// Green rect
fill(#3c6430);
noStroke();
beginShape();
  vertex(261,272);
  vertex(284,293);
  vertex(234,355);
  vertex(216,302); 
endShape(CLOSE);

//Brown rect
fill(#6a4d25);
noStroke();
beginShape();
  vertex(16,207);
  vertex(147,165);
  vertex(251,165);
  vertex(75,383); 
endShape(CLOSE);

//Black thick curve
strokeWeight(4);
stroke(#000000);
noFill();
beginShape();
  curveVertex(340,370);
  curveVertex(330,280);
  curveVertex(390,310);
  curveVertex(410,260);
  curveVertex(565,310);
endShape();

//Navy ellipse
noStroke();
fill(#3a3c65);
ellipse(98,120,70,65);

//Orange bent line on top of navy ellipse
strokeWeight(4);
stroke(#ec4b15);
noFill();
beginShape();
  vertex(40, 103);
  bezierVertex(60,55,140,160,140,160);
endShape();

//Light brown rect
fill(#e0cca7);
noStroke();
beginShape();
  vertex(73,188);
  vertex(183,183);
  vertex(127,315);
  vertex(37,266); 
endShape(CLOSE);

//Green ellipse on top of Light Brown rect
fill(#2d483f);
strokeWeight(2);
stroke(#e1754e);
fill(#2d483f);
ellipse(100,241,40,48);
strokeWeight(1);

//Lines
stroke(0);
strokeWeight(4);
line(50,387,496,3);
line(55,165,150,83);

strokeWeight(3);
line(45,66,338,9);
line(185,105,350,306);

strokeWeight(2);
line(143,152,333,52);
line(165,74,215,10);

strokeWeight(1);
line(332,234,329,324);
line(336,234,334,324);

//Here goes the text stuff
PFont helvetica;
helvetica = loadFont("Helvetica-Bold-48.vlw");
textFont(helvetica,80);
//text("Morning", 100,100);



fill(#fce393);
text("4:40",345,200);
fill(#e9d2b3);
text("am", 450,250);

