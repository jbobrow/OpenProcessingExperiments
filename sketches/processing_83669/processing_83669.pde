
float[] xPos = new float [0];
float[] yPos = new float [0];
float[] xVel = new float [0];
float[] yVel = new float [0];
float[] xPsize = new float [0];
 
//windows
float [] rectX = {
  150, 150, 150, 330, 310, 330, 310, 330, 370, 390, 222
};
float [] rectY = {
  290, 240, 190, 240, 240, 265, 265, 289, 165, 165, 205
};
float [] rectW = {
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10 ,30
};
float [] rectH = {
  10, 10, 10, 10, 10, 10, 10, 10, 20, 20, 30
};
 
 
void setup () {
  size (550, 500);
  noStroke();
  translate(width/2, height/2);
}
 
void draw () {
  background(255);
  noFill();
  noStroke();
  //ball
  stroke(255);
  strokeWeight(18);
  fill(#70AEB9);
  ellipse (270, 250, 450, 450);
  //house
  stroke(255);
  strokeWeight(3);
  line(40, 260, 100, 260);
  line(100, 260, 100, 180);
  line(100, 180, 170, 180);
  line(170, 180, 170, 300);
  line(170, 300, 205, 300);
  line(205, 300, 205, 200);
  line(205, 200, 235, 160);
  line(235, 160, 265, 200);
  line(265, 300, 265, 200);
  line(265, 300, 285, 300);
  line(285, 300, 285, 230);
  line(285, 230, 350, 230);
  line(350, 230, 350, 300);
  line(350, 300, 360, 300);
  line(360, 300, 360, 150);
  line(360, 150, 410, 150);
  line(410, 150, 410, 250);
  line(410, 250, 450, 250);
  line(450, 250, 450, 200);
  line(450, 200, 500, 200);
   
 
 
 
  //tree1
  noStroke();
  fill(255);
  triangle(200, 410, 225, 375, 250, 410);
  triangle(190, 440, 225, 395, 260, 440);
  triangle(180, 470, 227, 415, 270, 470);
 
  //tree2
  noStroke();
  fill(255);
  triangle(272, 370, 300, 330, 330, 370);
  triangle(270, 400, 300, 350, 336, 400);
  triangle(260, 430, 300, 380, 346, 430);
  triangle(260, 470, 300, 410, 346, 460);
 
  for (int i =0; i<rectX.length;i++) {
    if ((mouseX>rectX[i])&&
      (mouseX<rectX[i]+rectW[i])&&
      (mouseY>rectY[i])&&
      (mouseY<rectY[i]+rectH[i])) {
      fill(255, 217, 0); // Roll over colour
    }
    else {
      fill(255); // Normal Colour
    }
    rect(rectX[i], rectY[i], rectW[i], rectH[i]);
  }
 
  //particles
 
  xPos = append(xPos, random(110, 410));
  yPos = append (yPos, random (80, 150));
  xVel = append(xVel, random(0, 0));
  yVel = append(yVel, random(2, 0));
  xPsize = append(xPsize, random(2, 10));
 
 
  for (int i = 0; i<xPos.length; i++) {
    fill(255);
    ellipse(xPos[i], yPos[i], xPsize[i], xPsize[i]);
    xPos[i] += xVel[i];
    yPos[i] += yVel[i];
    //gravity
    yVel [i] += 0.2;
 
 
    if (dist(xPos[i], yPos[i], 270, 250)>210) { // 222 is the size from the centre of the ellipse to the outside
      yVel[i]*=0.1; // change the 0.1 to make the balls less bouncy
      xVel[i]*=0.1; // change the 0.1 to make the balls less bouncy
    }
  }
  // checks too see how many particles there is, if more then 200 gets rid of particles
  if (xPos.length>200) {
    xPos = subset(xPos, 1);
    yPos = subset(yPos, 1);
    xVel = subset(xVel, 1);
    yVel = subset(yVel, 1);
    xPsize = subset(xPsize, 1);
  }
}
