
//Levi Mousaw 9/24/12
//Tracing Project- Kazimir Malevici: Suprematism 1916

//setup loop + Background
//Declaring a variable of type PImage

PImage img;

void setup() {
  size(1020,1000);
  smooth();
  img = loadImage("Kazimir Malevick.jpg");
}

void draw(){
  background(255);
  //Draw the Image to the screen at coordinate (0,0)
  //image (img,0,0);
  println("x:" +mouseX+ "Y:" + mouseY);

  noStroke();
  background(217,213,189);
//light pink circle
  fill(252,225,228);
  ellipse(581,383,563,563);
//orange quad
  fill(219,106,35);
  quad(307,423,851,99,865,125,339,485);
//large brown rectangle
  fill(130,77,4);
  quad(310,0,599,0,937,718,701,824);

//black drop shape
  fill(0,0,0);
  beginShape();
  curveVertex(762,30); // the first control point
  curveVertex(744,63); // is also the start point of curve
  curveVertex(668,238);
  curveVertex(650,272);
  curveVertex(617,298);
  curveVertex(576,312);
  curveVertex(524,308);
  curveVertex(500,296);
  curveVertex(488,277);
  curveVertex(485,259);
  curveVertex(492,228);
  curveVertex(532,194);
  curveVertex(573,173);
  curveVertex(582,169);
  curveVertex(602,159);
  curveVertex(666,133);
  curveVertex(684,122);
  curveVertex(704,106);
  curveVertex(724,84);
  curveVertex(744,62);
  curveVertex(761,28);
  endShape();
  
//black rectangle
  fill(35,36,38);
  quad(334,310,383,287,496,538,449,559);
//navy rectangle
  fill(15,36,97);
  quad(338,150,375,133,594,597,557,615);
//small red square
  fill(194,39,8);
  quad(73,640,146,598,186,688,118,725);
//small purple rectangle
  fill(177,146,179);
  quad(130,528,181,502,251,666,200,694);
//tiny brown line
  fill(168,116,42);
  quad(186,465,202,456,291,673,274,682);
//tiny gray line
  fill(160,162,163);
  quad(239,33,248,33,249,188,238,188);
//small gray rectangles
  fill(186,185,182);
  quad(238,150,280,144,282,158,238,162);
  fill(186,185,182);
  quad(183,120,304,104,306,125,186,140);
  fill(83,85,87);
  quad(222,135,266,130,267,146,225,152);
//long thin line
  fill(204,150,73);
  quad(127,178,150,169,447,855,414,855);
//blue rectangle
  fill(146,185,247);
  quad(201,763,446,624,513,755,266,890);
//thin triangle
  fill(0,0,0);
  triangle(43,723,655,300,50,735);
//dark orange 
  fill(214,48,15);
  quad(634,450,895,114,935,160,653,468);
//tiny gray square
  fill(180,180,180);
  quad(259,266,276,262,279,279,263,282);
}

