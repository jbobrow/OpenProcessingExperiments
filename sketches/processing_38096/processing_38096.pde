
//art piece by Grant Wiggins
//pulled from http://www.wiggz.com/ domain
//proejct: reproduce art

size(509, 509);

background(255, 255, 255);
smooth();

//bottom blue arch
fill(48, 94, 174);
stroke(48, 94, 174);
beginShape();
  vertex(509, 360);
  vertex(509, 417);//right corner
  vertex(317, 449);
  vertex(138, 465);
  vertex(0, 471);
  vertex(0, 360); //out of sight
endShape(CLOSE);

//orange arch
fill(233 , 74, 42);
stroke(233 , 74, 42);
beginShape();
  vertex(509, 305); //right corner
  vertex(509, 367);
  vertex(308, 384); //starting the bottom of the arch
  vertex(122, 381);
  vertex(0, 365); //left corner
  vertex(0, 189); //out of sight
endShape(CLOSE);

//middle blue arch
fill(48, 94, 174);
stroke(48, 94, 174);
beginShape();
  vertex(509, 354); //bottom right conrer
  vertex(418, 358);
  vertex(287, 354);
  vertex(147, 338);
  vertex(0, 301);
  vertex(0, 262); //top left corner
  vertex(113, 301);
  vertex(242, 326);
  vertex(369, 338);
  vertex(509, 341);
endShape(CLOSE);

//grey arch
fill(175 , 201, 206);
stroke(175 , 201, 206);
ellipse(512, 114, 1144, 416);

//topright corner
fill(255, 255, 255);
stroke(255, 255, 255);
beginShape();
  vertex(509, 0);//right corner
  vertex(509, 300);
  vertex(188, 209);
  vertex(20, 0);
endShape(CLOSE);

//Arc 0
stroke(79, 166, 102);
fill(79, 166, 102);
beginShape();
//top half
  vertex(0, 0);
  vertex(50, 0);
  vertex(114, 93);
  vertex(194, 170);
  vertex(272, 218);
  vertex(368, 257);
  vertex(468, 281);
  vertex(509, 286);
//side 
  vertex(509, 299);
//bottom to close  
  vertex(432, 290);
  vertex(342, 270);
  vertex(249, 238);
  vertex(176, 203);
  vertex(100, 145);
  vertex(33, 82);
  vertex(0, 43);
endShape(CLOSE);
noFill();


//Arc1
noFill();
stroke(48, 94, 174);
strokeWeight(5);
beginShape();
  curveVertex(0, 48); //top
  curveVertex(0, 48);
  curveVertex(188, 211);
  curveVertex(358, 273);
  //curveVertex();
  curveVertex(509, 302);
  curveVertex(509, 302); //303
endShape();

