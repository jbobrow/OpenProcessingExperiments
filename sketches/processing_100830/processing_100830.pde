
//--------------------------------------------------------------------------
void setup() {
  size(displayWidth, displayHeight*2/3);
  smooth();
  rectMode(CENTER);
}
//--------------------------------------------------------------------------
float xnoise;
float ynoise;
float xstart;
float znoise;
long ns;    // noise seed
//--------------------------------------------------------------------------
void draw() {
  createPerlinNoise(colorize, colorizeValue-25,
  colorizeRainbowCycle, rainbowCycleSpeed,
  colorBackground, backgroundColor,
  zoom, opacity,
  speed);
  
  buttons();
  changeButtonValues();
}
//--------------------------------------------------------------------------
boolean colorize = true;
boolean changeColorizeValue = true;
float cycleRainbowValue;
boolean colorizeRainbowCycle = false;
boolean changeColorizeRainbowCycle = true;
float rainbowCycleSpeed = 1;
float colorizeValue;
boolean changeColorBackground = true;
boolean colorBackground;
float backgroundColor;
float zoom = 2;
float opacity = 255;
float speed = 60;
//--------------------------------------------------------------------------
void buttons() {
  buttonsColorize();
  buttonsColorizeValue();
  buttonsColorizeRainbowCycle();
  buttonsRainbowCycleSpeed();
  buttonsColorBackground();
  buttonsBackgroundColor();
  buttonsZoom();
  buttonsOpacity();
  buttonsSpeed();
}

void buttonsColorize() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("colorize", width*3/4-50, height/8+10);
  rect(width*3/4, height/8, 40, 15);  
  if (colorize) {
    text("ON", width*3/4+75, height/8+10);
  } 
  else {
    text("OFF", width*3/4+75, height/8+10);
  }
}

void buttonsColorizeValue() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("color", width*3/4-50, height/8+10+30);
  rect(width*3/4-10, height/8+30, 20, 15);
  rect(width*3/4+30, height/8+30, 20, 15);
  text((int)colorizeValue, width*3/4+75+10, height/8+10+30);
}

void buttonsColorizeRainbowCycle() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("rainbow cycle", width*3/4-50, height/8+10+60);
  rect(width*3/4, height/8+60, 40, 15);  
  if (colorizeRainbowCycle) {
    text("ON", width*3/4+75, height/8+70);
  } 
  else {
    text("OFF", width*3/4+75, height/8+70);
  }
}

void buttonsRainbowCycleSpeed() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("cycle speed", width*3/4-50, height/8+10+90);
  rect(width*3/4-10, height/8+90, 20, 15);
  rect(width*3/4+30, height/8+90, 20, 15);
  text((int)rainbowCycleSpeed, width*3/4+75+10, height/8+10+90);
}

void buttonsColorBackground() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("color background", width*3/4-50, height/8+10+120);
  rect(width*3/4, height/8+120, 40, 15);  
  if (colorBackground) {
    text("ON", width*3/4+75, height/8+130);
  } 
  else {
    text("OFF", width*3/4+75, height/8+130);
  }
}

void buttonsBackgroundColor() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("background color", width*3/4-50-10, height/8+10+150);
  rect(width*3/4-10, height/8+150, 20, 15);
  rect(width*3/4+30, height/8+150, 20, 15);
  text((int)backgroundColor, width*3/4+75+10, height/8+10+150);
}

void buttonsZoom() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("zoom", width*3/4-50, height/8+10+180);
  rect(width*3/4-10, height/8+180, 20, 15);
  rect(width*3/4+30, height/8+180, 20, 15);
  text((int)(51-zoom), width*3/4+75+10, height/8+10+180);
}

void buttonsOpacity() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("opacity", width*3/4-50, height/8+10+210);
  rect(width*3/4-10, height/8+210, 20, 15);
  rect(width*3/4+30, height/8+210, 20, 15);
  text((int)opacity, width*3/4+75+10, height/8+10+210);
}

void buttonsSpeed() {
  fill(255);
  rectMode(CORNER);
  textAlign(CENTER);
  text("speed", width*3/4-50, height/8+10+240);
  rect(width*3/4-10, height/8+240, 20, 15);
  rect(width*3/4+30, height/8+240, 20, 15);
  text((int)speed, width*3/4+75+10, height/8+10+240);
}

//--------------------------------------------------------------------------
void changeButtonValues() {
  if (mousePressed) {
    changeButtonValuesColorize();
    changeButtonValuesColorizeValue();
    changeButtonValuesColorizeRainbowCycle();
    changeButtonValuesRainbowCycleSpeed();
    changeButtonValuesColorBackground();
    changeButtonValuesBackgroundColor();
    changeButtonValuesZoom();
    changeButtonValuesOpacity();
    changeButtonValuesSpeed();
  }
}

void changeButtonValuesColorize() {
  if (changeColorizeValue) {
    if (mouseX>=width*3/4&&mouseX<=width*3/4+40&&
      mouseY>=height/8&&mouseY<=height/8+15) {
      colorize = !colorize;
      if (colorize == true) {
        colorizeRainbowCycle = false;
      }
      changeColorizeValue = false;
    }
  }
}

void changeButtonValuesColorizeValue() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+30&&mouseY<=height/8+15+30) {
    colorizeValue--;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+30&&mouseY<=height/8+15+30) {
    colorizeValue++;
  }
  if (colorizeValue > 255) {
    colorizeValue = 255;
  }
  if (colorizeValue < 0) {
    colorizeValue = 0;
  }
}

void changeButtonValuesColorizeRainbowCycle() {
  if (changeColorizeRainbowCycle) {
    if (mouseX>=width*3/4&&mouseX<=width*3/4+40&&
      mouseY>=height/8+60&&mouseY<=height/8+15+60) {
      colorizeRainbowCycle = !colorizeRainbowCycle;
      if (colorizeRainbowCycle == true) {
        colorize = false;
      }
      changeColorizeRainbowCycle = false;
    }
  }
}

void changeButtonValuesRainbowCycleSpeed() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+90&&mouseY<=height/8+15+90) {
    rainbowCycleSpeed-=.5;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+90&&mouseY<=height/8+15+90) {
    rainbowCycleSpeed+=.5;
  }
  if (rainbowCycleSpeed < 0) {
    rainbowCycleSpeed = 0;
  }
}

void changeButtonValuesColorBackground() {
  if (changeColorBackground) {
    if (mouseX>=width*3/4&&mouseX<=width*3/4+40&&
      mouseY>=height/8+120&&mouseY<=height/8+15+120) {
      colorBackground = !colorBackground;
      changeColorBackground = false;
    }
  }
}

void changeButtonValuesBackgroundColor() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+150&&mouseY<=height/8+15+150) {
    backgroundColor--;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+150&&mouseY<=height/8+15+150) {
    backgroundColor++;
  }
  if (backgroundColor > 255) {
    backgroundColor = 255;
  }
  if (backgroundColor < 0) {
    backgroundColor = 0;
  }
}

void changeButtonValuesZoom() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+180&&mouseY<=height/8+15+180) {
    zoom+=.5;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+180&&mouseY<=height/8+15+180) {
    zoom-=.5;
  }
  if (zoom > 50) {
    zoom = 50;
  }
  if (zoom < 1) {
    zoom = 1;
  }
}

void changeButtonValuesOpacity() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+210&&mouseY<=height/8+15+210) {
    opacity--;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+210&&mouseY<=height/8+15+210) {
    opacity++;
  }
  if (opacity > 255) {
    opacity = 255;
  }
  if (opacity < 0) {
    opacity = 0;
  }
}

void changeButtonValuesSpeed() {
  if (mouseX>=width*3/4-10&&mouseX<=width*3/4-10+20&&
    mouseY>=height/8+240&&mouseY<=height/8+15+240) {
    speed--;
  }
  if (mouseX>=width*3/4+30&&mouseX<=width*3/4+30+20&&
    mouseY>=height/8+240&&mouseY<=height/8+15+240) {
    speed++;
  }
  if (speed < 1) {
    speed = 1;
  }
}

void mouseReleased() {
  changeColorizeValue = true;
  changeColorizeRainbowCycle = true;
  changeColorBackground = true;
}
//--------------------------------------------------------------------------
void createPerlinNoise(
boolean _colorize, float colorizeValue,
boolean _colorizeRainbowCycle, float _rainbowCycleSpeed,
boolean _colorBackground, float _backgroundColor,
float _zoom, float _opacity,
float _speed) {
  ns = 10;
  noiseSeed(ns);
  xnoise = noise(ns);
  xstart = xnoise;
  ynoise = noise(ns);
  float zoom = _zoom/100;

  if (_colorBackground) {
    background(_backgroundColor, 255, 255);
  } 
  else {
    background(0);
  }
  for (int i = 0; i <= width/5/2; i++) {
    ynoise+=zoom;
    znoise+=zoom/50;
    xnoise = xstart;
    for (int j = 0; j <= height/5; j++) {
      xnoise+=zoom;
      colorMode(HSB);
      if (_colorize) {
        fill(noise(xnoise, ynoise, znoise)*50+colorizeValue, 255, 255, _opacity);
      }
      if (_colorizeRainbowCycle) {
        cycleRainbowValue+=rainbowCycleSpeed/20000;
        if (cycleRainbowValue >= 255-25) {
          cycleRainbowValue-=255;
        }
        fill(noise(xnoise, ynoise, znoise)*50+cycleRainbowValue, 255, 255, _opacity);
      }
      if (_colorize == false && _colorizeRainbowCycle == false) {
        fill(255, _opacity);
      }
      float rectSize = (noise(xnoise, ynoise, znoise)*10);
      noStroke();
      rect(i*5, j*5, rectSize, rectSize);
    }
  }
  fill(0);
  stroke(0);
  rect(width/2, 0, width/2, height);
}
//--------------------------------------------------------------------------



