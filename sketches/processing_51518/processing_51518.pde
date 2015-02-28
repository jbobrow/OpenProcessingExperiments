
/*Submitted by: Kriti Shrestha
 Assignment No. 2
 Date: 02/07/12
 
 Description: 
 Hot-air balloons in the evening sky. An empty road below.
 Meadows on either side of the road. Sun setting on the horizon. 
 Mouse clicks:
 When mouse is clicked on the upper part of the sky, two upper balloons appear. 
 When mouse is clicked closer to the horizon, two lower balloons appear.
 When mouse is clicked below the horizon, strips appear on the road.*/

float horizon; //co-ordinate of horizon

void setup () {
  size (500, 500);

  horizon = height/1.75;

  noFill();

  line (0, horizon, width, horizon);

  float steps = height/1.75; //upper rectangle or sky
  float x = 0.0;
  float y = 0.0;
  float w = width;
  float h = horizon/steps;
  color startC, endC;
  startC = color (0, 0, 150, 180); //blue
  endC = color (255, 100, 100, 180); //red

  float startR, startG, startB;
  float endR, endG, endB;
  float deltaR, deltaG, deltaB;
  startR = red(startC);
  startG = green(startC);
  startB = blue(startC);
  endR = red(endC);
  endG = green(endC);
  endB = blue(endC);

  deltaR = (endR-startR)/(steps-1);
  deltaG = (endG-startG)/(steps-1);
  deltaB = (endB-startB)/(steps-1);

  int i = 0;
  while (i<steps) {

    fill (startC);
    noStroke();

    rect (x, y, w, h);
    startR += deltaR;
    startG += deltaG;
    startB += deltaB;
    startC = color (startR, startG, startB);
    y += h;
    i++;
  } 
  noStroke();
  fill (255, 0, 0);
  arc (width/2, horizon, width/6, width/6, 3.165, 6.296);//sun
  noStroke();
  smooth ();

  fill (30);//road
  rect (0, horizon, width, height - horizon);
  fill (0, 150, 0, 200);
  triangle (0, horizon, width/3, horizon, 0, height);//grass
  triangle (width/1.5, horizon, width, horizon, width, height);//grass
}

void draw() {
}

void mousePressed() {

  if (mouseY > horizon) {
    drawStrip();
  }
  if (mouseY <  horizon/2) {
    drawBalloon1();//Two upper balloons
  }
  if (mouseY > horizon/2 && mouseY < horizon){
   drawBalloon2();//Two lower balloons
  }
}
void drawStrip() {
  fill (255);
  rectMode (CENTER);
  float strip = 1.65; //position of white strip
  float swidth = 8; //width of strip


  for (int number = 5; number > 0; number = number-1) {



    rect (width/2, height/strip, width/swidth, height/22);

    swidth = swidth - swidth/3;
    strip = strip - strip/10;
  }
}
void drawBalloon1() {
  smooth();

  fill (255, 150, 0);

  ellipse (width/4, horizon/4, width/6, width/6);//first balloon

  rectMode (CENTER); 
  fill (50, 20, 20);
  rect (width/4, (horizon/4)+width/7.5, width/15, width/18);//balloon seat

  fill (255, 100, 100);
  ellipse (width/1.25, horizon/2, width/10, width/10);

  rectMode (CENTER); 
  fill (50, 20, 20);
  rect (width/1.25, (horizon/2)+width/12, width/20, width/25);
}
void drawBalloon2(){
  fill (255, 20, 100);

  ellipse (width/2.15, horizon/1.5, width/15, width/15);

  rectMode (CENTER); 
  fill (50, 20, 20);
  rect (width/2.15, (horizon/1.5)+width/17, width/30, width/45);

  fill (120, 20, 255);

  ellipse (width/5, horizon/1.15, width/19, width/19);

  rectMode (CENTER); 
  fill (50, 20, 20);
  rect (width/5, (horizon/1.15)+width/22.5, width/35, width/50);
}


