
float x;
float y;

void setup () {
  size (400,400);
  smooth();
  frameRate (30);
  cursor(CROSS);
  x=192;
  y=49;
  

}

void draw() {
  background(255);
  fill(255);
  beginShape();
vertex(189.0, 96.0);
vertex(190.0, 89.0);
vertex(210.0, 89.0);
vertex(209.0, 99.0);
vertex(205.0, 93.0);
vertex(201.0, 97.0);
vertex(200.0, 98.0);
vertex(201.0, 100.0);
vertex(198.0, 93.0);
vertex(195.0, 98.0);
vertex(195.0, 99.0);
vertex(195.0, 97.0);
vertex(192.0, 94.0);
vertex(188.0, 97.0);
endShape();

  //tête
  fill(252,89,8);
  ellipse(192,49,90,90);
  fill (0,0,0);
  
  //oeil droit
  ellipse(x-19,y-11,20,20);
  //oeil gauche
  ellipse(x+21,y-11,20,20);
  ellipse(mouseX,mouseY,20,20);
  fill(0);
  
 //corne gauche
 beginShape();
vertex(161.0, 30.0);
vertex(134.0, 6.0);
vertex(171.0, 22.0);
vertex(160.0, 30.0);
endShape();

//corne droite
  beginShape();
vertex(228.0, 32.0);
vertex(217.0, 24.0);
vertex(255.0, 8.0);
vertex(228.0, 31.0);
endShape();

 
  //corps
  beginShape();
curveVertex(219.0, 63.0);
curveVertex(192.0, 47.0);
curveVertex(134.0, 266.0);
curveVertex(251.0, 270.0);
curveVertex(194.0, 47.0);
curveVertex(209.0, 63.0);
endShape();

//bras 
beginShape();
vertex(86.0, 152.0);
vertex(95.0, 146.0);
vertex(212.0, 152.0);
vertex(229.0, 150.0);
vertex(230.0, 144.0);
vertex(235.0, 146.0);
vertex(242.0, 124.0);
vertex(246.0, 123.0);
vertex(241.0, 147.0);
vertex(249.0, 147.0);
vertex(241.0, 160.0);
vertex(236.0, 164.0);
vertex(163.0, 167.0);
vertex(87.0, 154.0);
endShape();

//baton
fill(252,3,3);
beginShape();
curveVertex(100, 30);
curveVertex(100, 30);
curveVertex(100, 300);
curveVertex(100, 300);
curveVertex(100, 300);
curveVertex(100, 300);
curveVertex(100, 300);
endShape();

  //pied gauche
  beginShape();
curveVertex(169.0, 247.0);
curveVertex(176.0, 337.0);
curveVertex(128.0, 343.0);
curveVertex(129.0, 261.0);
curveVertex(166.0, 252.0);
curveVertex(175.0, 339.0);
curveVertex(186.0, 344.0);
endShape();

//pied droit
beginShape();
curveVertex(372.0, 320.0);
curveVertex(222.0, 240.0);
curveVertex(209.0, 341.0);
curveVertex(244.0, 342.0);
curveVertex(241.0, 245.0);
curveVertex(213.0, 243.0);
curveVertex(195.0, 252.0);
endShape();

//oreille droite

 fill(0);
 pushMatrix ();
translate (-1.22,-1.40);

beginShape();
vertex(238.0, 47.0);
vertex(315.0, 24.0);
vertex(235.0, 73.0);
vertex(238.0, 48.0);
endShape();

popMatrix ();

//oreille gauche
fill(0);
 pushMatrix ();
translate (+0.22,+9);
beginShape();
vertex(151.0, 42.0);
vertex(74.0, 28.0);
vertex(155.0, 67.0);
vertex(150.0, 41.0);
endShape();
popMatrix ();


//pied droit
beginShape();
vertex(216.0, 350.0);
vertex(216.0, 373.0);
vertex(313.0, 388.0);
vertex(265.0, 369.0);
vertex(240.0, 358.0);
vertex(243.0, 334.0);
vertex(241.0, 353.0);
endShape();


//pied gauche
beginShape();
vertex(126.0, 345.0);
vertex(125.0, 357.0);
vertex(41.0, 357.0);
vertex(146.0, 371.0);
vertex(169.0, 343.0);
endShape();


//bouche
fill(255);
beginShape();
curveVertex(182.0, -81.0);
curveVertex(200.0, 67.0);
curveVertex(186.0, 68.0);
curveVertex(202.0, 1.0);
endShape();
 
 fill(0);
//main gauche
beginShape();
vertex(132.0, 152.0);
vertex(70.0, 165.0);
vertex(102.0, 154.0);
vertex(105.0, 149.0);
vertex(67.0, 156.0);
vertex(103.0, 144.0);
vertex(66.0, 147.0);
vertex(103.0, 137.0);
vertex(71.0, 133.0);
vertex(112.0, 131.0);
vertex(134.0, 145.0);
endShape();

//queue
fill(252,3,3);
beginShape();
curveVertex(388.0, 234.0);
curveVertex(362.0, 266.0);
curveVertex(367.0, 345.0);
curveVertex(329.0, 312.0);
curveVertex(320.0, 280.0);
curveVertex(298.0, 319.0);
curveVertex(266.0, 229.0);
curveVertex(254.0, 239.0);
curveVertex(232.0, 234.0);
curveVertex(246.0, 233.0);
curveVertex(265.0, 217.0);
curveVertex(298.0, 299.0);
curveVertex(320.0, 260.0);
curveVertex(343.0, 315.0);
curveVertex(360.0, 331.0);
curveVertex(351.0, 269.0);
curveVertex(293.09448, 229.3396);
endShape();

//pointe de queue
fill(252,3,3);
beginShape();
vertex(343.0, 269.0);
vertex(366.0, 264.0);
vertex(341.0, 214.0);
vertex(342.0, 270.0);
endShape();

noFill();
//fourche courbe

beginShape();
curveVertex(153.0, 376.0);
curveVertex(78.0, 343.0);
curveVertex(78.0, 321.0);
curveVertex(116.0, 325.0);
curveVertex(110.0, 343.0);
curveVertex(114.0, 367.0);
endShape();

//
fill(252,3,3);
beginShape();
vertex(92.0, 338.0);
vertex(95.0, 353.0);
vertex(77.0, 345.0);
vertex(91.0, 338.0);
endShape();


beginShape();
vertex(102.0, 357.0);
vertex(104.0, 347.0);
vertex(106.0, 342.0);
vertex(118.0, 346.0);
vertex(102.0, 357.0);
endShape();



//oeil droit
  ellipse(x-19,y-11,8,8);
  //oeil gauche
  ellipse(x+21,y-11,8,8);
  ellipse(mouseX,mouseY,8,8);
  fill(255);
text(mouseX+" "+mouseY,mouseX+5,mouseY);
}






