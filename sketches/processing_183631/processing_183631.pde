
//PImage img;
void setup() {
  size(800, 540);
  //size(displayWidth, displayHeight);
  //img = loadImage("123.jpg");
}
void draw() {   
  float xmars=width/4, ymars=height/4;
  //image(img, 0, 0);
  background(0, 0, 51);
  //////////////////////////////////////////////////////////////////////
  pushMatrix(); 
  translate(0, 0);
  scale(2);
  strokeWeight(2); //mars - vneshniy kontur
  stroke(0);
  //fill(229, 229, 249);  //beliy
  fill(219, 59, 39);  //krasniy
  ellipse (xmars, ymars, 140, 140);  //  mars

  strokeWeight(1); //krater - vneshniy kontur
  stroke(26);
  line(xmars-52, ymars-30, xmars-45, ymars-41);  //  liniy  kratera marsa 1
  line(xmars-41, ymars-27, xmars-42, ymars-21);  
  line(xmars-31, ymars-29, xmars-29, ymars-23); 
  line(xmars-23, ymars-34, xmars-20, ymars-29); 
  line(xmars-11, ymars-49, xmars-6, ymars-48); 
  line(xmars-18, ymars-54, xmars-8, ymars-53);

  line(xmars+24, ymars-42, xmars+11, ymars-39);  //  liniy  kratera marsa 2
  line(xmars+12, ymars-34, xmars+6, ymars-32);
  line(xmars+11, ymars-26, xmars+5, ymars-22);
  line(xmars+13, ymars-18, xmars+8, ymars-14);
  line(xmars+18, ymars-13, xmars+14, ymars-6);
  line(xmars+24, ymars-8, xmars+23, ymars-3);
  line(xmars+34, ymars-5, xmars+34, ymars);
  line(xmars+43, ymars-9, xmars+44, ymars-3);
  line(xmars+46, ymars-18, xmars+48, ymars-14);
  line(xmars+45, ymars-28, xmars+49, ymars-22);


  line(xmars+17, ymars-67, xmars+19, ymars-63);  //  krivie liniy marsa
  line(xmars+19, ymars-63, xmars+7, ymars-57);
  line(xmars+7, ymars-57, xmars+7, ymars-48);
  line(xmars+7, ymars-44, xmars-3, ymars-38);
  line(xmars-7, ymars-32, xmars-12, ymars-26);
  ellipse (xmars-12, ymars-18, 4, 8);
  line(xmars-13, ymars-10, xmars-16, ymars-4);
  line(xmars-16, ymars-4, xmars-26, ymars+2);
  line(xmars-26, ymars+2, xmars-28, ymars+10);

  line(xmars-22, ymars+22, xmars-22, ymars+28);
  line(xmars-22, ymars+28, xmars-8, ymars+40);
  line(xmars-8, ymars+40, xmars-10, ymars+52);
  line(xmars-10, ymars+52, xmars-4, ymars+58);
  line(xmars-1, ymars+62, xmars+9, ymars+70);

  ellipse (xmars+9, ymars+56, 8, 4);
  arc (xmars+16, ymars+22, 8, 22, QUARTER_PI, HALF_PI+QUARTER_PI); 

  ///////////////////////////////////////////////
  stroke(0);
  pushMatrix();
  translate(xmars-30, ymars-43);  //  krater marsa 1
  rotate (-PI/6);
  ellipse (0, 0, 36, 16); 
  //fill(19, 29, 249);  //beliy
  noStroke();
  ellipse (0, -8, 18, 7); //  rasriv elipsa kratera marsa 1
  popMatrix();

  pushMatrix();
  translate(xmars+29, ymars-25);  //  krater marsa 2
  rotate (PI/3);
  stroke(0);
  ellipse (0, 0, 36, 25);  
  //fill(19, 29, 249);  
  noStroke();
  ellipse (-8, -10, 22, 12); //  rasriv elipsa kratera marsa 2
  popMatrix();

  stroke(0);   //  krater marsa 3
  arc (xmars-48, ymars+10, 19, 26, PI, PI+QUARTER_PI); // arka kratera marsa 3
  arc (xmars-48, ymars+10, 19, 27, PI+HALF_PI+QUARTER_PI, TWO_PI); // arka kratera marsa 3
  ellipse (xmars-48, ymars+10, 14, 21);  //  krater marsa 3
  //fill(19, 29, 249);  
  noStroke();
  ellipse (xmars-44, ymars+2, 8, 14); //  rasriv elipsa kratera marsa 3
  //popMatrix();

  pushMatrix();
  translate(xmars-2, ymars+9);  //  krater marsa 4
  rotate (-PI/5);
  stroke(0);
  arc (0, 0, 34, 22, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // arka kratera marsa 4
  ellipse (0, 0, 28, 16); 
  //fill(19, 29, 249);  
  noStroke();
  ellipse (8, -3, 18, 12); //  rasriv elipsa kratera marsa 4
  popMatrix(); 

  stroke(0);  //  krater marsa 5
  arc (xmars+58, ymars+6, 18, 22, PI, PI+QUARTER_PI); // arka kratera marsa 5
  ellipse (xmars+58, ymars+6, 9, 18);  //  krater marsa 5
  noStroke();
  //fill(19, 29, 249); 
  ellipse (xmars+61, ymars+4, 7, 12); //  rasriv elipsa kratera marsa 5

  pushMatrix();
  translate(xmars-25, ymars+45);  //  krater marsa 6
  rotate (PI/4);
  stroke(0);
  ellipse (0, 0, 22, 12); 
  //fill(19, 29, 249);  
  noStroke();
  ellipse (7, 0, 6, 18); //  rasriv elipsa kratera marsa 6
  popMatrix(); 

  pushMatrix();
  translate(xmars+40, ymars+35);  //  krater marsa 7
  rotate (-PI/4);
  stroke(0);
  ellipse (0, 0, 22, 10); 
  arc (0, 0, 16, 5, PI+QUARTER_PI, PI+HALF_PI+QUARTER_PI); // arka kratera marsa 7
  //fill(19, 29, 249);  
  noStroke();
  ellipse (9, -2, 10, 6); //  rasriv elipsa kratera marsa 7
  popMatrix(); 
  popMatrix();
}


