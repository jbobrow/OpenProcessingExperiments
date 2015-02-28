
// Declare variables
int circleX;
int circleY;

PImage bgImage;

void setup() {
  size(640,480);  
  smooth();
  // bring background image
  bgImage = loadImage("bluesky.jpeg");
  // set background image
  background(bgImage);
}


void draw() {

  // the stems of the tree
  strokeWeight(1);
  stroke(255);
  line(width/2,height*.75,width/2,height);
  line(width/2,height*.75,230,290);
  line(230,290,150,160);
  line(270,321,216,330);
  line(299, 342,290,200);
  line(218,270,150,255);
  line(193,230,205,200);
  line(295,294,270,270);
  line(293,260,325,230);
  line(291,230,207,118);
  line(266,198,277,70);
  line(245,167,198,154);
  line(321,380,425,322);
  line(413,329,459,133);
  line(376,349,442,350);
  line(353,363,334,275);
  line(344,323,382,217);
  line(435,235,374,121);
  line(362,274,406,245);
  line(420,303,478,243);
  line(449,167,437,94);
  line(418,200,425,162);
  line(448,196,505,156);
  line(376,236,322,89);
  line(354,178,296,141);
  line(340,134,361,67);
  line(451,271,504,263);
  line(467,255,459,212);
  line(472,182,501,183);
  line(364,201,378,167);
  line(392,150,396,80);
  line(394,122,413,106);
  line(189,265,165,234);
  line(243,300,242,216);
  line(243,240,226,210);
  line(244,264,265,233);
  line(349,340,321,318);
  line(395,339,388,288);
  line(392,318,372,304);
  line(424,283,406,266);
  line(368,214,327,186);
  line(176,202,132,182);
  line(270,155,253,131);
  line(426,322,477,306);
  line(443,317,463,286);
  line(275,109,305,82);
  line(218,132,229,90);
  line(160,176,155,111);
  line(159,151,176,119);
  line(157,131,140,108);
  line(457,145,510,90);
  line(487,114,483,74);
  line(471,131,516,127);
  
  // drawing circle
  fill(0,0,0,20);
  noFill();
  stroke(255);
  ellipse(circleX, circleY, 20,20);

  // print the location on canvas
  println(mouseX);
  println(mouseY);
}


void mousePressed() {
//called every time user clicks the mouse
circleX = (int)random(137,500);
circleY = (int)random(70,380);
}


void keyPressed() {
  save("image.jpeg");  
}






