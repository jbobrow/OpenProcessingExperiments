
//Pedro Veneziano, February 24th, Creative Computing B, Benjamin Bacon

/* @pjs preload= "face.jpg"; */

PImage face;

void setup() {
  size(700, 700);
  smooth();
  stroke(255, 245, 210);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();
  face = loadImage("face.jpg");
}

void draw() {
 
  image(face, 0, 0);
  
  float d = dist(mouseX, mouseY, width/2, height/2);

  float x1 = map(mouseX, 0, width, 0, 2);
  float y1 = map(mouseY, 0, width, 0, 2);
  float x2 = map(mouseY, 0, width, 0.5, 1.5);
  float y2 = map(mouseX, 0, width, 0.5, 1.5);
  float x3 = map(mouseX, 0, width, 1.8, 0.2);
  float y3 = map(mouseY, 0, width, 1.8, 0.2);
  float x4 = map(mouseX, 0, width, 1.3, 0.7);
  float y4 = map(mouseY, 0, width, 0.7, 1.3);
  float x5 = map(mouseY, 0, width, 0.8, 1.2);
  float y5 = map(mouseX, 0, width, 0.8, 1.2);

  strokeWeight(map(d, 0, 350, 10, 3));

  beginShape(); //K
  vertex(200*x1, 220*y2);
  vertex(200*x3, 320*y1);
  vertex(250*x2, 320*y2);
  vertex(200*x1, 270*y3);
  vertex(250*x2, 220*y1);
  endShape();

  beginShape(); //E1
  vertex(320*x1, 270*y4);
  vertex(280*x2, 270*y5);
  vertex(330*x3, 220*y2);
  vertex(280*x1, 220*y4);
  vertex(280*x4, 320*y3);
  vertex(330*x4, 320*y1);
  endShape();

  beginShape(); //E2
  vertex(400*x5, 270*y3);
  vertex(360*x3, 270*y5);
  vertex(410*x1, 220*y4);
  vertex(360*x1, 220*y1);
  vertex(360*x2, 320*y1);
  vertex(410*x4, 320*y2);
  endShape();

  beginShape(); //P
  vertex(440*x2, 320*y5);
  vertex(440*x3, 220*y5);
  vertex(490*x1, 220*y2);
  vertex(465*x4, 270*y1);
  vertex(440*x4, 270*y3);
  endShape();

  beginShape(); //C
  vertex(135*x4, 380*y5);
  vertex(110*x2, 380*y2);
  vertex(85*x1, 430*y3);
  vertex(110*x5, 480*y1);
  vertex(135*x5, 480*y1);
  endShape();
  
  beginShape(); //O
  vertex(165*x1, 380*y2);
  vertex(215*x5, 380*y3);
  vertex(215*x3, 480*y1);
  vertex(165*x3, 480*y5);
  vertex(165*x2, 380*y5);
  endShape();
  
  beginShape(); //N
  vertex(295*x2, 380*y3);
  vertex(295*x1, 480*y2);
  vertex(245*x2, 480*y2);
  vertex(245*x5, 380*y1);
  vertex(295*x3, 480*y5);
  endShape();
  
  beginShape(); //T
  vertex(325*x1, 380*y3);
  vertex(375*x3, 380*y2);
  vertex(350*x5, 480*y4);
  vertex(350*x1, 380*y4);
  endShape();
  
  beginShape(); //R
  vertex(405*x3, 480*y4);
  vertex(405*x1, 380*y2);
  vertex(455*x5, 380*y5);
  vertex(405*x3, 430*y1);
  vertex(455*x2, 480*y3);
  endShape();
  
  beginShape(); //O
  vertex(485*x3, 380*y3);
  vertex(535*x2, 380*y2);
  vertex(535*x2, 480*y2);
  vertex(485*x5, 480*y1);
  vertex(485*x1, 380*y5);
  endShape();
  
  beginShape(); //L
  vertex(565*x2, 380*y4);
  vertex(565*x3, 480*y2);
  vertex(615*x1, 480*y2);
  vertex(565*x5, 430*y1);
  endShape();
}



