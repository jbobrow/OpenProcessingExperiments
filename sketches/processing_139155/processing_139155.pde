
size(600,600);
background(255);

//body
fill(240);
noStroke();
smooth();
beginShape();
vertex(120, 230);
bezierVertex(130,300,170,480, 250, 400); 
bezierVertex(300, 350, 330, 250, 320, 200);
endShape();

//body shade
fill(230);
noStroke();
smooth();
beginShape();
vertex(120, 230);
bezierVertex(130,300,170,430,200,418); 
bezierVertex(180,400,185,370,170,223); 
endShape();

fill(230);
noStroke();
smooth();
beginShape();
vertex(285, 206);
bezierVertex(290,320,250,380,225,416);
bezierVertex(300, 400, 330, 250, 320, 200);
endShape();

// neck
pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-8)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(200,220,270);
noStroke();
smooth();
ellipse(219,200, 203,70);
popMatrix();

pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-8)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(200,150);
noStroke();
smooth();
ellipse(219,200, 203,70);
popMatrix();

pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-8)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(200,200);
noStroke();
smooth();
ellipse(250,200, 139,60);
popMatrix();



//right arm

fill(240);
noStroke();
smooth();
beginShape();
vertex(320, 195);
bezierVertex(250,220,350,330,380,320);
bezierVertex(410,290,350,230,345,220);
endShape();

//right arm shade

fill(220);
noStroke();
smooth();
beginShape();
vertex(320, 195);
bezierVertex(250,220,300,330,380,320);
bezierVertex(350,300,300,270,320,210);
endShape();

//floor shade

fill(235);
noStroke();
smooth();
ellipse(210,500, 240,80);

fill(225);
noStroke();
smooth();
ellipse(210,500, 200,60);


fill(215);
noStroke();
smooth();
ellipse(210,500, 180,50);

fill(205);
noStroke();
smooth();
ellipse(210,500, 160,30);

//face

pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-15)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(240);
noStroke();
smooth();
ellipse(220,140, 190,160);
popMatrix();

//face shade

fill(230);
noStroke();
smooth();
beginShape();
vertex(220, 63);
bezierVertex(270,100,300,150,250,215);
bezierVertex(292,210,340,110,265,75);
endShape();

//expression

pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-5)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(30);
noStroke();
smooth();
ellipse(210,165, 140,90);
popMatrix();


//left arms

fill(240);
noStroke();
smooth();
beginShape();
vertex(185, 210);
bezierVertex(140,220,50,330,150,320);
bezierVertex(180, 310, 200, 250, 190, 215);
endShape();


// left arm shade

fill(220);
noStroke();
smooth();
beginShape();
vertex(185, 210);
bezierVertex(140,220,50,330,150,320);
bezierVertex(120,300,150,250,185,210);
endShape();

//eyes

fill(90, 190, 240);
noStroke();
smooth();
beginShape();
vertex(150, 175);
bezierVertex(160,160,170,165,190,185);
endShape();

fill(90, 190, 240);
noStroke();
smooth();
beginShape();
vertex(210, 185);
bezierVertex(230,160,240,165,250,175);
endShape();

smooth();
strokeWeight(2);
stroke(100, 250, 290, 100);
line(150,170, 180, 170);
line(150,175, 185, 175);
line(150,180, 190, 180);

line(215,170, 255, 170);
line(210,175, 250, 175);
line(205,180, 245, 180);

//highlight

pushMatrix();
  translate(192,150);  // move origin to center of object
  rotate(radians(-15)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(250);
noStroke();
smooth();
ellipse(200,80, 15,10);
popMatrix();

pushMatrix();
  translate(230,110);  // move origin to center of object
  rotate(radians(-60)); // rotate about the origin
  translate(-200,-140); // move back
  // draw the shape here....
fill(250);
noStroke();
smooth();
ellipse(150,90,15,5);
popMatrix();

















