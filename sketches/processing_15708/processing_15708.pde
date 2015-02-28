
float easing = 0.05;
float eyex;
float eyey;

void setup(){
  size(640,480);
  smooth();
}

void draw(){
  background(255);
  fill(0);
  
  //////////////////////////////////////
  //Eagle coordinates
  //////////////////////////////////////
  
  //Body
  movingline(168,119,182,102,515,402,515,402);
  movingline(182,102,196,88,515,402,516,389);
  movingline(196,88,211,77,516,389,521,378);
  movingline(211,77,212,21,521,378,526,370);
  movingline(212,21,237,56,526,370,539,359);
  movingline(237,56,247,74,539,359,553,351);
  movingline(247,74,246,89,553,351,562,349);
  movingline(246,89,235,104,562,349,565,340);
  movingline(235,104,218,123,565,340,573,340);
  movingline(218,123,211,142,573,340,582,346);
  movingline(211,142,216,155,582,346,586,354);
  movingline(216,155,219,146,586,354,602,354);
  movingline(219,146,239,166,602,354,615,359);
  movingline(239,166,249,176,615,359,620,370);
  movingline(249,176,252,189,620,370,613,382);
  movingline(252,189,247,185,620,370,613,382);
  movingline(247,185,236,183,613,382,602,382);
  movingline(236,183,211,180,613,382,602,382);
  movingline(211,180,195,187,602,382,585,393);
  movingline(195,187,185,194,602,382,585,393);
  movingline(185,194,187,211,585,393,580,402);
  movingline(187,211,193,222,585,393,580,402);
  movingline(193,222,208,220,580,402,590,408);
  movingline(208,220,217,232,580,402,590,408);
  movingline(217,232,204,228,590,408,584,411);
  movingline(204,228,187,233,584,411,572,402);
  movingline(187,233,189,227,572,402,559,407);
  movingline(189,227,169,211,559,407,550,414);
  movingline(169,211,180,232,550,414,542,418);
  movingline(180,232,203,240,542,418,559,419);
  movingline(203,240,192,242,559,419,554,426);
  movingline(192,242,178,239,554,426,546,426);
  movingline(178,239,167,248,546,426,529,424);
  movingline(167,248,169,231,529,424,529,414);
  movingline(169,231,144,205,529,414,516,409);
  movingline(144,205,139,194,516,409,504,414);
  movingline(139,194,134,179,504,414,516,409);
  
  //Back Wing
  movingline(144,205,118,208,516,409,504,414);
  movingline(118,208,93,206,504,414,459,414);
  movingline(93,206,114,181,459,414,436,419);
  movingline(114,181,135,164,436,419,422,436);
  movingline(135,164,123,161,422,436,422,448);
  movingline(123,161,99,123,422,448,428,463);
  movingline(99,123,93,99,428,463,423,463);
  movingline(93,99,80,82,423,463,414,452);
  movingline(80,82,53,59,414,452,414,436);
  movingline(53,59,24,31,414,436,421,424);
  movingline(24,31,41,21,421,424,431,414);
  movingline(41,21,67,27,431,414,445,408);
  movingline(67,27,104,45,445,408,458,407);
  movingline(104,45,115,55,458,407,473,408);
  movingline(115,55,143,77,473,408,491,408);
  movingline(143,77,159,96,491,408,503,408);
  movingline(159,96,168,119,503,408,515,402);
  movingline(168,119,197,151,515,402,516,389);
  
  ////////////////////////////////////////////////
  //FINISHED EYES
  float eyeX = map(mouseX,0,width, 229,593);
  float eyeY = map(mouseX,0,width, 167,360);
  float eyedx = eyeX-eyex;
  if(abs(eyedx) > 1){
    eyex += eyedx * easing;
  }
  float eyedy = eyeY-eyey;
  if(abs(eyedy) > 1){
    eyey += eyedy * easing;
  }
  ellipse(eyex,eyey,7,7);
  /////////////////////////////////////////////////
  
  //Cloud to bush
  pushMatrix();
  translate(0,-150);
  scale(1.4);
  movingline(48,396,65,429,62,357,52,341);
  movingline(65,429,100,432,83,396,62,357);
  movingline(100,432,125,413,101,420,83,396);
  movingline(125,413,152,437,150,414,139,420);
  movingline(152,437,188,440,159,401,150,414);
  movingline(188,440,202,431,171,385,159,401);
  movingline(202,431,208,418,147,401,171,385);
  movingline(208,418,205,399,151,387,147,401);
  movingline(205,399,236,396,189,356,151,387);
  movingline(236,396,254,378,153,362,189,356);
  movingline(254,378,238,351,125,393,153,362);
  movingline(238,351,198,342,127,373,125,393);
  movingline(198,342,188,314,141,343,127,373);
  movingline(188,314,170,309,147,321,141,343);
  movingline(170,309,148,329,130,337,147,321);
  movingline(148,329,119,328,117,367,130,337);
  movingline(119,328,110,315,103,339,117,367);
  movingline(110,315,90,301,76,321,103,339);
  movingline(90,301,62,301,84,333,76,321);
  movingline(62,301,35,331,96,354,84,333);
  movingline(35,331,38,358,99,388,96,354);
  movingline(38,358,52,381,81,355,99,388);
  movingline(52,381,48,396,52,341,81,355);
  popMatrix();
  
  //Cloud to Ground
  movingline(478,276,508,314,0,420,36,420);
  movingline(508,314,563,314,36,420,72,420);
  movingline(563,314,572,258,72,420,108,420);
  movingline(572,258,605,255,108,420,144,420);
  movingline(605,255,635,207,144,420,180,420);
  movingline(635,207,580,165,180,420,216,420);
  movingline(580,165,580,128,216,420,252,420);
  movingline(580,128,533,99,252,420,288,420);
  movingline(533,99,487,144,288,420,324,420);
  movingline(487,144,455,119,324,420,360,420);
  movingline(455,119,406,92,360,420,396,420);
  movingline(406,92,360,137,396,420,425,420);
  movingline(360,137,372,188,435,420,468,420);
  movingline(372,188,320,216,468,420,504,420);
  movingline(320,216,332,266,504,420,528,420);
  movingline(332,266,392,308,558,420,576,420);
  movingline(392,308,445,281,576,420,612,420);
  movingline(445,281,478,276,612,420,648,420);
}

void movingline(float X11, float Y11, float X12, float Y12, float X21, float Y21, float X22, float Y22){
  float lineX1 = map(mouseX,0,width, X11,X21);
  float lineX2 = map(mouseX,0,width, X12,X22);
  float lineY1 = map(mouseX,0,width, Y11,Y21);
  float lineY2 = map(mouseX,0,width, Y12,Y22);
//  float x1 = 0;
//  float x2 = 0;
//  float y1 = 0;
//  float y2 = 0;
//  float dx1 = lineX1-x1;
//  if(abs(dx1) > 1){
//    x1 += dx1 * easing;
//  }
//  float dy1 = lineY1-y1;
//  if(abs(dy1) > 1){
//    y1 += dy1 * easing;
//  }
//  float dx2 = lineX2-x2;
//  if(abs(dx2) > 1){
//    x2 += dx2 * easing;
//  }
//  float dy2 = lineY2-y2;
//  if(abs(dy2) > 1){
//    y2 += dy2 * easing;
//  }
//  line(x1,y1,x2,y2);
    line(lineX1,lineY1,lineX2,lineY2);
}

