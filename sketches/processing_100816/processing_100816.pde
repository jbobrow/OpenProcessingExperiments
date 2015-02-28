
void setup() {
  size(750, 400);
  background(0);
}

int[][] stuff = new int[255][255];
boolean render, loading;
int delay;
//float i, j, m;

void draw() {  


  fill(0);
  stroke(255);
  strokeWeight(5);
  rect(width*5/8, 0, width*3/8, height);

  buttons();
  changeButtonVals();



  if (loading) {
    fill(255);
    stroke(255);
    strokeWeight(3);
    text("rendering...", width*7/8, height/10);
    delay++;
    if (delay % 20 == 0) {
      render = true;
    }
  } 
  else {
    text("done", width*7/8, height/10);
  }

  createPattern(redVal, greenVal, blueVal, strokeVal, rotateVal);

  if (keyPressed) {
    if (key == 's') {
      save("img 9.png");
      println("SAVED");
    }
    if (key == ' ') {
      background(0);
      loading = true;
    }
  }
}

int redVal = 0, greenVal = 255, blueVal = 255, strokeVal = 40, rotateVal = 100;

void createPattern(int _redVal, int _greenVal, int _blueVal, int _strokeVal, int _rotateVal) {
  if (render) {
    pushMatrix();
    translate(200, height/2);
    for (int i = 0; i < 255; i++) {
      for (int j = 0; j < 255; j++) {
        stuff[i][j] = i+j;
        //m = i+j;
        stroke(_redVal-stuff[i][j], _greenVal-stuff[i][j], _blueVal-stuff[i][j]);
        //stroke(0, 255-m, 255-m);
        //if (i >= 30) {
        //i=0;
        //}
        //colorMode(HSB);
        //stroke(stuff[i][j], 255, 255-stuff[i][j]);
        //stroke(m, 255, 510-m);
        strokeWeight(_strokeVal);
        rotate(j*_rotateVal/100);
        point(i*height/510, j*height/510);
      }
    }
    popMatrix();
    render = false;
    loading = false;
  }
}

void buttons() {
  strokeWeight(5);
  fill(255);
  stroke(255);

  text("red", width*3/4+50, height/6+10);
  text(redVal, width*3/4+150, height/6+10);
  rect(width*3/4, height/6, 25, 10);
  rect(width*7/8, height/6, 25, 10);

  text("green", width*3/4+45, height/6+40);
  text(greenVal, width*3/4+150, height/6+40);
  rect(width*3/4, height/6+30, 25, 10);
  rect(width*7/8, height/6+30, 25, 10);

  text("blue", width*3/4+50, height/6+70);
  text(blueVal, width*3/4+150, height/6+70);
  rect(width*3/4, height/6+60, 25, 10);
  rect(width*7/8, height/6+60, 25, 10);
  
  text("stroke", width*3/4+45, height/6+95);
  text("weight", width*3/4+45, height/6+105);
  text(strokeVal, width*3/4+150, height/6+100);
  rect(width*3/4, height/6+90, 25, 10);
  rect(width*7/8, height/6+90, 25, 10);
  
  text("rotate", width*3/4+45, height/6+125);
  text("value", width*3/4+45, height/6+135);
  text(rotateVal, width*3/4+150, height/6+130);
  rect(width*3/4, height/6+120, 25, 10);
  rect(width*7/8, height/6+120, 25, 10);
  
  text("- press space to render -", width*3/4, height*7/8);
}

void changeButtonVals() {
  if (mousePressed) {
    if (redVal>=0&&redVal<=255&&greenVal>=0&&greenVal<=255&&blueVal>=0&&blueVal<=255&&strokeVal>=0&&strokeVal<=300) {
      changeButtonValsRed();
      changeButtonValsGreen();
      changeButtonValsBlue();
      changeButtonValsStrokeWeight();
      changeButtonValsRotate();
    }
  }
}

void changeButtonValsRed() {
  if (mouseX>=width*3/4&&mouseX<=width*3/4+25&&mouseY>=height/6&&mouseY<=height/6+10) {
    redVal--;
  }
  if (mouseX>=width*7/8&&mouseX<=width*7/8+25&&mouseY>=height/6&&mouseY<=height/6+10) {
    redVal++;
  }
  if (redVal > 255) {
    redVal = 255;
  }
  if (redVal < 0) {
    redVal = 0;
  }
}

void changeButtonValsGreen() {
  if (mouseX>=width*3/4&&mouseX<=width*3/4+25&&mouseY>=height/6+30&&mouseY<=height/6+40) {
    greenVal--;
  }
  if (mouseX>=width*7/8&&mouseX<=width*7/8+25&&mouseY>=height/6+30&&mouseY<=height/6+40) {
    greenVal++;
  }
  if (greenVal > 255) {
    greenVal = 255;
  }
  if (greenVal < 0) {
    greenVal = 0;
  }
}

void changeButtonValsBlue() {
  if (mouseX>=width*3/4&&mouseX<=width*3/4+25&&mouseY>=height/6+60&&mouseY<=height/6+70) {
    blueVal--;
  }
  if (mouseX>=width*7/8&&mouseX<=width*7/8+25&&mouseY>=height/6+60&&mouseY<=height/6+70) {
    blueVal++;
  }
  if (blueVal > 255) {
    blueVal = 255;
  }
  if (blueVal < 0) {
    blueVal = 0;
  }
}

void changeButtonValsStrokeWeight() {
  if (mouseX>=width*3/4&&mouseX<=width*3/4+25&&mouseY>=height/6+90&&mouseY<=height/6+100) {
    strokeVal--;
  }
  if (mouseX>=width*7/8&&mouseX<=width*7/8+25&&mouseY>=height/6+90&&mouseY<=height/6+100) {
    strokeVal++;
  }
  if (strokeVal > 300) {
    strokeVal = 300;
  }
  if (strokeVal < 0) {
    strokeVal = 0;
  }
}

void changeButtonValsRotate() {
  if (mouseX>=width*3/4&&mouseX<=width*3/4+25&&mouseY>=height/6+120&&mouseY<=height/6+130) {
    rotateVal--;
  }
  if (mouseX>=width*7/8&&mouseX<=width*7/8+25&&mouseY>=height/6+120&&mouseY<=height/6+130) {
    rotateVal++;
  }
  if (rotateVal > 300) {
    rotateVal = 300;
  }
  if (rotateVal < 1) {
    rotateVal = 1;
  }
}



