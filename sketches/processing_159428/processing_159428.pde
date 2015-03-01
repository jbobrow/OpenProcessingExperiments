
PFont font;

int count = 0;
int blink = 0;

float[] starsX = new float[100];
float[] starsY = new float[100];


void setup() {
  size(300, 300);
  //background(30);

  for (int i=0; i<100; i++) {
    starsX[i] = random(width);
    starsY[i] = random(height-40);
  }
}

void draw() {
  background(30);

  count++;
  if (count < 20) {
    blink = 0;
  } else if (count >= 20 && count < 40) {
    blink = 1;
  } else {
    count = 0;
  }

  /* - NO SPACE LIMIT...
   //A Section Grid Line
   
   stroke(130);
   line(120, 0, 120, 200);
   line(140, 0, 140, 200);
   line(160, 0, 160, 200); 
   line(180, 0, 180, 200);
   line(200, 0, 200, 200);
   line(220, 0, 220, 200);
   line(240, 0, 240, 200);
   line(260, 0, 260, 200);
   line(280, 0, 280, 200);
   
   
   //B Section Grid Line
   stroke(130);
   line(120, 200, 300, 200);
   line(80, 220, 300, 220);
   line(40, 240, 300, 240);
   line(0, 260, 300, 260);
   //line(0, 280, 300, 280);
   
   //C Section Grid Line
   stroke(130);
   line(40, 0, 40, 240);
   line(80, 0, 80, 220);
  /* back up for horizon stripes
   line(120, 200, 0, 260);
   line(120, 180, 0, 240);
   line(120, 160, 0, 220);
   line(120, 140, 0, 200);
   line(120, 120, 0, 180);
   line(120, 100, 0, 160);
   line(120, 80, 0, 140);
   line(120, 60, 0, 120);
   line(120, 40, 0, 100);
   line(120, 20, 0, 80);
   line(120, 0, 0, 60);
   line(120, -20, 0, 40);
   line(120, -40, 0, 20);
   line(120, -60, 0, 0);
   */

  //Line 2 Just Horizon Line..
  //Lower Line
  stroke(150);
  line(0, 240, 300, 240);
  line(0, 220, 300, 220);
  line(0, 205, 300, 205);
  line(0, 195, 300, 195);
  line(0, 190, 300, 190);
  line(0, 188, 300, 188);
  line(0, 187, 300, 187);
  //Upper Line
  line(0, 20, 300, 20);
  line(0, 40, 300, 40);
  line(0, 55, 300, 55);
  line(0, 65, 300, 65);
  line(0, 70, 300, 70);
  line(0, 72, 300, 72);
  line(0, 73, 300, 73);
  //Background
  fill(0);
  noStroke();
  rect(0, 73, 300, 114);

  //blinking stars
  stroke(blink*255);
  for (int i=0; i<100; i++) {
    point(starsX[i], starsY[i]);
  }

  noStroke();

  //Ellipse Backgroup
  ellipseMode(CENTER);
  //stroke(0);
  //strokeWeight(3);
  fill(255, 200);
  ellipse(125, 150, 80, 80);
  ellipse(200, 180, 90, 90);
  ellipse(80, 170, 40, 40);
  ellipse(160, 180, 60, 60);
  ellipse(70, 220, 30, 30);
  ellipse(240, 110, 40, 40);
  ellipse(30, 10, 5, 5);
  ellipse(20, 30, 7, 7);
  ellipse(255, 40, 10, 10);
  ellipse(150, 70, 15, 15);
  ellipse(110, 52, 13, 13);
  ellipse(100, 250, 9, 9);
  ellipse(150, 240, 6, 6);
  ellipse(280, 130, 9, 9);
  ellipse(15, 150, 5, 5);
  ellipse(40, 120, 3, 3);
  ellipse(270, 230, 3, 3);





  //Logo Drawing *Green Shape
  fill(0, 255, 0);
  noStroke();
  beginShape();
  vertex(221, 117);
  vertex(191, 190);
  vertex(161, 193);
  vertex(191, 120);
  endShape(CLOSE);

  //Logo Drawing *Blue Shape
  fill(0, 0, 225);
  noStroke();
  beginShape();
  vertex(135, 153);
  vertex(194, 215);
  vertex(164, 218);
  vertex(105, 156);
  endShape(CLOSE);

  //Logo Drawing *Red Shape
  fill(255, 0, 0);
  noStroke();
  beginShape();
  vertex(130, 130);
  vertex(90, 230);
  vertex(60, 233);
  vertex(100, 133);
  endShape(CLOSE);

  //Logo Drawing *MAIN LOGO
  fill(0);
  noStroke();
  beginShape();
  vertex(130, 130);
  vertex(90, 230);
  vertex(182, 215);
  vertex(170, 203);
  vertex(113, 213);
  vertex(135, 153);
  vertex(194, 215);
  vertex(238, 113);
  vertex(221, 117);
  vertex(191, 190);
  endShape(CLOSE);

  //Typo Canvas
  fill(40);
  rect(0, 260, 300, 40);

  //typography
  font = loadFont("Verdana-48.vlw");
  textFont(font, 10);
  textAlign(CENTER, CENTER);
  fill(255);
  text("HELLO WORLD! THIS IS AV.", 150, 280);
}


