
int bred=249, bgreen=62, bblue=120;
int red, green, blue;
int x, y; 
int xBox, yBox, h, w; 
boolean isCovered; 
int m = millis();

void setup() {
  size(900, 300);
  smooth(6);
  isCovered = false;
}

void draw() {
  background(bred, bgreen, bblue);
    noStroke();
  fill(244,232,58);
  for(int y=20; y <= 289; y+= 20){
    for(int x=20; x <= 889;x+=20){
      ellipse(x,y,4,4);
    }
  }

fill(255,255,255);
ellipse(mouseX+20,mouseY+25,43,36);
triangle(mouseX+20-19,mouseY+25-24,mouseX+20-8,mouseY+25-16,mouseX+20-18,mouseY+25-10);
triangle(mouseX+20+17,mouseY+25-24,mouseX+20+18,mouseY+25-10,mouseX+20+7,mouseY+25-16);
fill(0);
ellipse(mouseX+20-11,mouseY+25-1,5,5);
ellipse(mouseX+20+11,mouseY+25-1,5,5);
fill(249,62,120);
triangle(mouseX+20-3,mouseY+25+1,mouseX+20+3,mouseY+25+1,mouseX+20,mouseY+25+4);
stroke(2);
line(mouseX+20,mouseY+25+2,mouseX+20,mouseY+25+4);
line(mouseX+20-3,mouseY+25+6,mouseX+20,mouseY+25+4);
line(mouseX+20+3,mouseY+25+6,mouseX+20,mouseY+25+4);

  fill(red, green, blue);
  noStroke();
  rect(84, 234, 28, 69);
    fill(bred, bgreen, bblue);
    rect(86, 240, 9, 3);
    rect(86, 245, 9, 3);
    rect(86, 250, 9, 3);
    rect(86, 255, 9, 3);
    rect(86, 260, 9, 3);
    rect(86, 265, 9, 3);
    fill(red, green, blue);
  rect(116, 223, 25, 80);
  triangle(129, 211, 121, 223, 136, 223);
  rect(128, 201, 2, 22);
  rect(154, 230, 28, 73);
  rect(236, 67, 1, 26);
  rect(234, 93, 5, 27);
  ellipse(236, 130, 34, 30);
  rect(228, 139, 17, 101);
  ellipse(236, 252, 45, 36);
  quad(221, 265, 229, 268, 212, 304, 203, 304);
  quad(231, 265, 239, 266, 234, 304, 226, 304);
  quad(239, 263, 249, 263, 272, 304, 262, 304);
    fill(bred, bgreen, bblue);
    rect(217, 128, 37, 3);
    rect(212, 249, 47, 3);
    fill(red, green, blue);  
  rect(289,196,2,18);
  triangle(290,209,320,228,261,228);
  triangle(262,215,283,220,264,231);
  triangle(298,218,319,215,317,229);
  rect(261,227,59,76);
    fill(bred, bgreen, bblue);
    rect(268, 234, 18, 3);
    rect(268, 239, 18, 3);
    rect(268, 244, 18, 3);
    rect(268, 249, 18, 3);
    rect(268, 254, 18, 3);
    rect(268, 259, 18, 3);
    fill(red, green, blue);  
  rect(350,182,2,12);
  rect(359,189,2,7);
  rect(345,194,22,109);
  rect(339,267,10,50);
  rect(336,261,41,80);
  triangle(345,252,345,267,339,267);
  triangle(339,288,339,305,334,305);
  triangle(336,236,377,261,336,261);
  triangle(377,288,381,304,377,304);
    fill(bred, bgreen, bblue);
    rect(338, 198, 45, 2);
    rect(338, 202, 45, 2);
    fill(red, green, blue); 
  rect(414,240,77,65);
  rect(456,178,25,125);
  ellipse(434,240,25,26);
    fill(bred, bgreen, bblue);
    rect(462, 185, 4, 4);
    rect(467, 185, 4, 4);
    rect(472, 185, 4, 4);
    rect(462, 190, 4, 4);
    rect(467, 190, 4, 4);
    rect(472, 190, 4, 4);
    rect(462, 195, 4, 4);
    rect(467, 195, 4, 4);
    rect(472, 195, 4, 4);
    rect(462, 200, 4, 4);
    rect(467, 200, 4, 4);
    rect(472, 200, 4, 4);
    rect(462, 205, 4, 4);
    rect(467, 205, 4, 4);
    rect(472, 205, 4, 4);
    fill(red, green, blue);   
  rect(500,178,31,125);
  rect(528,139,26,165);
    fill(bred, bgreen, bblue);
    rect(504, 185, 19, 2);
    rect(504, 190, 19, 2);
    rect(504, 195, 19, 2);
    rect(504, 200, 19, 2);
    rect(504, 205, 19, 2);
    rect(504, 210, 19, 2);
    rect(504, 215, 19, 2);
    rect(504, 220, 19, 2);
    rect(504, 225, 19, 2);
    rect(504, 230, 19, 2);
    rect(504, 235, 19, 2);
    rect(504, 240, 19, 2);
    rect(504, 245, 19, 2);
    rect(504, 250, 19, 2);
    rect(504, 255, 19, 2);
    quad(533,144,549,144,549,156,535,156);
    fill(red, green, blue);  
  rect(572,196,31,109);
  rect(599,156,24,150);
  rect(610,209,76,96);
    fill(bred, bgreen, bblue);
    rect(605, 161, 3, 26);
    rect(610, 161, 3, 26);
    rect(615, 161, 3, 26);
    rect(605, 190, 3, 26);
    rect(610, 190, 3, 26);
    rect(615, 190, 3, 26);
    rect(666, 215, 3, 85);
    rect(671, 215, 3, 85);
    rect(676, 215, 3, 85);
    fill(red, green, blue);  
  rect(705,195,48,109);
    fill(bred, bgreen, bblue);
    rect(710, 200, 37, 2);
    rect(710, 207, 37, 2);
    rect(710, 214, 37, 2);
    rect(710, 221, 37, 2);
    rect(710, 228, 37, 2);
    fill(red, green, blue);  
  rect(766,227,41,76);
  rect(800,257,47,46);
    fill(bred, bgreen, bblue);
    rect(786, 231, 3, 3);
    rect(792, 231, 3, 3);
    rect(798, 231, 3, 3);
    rect(786, 237, 3, 3);
    rect(792, 237, 3, 3);
    rect(798, 237, 3, 3);
    rect(786, 244, 3, 3);
    rect(792, 244, 3, 3);
    rect(798, 244, 3, 3);
    println(boxOver(mouseX, mouseY, 0, 200, 900, 100));
  
  if (boxOver(mouseX, mouseY, 0, 200, 900, 100) == false) { 
    red=0;
    green=0;
    blue=0;
  }
  else {  

    red=244;
    green=232;
    blue=58;
  }
}
  boolean boxOver(int xPos, int yPos, int xBox, int yBox, int h, int w) {
  if (mouseY>200) {
    isCovered = true;
  }
  else {
    isCovered = false;
  }
  return isCovered;
}
