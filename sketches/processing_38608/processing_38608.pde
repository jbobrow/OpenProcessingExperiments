
color green = color(45, 157, 2, 200);
float xCirc, yCirc, xLast, yLast;
float r, xo, yo, xo1;
PFont font;
PImage p0, p30, p45, p60, p90, p120, p135, p150, p180, p210, p225, p240, p270, p300, p315, p330, p360;
boolean snap = false;


void setup() {
  size(1100, 500);
  smooth();
}


void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);

  font = loadFont("Cambria-18.vlw");

  //lines
  drawLines();

  //Draw axis and circle
  xo = 140;
  yo = height/2;
  ellipse(xo, yo, 5, 5);
  line(10, height/2, width-20, height/2); // x-axis
  fill(0);
  triangle(width - 20, yo -5, width - 20, yo + 5, width - 15, yo); //triangle at the end of the x-axis
  noFill();
  stroke(0);
  r = PI/2*80;  //radius of circle
  ellipse(xo, yo, 2*r, 2*r);  //circle
  line(xo, yo - r - 5, xo, yo + r + 5); //y-axis on circle
  fill(0);
  triangle(xo - 5, yo - r - 5, xo, yo - r - 10, xo + 5, yo - r - 5);  //triangle on top of cirlce y-axis
  triangle(xo + r +5, yo - 5, xo + r +5, yo +5, xo + r + 10, yo); //triangle for x-axis 
  xo1 = xo + r + 15;
  line (xo1, 0, xo1, height); //y-axis for waves
  stroke(0);
  float theta = atan((yo - mouseY)/(mouseX - xo)); //angle theta from x-axis to mouse position

  //draw labels
  drawLabels();

  //Legend Box
  drawLegend(theta);

  //draw tracking dots
  trackDots(theta);

  //rotateLine with snaps
  snap = false;
  if (theta < .04 && theta > -.04) {
    rotateLine(0);
    snap = true;
  }
  if (theta < .5636 && theta > .4836) {
    rotateLine(PI/6);
    snap = true;
  }
  if (theta < .825 && theta > .745) {
    rotateLine(PI/4);
    snap = true;
  }
  if (theta < 1.087 && theta > 1.007) {
    rotateLine(PI/3);
    snap = true;
  }
  if (theta < PI/2 && theta > 1.5308) {
    rotateLine(PI/2);
    snap = true;
  }
  if (theta > -PI/2 && theta < -1.5308) {
    rotateLine(-PI/2);
    snap = true;
  }
  if (theta > -.5636 && theta < -.4836) {
    rotateLine(-PI/6);
    snap = true;
  }
  if (theta > -.825 && theta < -.745) {
    rotateLine(-PI/4);
    snap = true;
  }
  if (theta > -1.087 && theta < -1.007) {
    rotateLine(-PI/3);
    snap = true;
  }
  if (snap == false) {
    rotateLine(theta);
  }


  //DRAW WAVES
  drawSin();
  drawCos();
  drawTan();
  drawCosec();

  noStroke();
}

//Draw the gray lines that go inside the circle
void drawLines() { 
  int[] angles = {
    0, 30, 45, 60, 90, 120, 135, 150, 180, 210, 225, 240, 270, 300, 315, 330
  };
  for (int i = 0 ; i < angles.length ; i++) {  
    stroke(225);
    line(xo, yo, xo + r*cos(radians(angles[i])), yo - r*sin(radians(angles[i])));
    stroke(0);
    fill(0);
    ellipse(xo + r*cos(radians(angles[i])), yo - r*sin(radians(angles[i])), 5, 5);
  }
  stroke(0);
} 




void drawLabels() {
  p0 = loadImage("0.png");
  image(p0, 205, 232);

  /*
  p30 = loadImage("30.png");
   rotate(-PI/6);
   image(p30, 155, 300);
   rotate(PI/6);
   
   p45 = loadImage("45.png");
   rotate(-PI/4);
   image(p45, 90, 270);
   rotate(PI/4);
   */
}




void rotateLine(float theta) {
  stroke(0);
  //left circle
  if (mouseX < xo) {
    fill(0);
    line(xo, yo, xo - r*cos(theta), yo + r*sin(theta));

    //Cosine
    stroke(255, 0, 0);
    fill(255, 0, 0, 240);
    line(xo - r*cos(theta), yo, xo - r*cos(theta), yo + r*sin(theta));
    ellipse(xo - r*cos(theta), yo, 5, 5);
    float mappedX = map(theta, 0, PI/2, 0, r);


    //Sine
    stroke(255, 3, 226);
    fill(255, 3, 226, 240);
    line(xo, yo + r*sin(theta), xo - r*cos(theta), yo + r*sin(theta));
    ellipse(xo, yo + r*sin(theta), 5, 5);

    //CoTangent
    stroke(3, 255, 59, 240);
    fill(3, 255, 59, 240);
    line(xo - r*cos(theta), yo + r*sin(theta), xo, yo + r*1/sin(theta));
    ellipse(xo, yo + r*1/sin(theta), 5, 5);

    //Tangent
    stroke(3, 46, 255, 240);
    fill(3, 46, 255, 240);
    line(xo - r*cos(theta), yo + r*sin(theta), xo - r*1/cos(theta), yo);
    ellipse(xo - r*1/cos(theta), yo, 5, 5);

    //Cosecant
    stroke(3, 255, 255, 240);
    fill(3, 255, 255, 240);
    line(xo, yo, xo, yo + r*1/sin(theta));
    ellipse(xo, yo, 5, 5);

    stroke(0);
    fill(0);
    ellipse(xo - r*cos(theta), yo + r*sin(theta), 5, 5); //black dot on Circle
    noFill();
  }

  //right circle
  else {
    fill(0);
    line(xo, yo, xo + r*cos(theta), yo - r*sin(theta));

    //Cosine
    stroke(255, 0, 0, 240);
    fill(255, 0, 0, 240);
    line(xo + r*cos(theta), yo, xo + r*cos(theta), yo - r*sin(theta));
    ellipse(xo + r*cos(theta), yo, 5, 5);



    //Sine
    stroke(255, 3, 226, 240);
    fill(255, 3, 226, 240);
    line(xo, yo - r*sin(theta), xo + r*cos(theta), yo - r*sin(theta));
    ellipse(xo, yo - r*sin(theta), 5, 5);

    //CoTangent
    stroke(3, 255, 59, 240);
    fill(3, 255, 59, 240);
    line(xo + r*cos(theta), yo - r*sin(theta), xo, yo - r*1/sin(theta));
    ellipse(xo, yo - r*1/sin(theta), 5, 5);

    //Tangent
    stroke(3, 46, 255, 240);
    fill(3, 46, 255, 240);
    line(xo + r*cos(theta), yo - r*sin(theta), xo + r*1/cos(theta), yo);
    ellipse(xo + r*1/cos(theta), yo, 5, 5);
    
        //Cosecant
    stroke(3, 255, 255, 240);
    fill(3, 255, 255, 240);
    line(xo, yo, xo, yo - r*1/sin(theta));
    ellipse(xo, yo, 5, 5);

    stroke(0);
    fill(0);
    ellipse(xo + r*cos(theta), yo - r*sin(theta), 5, 5); //black dot on circle
    noFill();
  }
  noStroke();
}



void drawLegend(float theta) {
  stroke(200);
  fill(245, 233, 168);
  rect(20, 20, 240, 90);
  stroke(0);
  textFont(font);
  fill(0);
  float roundThetaTimes100;
  float roundThetaRadians;
  int roundThetaDeg = round(degrees(theta));

  //FIRST QUADRANT LEGEND LABELS
  if ( mouseX > xo && mouseY < yo) {
    //Check for snapping
    snap = false;
    if (theta < .04 && theta > -.04) {
      text("Ø = 0 radians ", 25, 45);
      text(" = 0˚", 165, 45);
      snap = true;
    }
    else if (theta < .5636 && theta > .4836) {
      text("Ø = π/6 radians ", 25, 45);
      text(" = 15˚", 165, 45);
      snap = true;
    }
    else if (theta < .825 && theta > .745) {
      text("Ø = π/4 radians ", 25, 45);
      text(" = 45˚", 165, 45);
      snap = true;
    }
    else if (theta < 1.087 && theta > 1.007) {
      text("Ø = π/3 radians ", 25, 45);
      text(" = 60˚", 165, 45);
      snap = true;
    }
    else if (theta < PI/2 && theta > 1.5308) {
      text("Ø = π/2 radians ", 25, 45);
      text(" = 90˚", 165, 45);
      snap = true;
    } 
    else {
      roundThetaTimes100 = round(theta*100); //have to do some weird step by step rounding for this :/
      roundThetaRadians = roundThetaTimes100 / 100; //part two of the weird rounding process
      if (roundThetaRadians == 1.0) { //change radians to singular form
        text("Ø = " + roundThetaRadians + " radian ", 25, 45);
        text(" = "  + roundThetaDeg + "˚", 165, 45);
      }
      else {
        text("Ø = " + roundThetaRadians + " radians ", 25, 45);
        text(" = "  + roundThetaDeg + "˚", 165, 45);
      }
    }
  }

  //SECOND QUADRANT LEGEND LABELS
  if ( mouseX < xo && mouseY < yo) {
    //check for snapping
    if (theta > -PI/2 && theta < -1.5308) {
      text("Ø = π/2 radians ", 25, 45);
      text(" = 90˚", 165, 45);
      snap = true;
    }
    else if (theta > -.5636 && theta < -.4836) {
      text("Ø = 5π/6 radians ", 25, 45);
      text(" = 150˚", 165, 45);
      snap = true;
    }
    else if (theta > -.825 && theta < -.745) {
      text("Ø = 3π/4 radians ", 25, 45);
      text(" = 135˚", 165, 45);
      snap = true;
    }
    else if (theta > -1.087 && theta < -1.007) {
      text("Ø = 2π/3 radians ", 25, 45);
      text(" = 120˚", 165, 45);
      snap = true;
    }
    else if (theta < .04 && theta > -.04) {
      text("Ø = π radians ", 25, 45);
      text(" = 180˚", 165, 45);
      snap = true;
    }
    else {
      roundThetaTimes100 = round(PI*100 + theta*100); //have to do some weird step by step rounding for this :/
      roundThetaRadians = roundThetaTimes100 / 100; //part two of the weird rounding process
      roundThetaDeg = 180 + roundThetaDeg;
      text("Ø = " + roundThetaRadians + " radians ", 25, 45);
      text(" = "  + roundThetaDeg + "˚", 165, 45);
    }
  }

  //THIRD QUADRANT LEGEND LABELS
  if ( mouseX < xo && mouseY > yo) {
    //Check for snapping
    snap = false;
    if (theta < .04 && theta > -.04) {
      text("Ø = π radians ", 25, 45);
      text(" = 180˚", 165, 45);
      snap = true;
    }
    else if (theta < .5636 && theta > .4836) {
      text("Ø = 7π/6 radians ", 25, 45);
      text(" = 210˚", 165, 45);
      snap = true;
    }
    else if (theta < .825 && theta > .745) {
      text("Ø = 5π/4 radians ", 25, 45);
      text(" = 225˚", 165, 45);
      snap = true;
    }
    else if (theta < 1.087 && theta > 1.007) {
      text("Ø = 4π/3 radians ", 25, 45);
      text(" = 240˚", 165, 45);
      snap = true;
    }
    else if (theta < PI/2 && theta > 1.5308) {
      text("Ø = 3π/2 radians ", 25, 45);
      text(" = 270˚", 165, 45);
      snap = true;
    } 
    else {
      roundThetaTimes100 = round(PI*100 + theta*100); //have to do some weird step by step rounding for this :/
      roundThetaRadians = roundThetaTimes100 / 100; //part two of the weird rounding process
      roundThetaDeg = 180 + roundThetaDeg;
      text("Ø = " + roundThetaRadians + " radians ", 25, 45);
      text(" = "  + roundThetaDeg + "˚", 165, 45);
    }
  }

  //FOURTH QUADRANT LABELS
  if ( mouseX > xo && mouseY > yo) {

    //check for snapping
    if (theta > -PI/2 && theta < -1.5308) {
      text("Ø = 3π/2 radians ", 25, 45);
      text(" = 270˚", 165, 45);
      snap = true;
    }
    else if (theta > -.5636 && theta < -.4836) {
      text("Ø = 5π/3 radians ", 25, 45);
      text(" = 300˚", 165, 45);
      snap = true;
    }
    else if (theta > -.825 && theta < -.745) {
      text("Ø = 7π/4 radians ", 25, 45);
      text(" = 315˚", 165, 45);
      snap = true;
    }
    else if (theta > -1.087 && theta < -1.007) {
      text("Ø = 11π/6 radians ", 25, 45);
      text(" = 330˚", 165, 45);
      snap = true;
    }
    else if (theta < .04 && theta > -.04) {
      text("Ø = 0 radians ", 25, 45);
      text(" = 0˚", 165, 45);
      snap = true;
    }
    else {
      roundThetaTimes100 = round(2*PI*100 + theta*100); //have to do some weird step by step rounding for this :/
      roundThetaRadians = roundThetaTimes100 / 100; //part two of the weird rounding process
      roundThetaDeg = 360 + roundThetaDeg;
      text("Ø = " + roundThetaRadians + " radians ", 25, 45);
      text(" = "  + roundThetaDeg + "˚", 165, 45);
    }
  }
  noFill();
}

void trackDots(float theta) {
  float mappedX = map(theta, 0, PI/2, 0, r);
  stroke(255, 0, 0);
  fill(255, 0, 0);

  //SINE
  //when the mouse is around the circle
  if (mouseX > xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(xo1+mappedX, yo-r*sin(theta), 5, 5); //sine dot
    }
    else if (mouseY > yo) {
      ellipse(4*r-2+ xo1+mappedX, yo-r*sin(theta), 5, 5); //sine dot
    }
  } 
  if (mouseX < xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(2*r+xo1+mappedX, yo+r*sin(theta), 5, 5);//sine dot
    }
    else if (mouseY > yo) { 
      ellipse(2*r+ xo1+mappedX, yo+r*sin(theta), 5, 5);//sine dot
    }
  }

  //when the mouse is on the wave graph
  if (mouseX > xo1) {
    ellipse(mouseX, yo - sin((mouseX-xo1)/80) * r, 5, 5);
  }

  //COSINE
  //when the mouse is around the circle
  stroke(255, 3, 226);
  fill(255, 3, 226);
  if (mouseX > xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(xo1+mappedX, yo-r*cos(theta), 5, 5); //sine dot
    }
    else if (mouseY > yo) {
      ellipse(4*r-2+ xo1+mappedX, yo-r*cos(theta), 5, 5); //sine dot
    }
  } 
  if (mouseX < xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(2*r+xo1+mappedX, yo+r*cos(theta), 5, 5);//sine dot
    }
    else if (mouseY > yo) { 
      ellipse(2*r+ xo1+mappedX, yo+r*cos(theta), 5, 5);//sine dot
    }
  }

  //when the mouse is on the wave graph
  if (mouseX > xo1) {
    ellipse(mouseX, yo - cos((mouseX-xo1)/80) * r, 5, 5);
  }

  //TANGENT
  //when the mouse is around the circle
  stroke(3, 46, 255, 240);
  fill(3, 46, 255, 240);
  if (mouseX > xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(xo1+mappedX, yo-r*tan(theta), 5, 5); //TANGENT dot
    }
    else if (mouseY > yo) {
      ellipse(4*r-2+ xo1+mappedX, yo-r*tan(theta), 5, 5); //TANGENT dot
    }
  } 
  if (mouseX < xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(2*r+ xo1+mappedX, yo+r*tan(-theta), 5, 5);//TANGENT dot
      
    }
    else if (mouseY > yo) { 
      ellipse(2*r+xo1+mappedX, yo+r*tan(-theta), 5, 5);//TANGENT dot
    }
  }

  //when the mouse is on the wave graph
  if (mouseX > xo1) {
    ellipse(mouseX, yo - tan((mouseX-xo1)/80) * r, 5, 5);
  }
  
  //COSECANT
  //when the mouse is around the circle
  stroke(3, 255, 255, 240);
  fill(3, 255, 255, 240);
  if (mouseX > xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(xo1+mappedX, yo-r*1/sin(theta), 5, 5); //COSECANT dot
    }
    else if (mouseY > yo) {
      ellipse(4*r-2+ xo1+mappedX, yo-r*1/sin(theta), 5, 5); //COSECANT dot
    }
  } 
  if (mouseX < xo && mouseX < xo1) {
    if (mouseY < yo) {
      ellipse(2*r+xo1+mappedX, yo+r*1/sin(theta), 5, 5);//COSECANT dot
    }
    else if (mouseY > yo) { 
      ellipse(2*r+ xo1+mappedX, yo+r*1/sin(theta), 5, 5);//COSECANT dot
    }
  }

  //when the mouse is on the wave graph
  if (mouseX > xo1) {
    ellipse(mouseX, yo - 1/sin((mouseX-xo1)/80) * r, 5, 5);//COSECANT dot
  }
}

void drawSin() {
  //sine wave
  float a = 0;
  float inc = TWO_PI/25.0;
  float prev_x = xo1, prev_y = yo, x = xo1, y = yo;
  stroke(255, 0, 0);
  for (int i=round(xo1); i<width; i=i+4) {
    x = i;
    y = yo - sin(a/5) * r;
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}

void drawCos() {
  float a = 0;
  float inc = TWO_PI/25.0;
  float prev_x = xo1, prev_y = yo-r, x = xo1, y = yo;
  stroke(255, 3, 226);
  for (int i=round(xo1); i<width; i=i+4) {
    x = i;
    y = yo - cos(a/5) * r;
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}


void drawTan() {
  float a = 0;
  float inc = TWO_PI/25.0;
  float prev_x = xo1, prev_y = yo, x = xo1, y = yo;
  stroke(3, 46, 255, 240);
  for (int i=round(xo1); i<width; i=i+4) {
    x = i;
    y = yo - tan(a/5) * r;
    if (y > - 10 && y < height+10) {
      line(prev_x, prev_y, x, y);
    }
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}


void drawCosec() {
  float a = 0;
  float inc = TWO_PI/25.0;
  float prev_x = xo1, prev_y = yo, x = xo1, y = yo;
  stroke(3, 255, 255, 240);
  for (int i=round(xo1); i<width; i=i+4) {
    x = i;
    y = yo - 1/sin(a/5) * r;
    if (y > - 10 && y < height+10) {
      line(prev_x, prev_y, x, y);
    }
    prev_x = x;
    prev_y = y;
    a = a + inc;
  }
}



