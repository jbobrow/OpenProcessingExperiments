
//BIKE KEFELI  
//N00131580
//Kandinsky Time


size(580, 400);
background(235,206,167);

noStroke();
fill (250,220,130);
beginShape(); //Big YellowTriangle
  vertex(191,9);
  vertex(256,357);
  vertex(471,182);
endShape(CLOSE);

stroke(0);
strokeWeight(1.5);
line(168,74,218,9);

beginShape(); //yellow grided quadrilateral
stroke(0);
strokeWeight(1);
fill (255,252,248);
  vertex(105,30);
  vertex(128,3);
  vertex(188, 28);
  vertex(130,91);
endShape(CLOSE);
line(111,22,143,78);
line(118,15,154,65);
line(121,12,165,53);
line(125,8,178,39);
line(109,39,137,6);
line(113,47,147,11);
line(117,58,155,15);
line(122,68,165,18);
line(125,77,178,24);

beginShape(); //brown quadrilateral
noStroke();
fill (123,92,28);
  vertex(17,206);
  vertex(148,143);
  vertex(252, 165);
  vertex(75,384);
endShape(CLOSE);

beginShape(); //inside brown quadrilateral
noStroke();
fill (255,254,204);
  vertex(72,182);
  vertex(185,183);
  vertex(129,315);
  vertex(38,266);
endShape(CLOSE);


strokeWeight(4);
noFill();
stroke(238,72,26);
bezier(40,111,25,85,124, 120, 140, 168);

noStroke();//orange circle top right
fill (255,133,47);
ellipse (473,20,30,30); 

noStroke();//blue circle
fill (68,69,119);
ellipse (99,119,70,65); 

fill(46,117,41);
ellipse(107, 139, 6, 6);//green circle
fill(255,87,31);
ellipse(122, 118,4,4); //red circle
fill(208,140,108);
ellipse(107,177,1,1); //pink circle
fill(234,200,0);
ellipse(91,115,4,4); //yellow circle
fill(131,134,163);
ellipse(109, 106, 2.5,2.5); //purpler circle
fill(231,208,106);
ellipse(104,94,2,2); //beige circle
fill(160,186,166);
ellipse(75,108,2,2); //beige circle

noFill(); //inside blue circle
stroke(255, 102, 0);
curve(78, 91, 76, 93, 128, 142, 143, 130);


noStroke();//Nested circles inside yellow triangle
fill (227,215,199);
ellipse (243,118,45,45); 
fill (0);
ellipse (243,118,29.5,29.5);
fill (255,252,248);
ellipse (243,118,20,20);
fill (0);
ellipse (243,118,11,11);

beginShape(); //blue quadrilateral bottom
fill (124,130,145);
vertex(242,284);
vertex(261,270);
vertex(286,293);
vertex(250,335);
endShape();

beginShape(); //green quadrilateraladjacent to blue
fill (59,105,51);
vertex(217,302);
vertex(242,284);
vertex(250,335);
vertex(235,353);
endShape();

noStroke();
fill (227,91,28); //Orange Triangle
beginShape();
  vertex(280,32);
  vertex(275,72);
  vertex(321,67);
endShape();

noFill();
stroke(0);
strokeWeight(2);
line(143,152,335,50);

noStroke();//Brown Ellipse
fill (227,215,199);
ellipse (260,219,45,31); 

fill (221,44,22); //Orange Triangle
beginShape();
  vertex(251,199);
  vertex(250,241);
  vertex(285,210);
endShape();

 //Big circle on the right
fill (60,44,45);
ellipse (461,174,216,216); 
    noStroke();
    fill (235,206,167);
    ellipse (547,263,252,252); //semi circle in background color
    
    stroke(0);
    noFill();
    strokeWeight(2);
    ellipse (461,174,216,216); 
    
strokeWeight(7);
smooth();
noFill();
stroke(238,72,26);
    bezier(419,265,415,196,479,123,561,135);
//    
     //shape inside Big circle
beginShape();
fill (235,206,167);
stroke(0);
strokeWeight(2);
  vertex(371,259);
  vertex(358,230);
  vertex(391,216);
  vertex(392,203);
  vertex(375,199);
  vertex(380,155);
  vertex(509,228);
  vertex(501,230);
  vertex(503,235);
  vertex(499,237);
  vertex(371,259);
  
endShape();

beginShape();
fill (235,206,167);
stroke(0);
strokeWeight(2);
  vertex(468,130);
  vertex(448,88);
  curveVertex(448,88);
  curveVertex(458,51);
  curveVertex(540,110);
  curveVertex(580,240);
  vertex(510,132);
  vertex(501,121);
  vertex(495,124);
  vertex(492,114);
  vertex(484,123);
  vertex(476,110);
endShape();

fill (227,91,28);
ellipse (453, 106,18,18); 
    noStroke();
    fill (235,206,167);
    ellipse (453, 106,8,8);
    fill (227,91,28);
ellipse (453, 106,18,18); 
    stroke(235,206,167);
    strokeWeight(1);
    fill (60, 44, 45);
ellipse (386,137,26,26);
fill (129, 163, 57);
ellipse (386,137, 8, 8); 

strokeWeight(3);
    smooth();
    noFill();
    stroke(219, 43, 20);
    bezier(423, 157, 430, 137, 431,135, 450, 127);
    
    strokeWeight(3);
    smooth();
    noFill();
    stroke(68,69,119);
    bezier(409,147,412,128,416,121,438,112);

noFill();
stroke(0);
strokeWeight(4); //major lines
line(48,385,500,2);
strokeWeight(3);
line(45,66,339,9);
strokeWeight(2);
line(56,166,151,82);
strokeWeight(4);
line(460,3,488,59);
    
stroke(0);
strokeWeight(1.5);
line(361,316,187,107);
fill(0);
triangle(185,105,209,82,178,96);
triangle(213,79,193,56,175,85);

  strokeWeight(4);
  stroke(0);
    smooth();
    noFill();
    bezier(301,360,179,291,143, 177,175,85);

 //Small orange circle bottom right
   noStroke();
    fill (227,91,28);
    ellipse (523,347,18,22); 
    
    
 //Beziers from orange triangle
   strokeWeight(1);
  stroke(0);
  noFill();
strokeWeight(2);
beginShape();
  vertex(340,20);
  bezierVertex(300,25,280,40,290,50);
  endShape();
  
  
  PFont font;
  font = loadFont("CharcoalCY-24.vlw"); 
  textFont(font); 
  String a = "Sleep...";
   text(a,300, 300, 200, 200);
   stroke(0);
   
strokeWeight(1);
beginShape();
  vertex(355,30);
  bezierVertex(308,25,288,40,298,50);
  endShape();
  
strokeWeight(1);
beginShape();
  vertex(355,40);
  bezierVertex(315,25,290,40,305,55);
  endShape();
  strokeWeight(3);
noFill();
stroke(0);
    bezier(260, 187, 255, 133, 319, 73, 383, 76);
    

 
    

