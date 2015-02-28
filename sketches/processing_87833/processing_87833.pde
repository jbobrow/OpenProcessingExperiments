

void setup(){
  
size(640,480);
background(222,210,184);
smooth();

}


void draw(){
  
  noStroke();                          //bg rectangle
  fill(208,207,187);
  quad(0,82,640,84,640,426,0,430);
  
  noStroke();                          //1st tan stroke
  fill(142,134,112);
  quad(0,80,130,0,134,0,0,88);
  
  noStroke();                          //2nd tan stroke
  fill(142,134,112);
  quad(0,254,247,0,251,0,0,275);
  
  noStroke();                          //3rd tan stroke
  fill(142,134,112);
  quad(170,480,359,0,363,0,201,480);
  
  noStroke();                          //4th tan stroke
  fill(142,134,112);
  quad(603,480,468,0,475,0,634,480);
  
  noStroke();                          //5th tan stroke
  fill(142,134,112);
  quad(640,100,548,0,554,0,640,89);
  
  stroke(1);                           //grey stroke
  fill(188,174,148);
  line(96,0,253,99);
  
  strokeWeight(1);                           //grey stroke
  stroke(188,174,148);
  line(253,99,365,30);
  
  strokeWeight(1);                           //grey stroke
  stroke(188,174,148);
  line(199,63,310,0);
  
  strokeWeight(1);                           //grey stroke
  stroke(188,174,148);
  line(155,36,232,0);
  
  strokeWeight(1);                           //grey stroke
  stroke(188,174,148);
  line(315,0,384,41);
  
  strokeWeight(1);                           //grey stroke
  stroke(188,174,148);
  line(0,124,308,141);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(308,141,639,137);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(0,297,224,314);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(224,314,640,318);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(0,366,381,389);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(381,389,640,389);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(640,194,414,195);
  
  strokeWeight(1);                           //grey stroke
  fill(188,174,148);
  line(414,195,57,170);
  
  strokeWeight(1);                       //vertical grey stroke
  fill(188,174,148);
  line(119,132,115,307);
  
  strokeWeight(1);                       //vertical grey stroke
  fill(188,174,148);
  line(325,141,317,315);
  
  strokeWeight(1);                       //vertical grey stroke
  fill(188,174,148);
  line(554,139,546,316);
  
  strokeWeight(1);                       //grey stroke
  fill(188,174,148);
  line(640,121,588,24);
  
  strokeWeight(1);                       //grey stroke
  fill(188,174,148);
  line(588,24,439,22);
  
  strokeWeight(1);                       //grey stroke
  fill(188,174,148);
  line(439,22,406,139);

  strokeWeight(3);                       //black stroke
  fill(188,174,148);
  line(0,41,86,72);

  strokeWeight(3);                       //black stroke
  fill(188,174,148);
  line(86,72,0,133);
  
  strokeWeight(6);                       //thick navy stroke
  fill(36,59,91);
  line(279,0,640,93);
  
  noStroke();                            //L yellow ellipse
  fill(248,190,68);
  ellipse(456,271,324,113);
  
  noStroke();                            //M yellow ellipse
  fill(248,190,68);
  ellipse(456,118,190,48);
  
  noStroke();                            //S yellow ellipse
  fill(248,190,68);
  ellipse(456,30,92,18);
  
  noStroke();                            //S blue ellipse
  fill(49,73,145);
  ellipse(406,40,26,26);
  
  strokeWeight(3);                       //orange stroke
  stroke(208,128,69);
  line(0,152,362,168);
  
  strokeWeight(3);                       //black stroke
  stroke(0);
  line(459,0,535,344);
  
  
}



