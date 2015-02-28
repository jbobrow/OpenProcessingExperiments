
class hsbColorPicker {
  float MAX_BRIGHTNESS = 1;
  float MAX_SATURATION = 1;
  float MAX_HUE = TWO_PI;
  float MAX_ALPHA = 1;
  int H = 0, S = 1, B = 2;
  int r = 0, g = 1, b = 2;
  int wheel_bar_spacer = 30;
  int borderPadding = 4;

  int top = 0, left = 0, bottom, right;
  int[] pickedXY;
  int pickedB;
  color pickedColor;

  PGraphics pickerImage;

  //PGraphics myWheel;
  float wheelRadioScale = 150;
  int wheelRadio;
  int wheelDiameter;
  int wheelRadio2;
  int wheelCenterX, wheelCenterY, wheelTop, wheelLeft;
  boolean renderWheel = true, renderBar = true;
  boolean mouseReleased = false;

  //PGraphics myBar;
  float barWidthScale;
  int barWidth, barHeight;
  int halfBarWidth, halfBarHeight;
  int barCenterX, barCenterY, barLeft, barTop, barRight, barBottom;

  hsbColorPicker(float radio, int leftCoord, int topCoord) {

    wheelRadioScale = radio;
    wheelRadio = (int)(wheelRadioScale*MAX_SATURATION);
    wheelDiameter = 2*wheelRadio;
    wheelRadio2 = wheelRadio*wheelRadio;
    wheelLeft = borderPadding;
    wheelTop  = borderPadding;
    wheelCenterX = (int)radio + wheelLeft; 
    wheelCenterY = (int)radio + wheelTop; 

    wheel_bar_spacer = wheelRadio/4;

    barWidthScale = wheelDiameter;
    barWidth  = (int)(barWidthScale*MAX_BRIGHTNESS);
    barHeight = wheelRadio/4;
    halfBarWidth = barWidth/2;
    halfBarHeight = barHeight/2;
    barLeft = borderPadding;  
    barTop  = borderPadding + wheel_bar_spacer + wheelDiameter; 
    barRight = barLeft + barWidth;
    barBottom = barTop + barHeight;
    barCenterX = barLeft + halfBarWidth;
    barCenterY = barTop + halfBarHeight;

    pickedXY = new int[2]; 
    pickedXY[0] = wheelCenterX; 
    pickedXY[1] = wheelCenterY;
    pickedB = barWidth;
    
    pickedColor = color(0, 0, (((float)pickedB)/barWidthScale)*MAX_BRIGHTNESS);

    top = constrain(topCoord, 0, height - 1);
    left = constrain(leftCoord, 0, width - 1);
    bottom = constrain(2*borderPadding + wheelDiameter + wheel_bar_spacer + barHeight, 0, height - 1);
    right = constrain(2*borderPadding + wheelDiameter, 0, width - 1);

    pickerImage = createGraphics(right, bottom);
    pickerImage.background(0, 0, 0, 0); //transparent background???
    pickerImage.colorMode(HSB, MAX_HUE, MAX_SATURATION, MAX_BRIGHTNESS, MAX_ALPHA);
    //myWheel = createGraphics(wheelDiameter, wheelDiameter, P2D);
    //myBar   = createGraphics(barWidth, barHeight, P2D);

    renderWheel = true;
    renderBar = true;
    renderFull();
  }

  void renderWheel(float Brightness) {


//    pickerImage.background(0, 0, 0, 0); //transparent background???
//    print("  in renderWheel\n    Brightness = " + Brightness + "\n");
    pickerImage.loadPixels(); 
    
    int x, y, loc;
    for(x=0; x < wheelDiameter; x++) {
      for(y=0; y < wheelDiameter; y++) {
        loc = (borderPadding + x) + (borderPadding + y)*(pickerImage.width);
        float Saturation = dist(x, y, wheelRadio, wheelRadio);
        if (Saturation < wheelRadio) {
          Saturation = (Saturation/wheelRadio)*MAX_SATURATION;
          float Hue = atan2(wheelRadio - y, wheelRadio - x)+PI;
          pickerImage.pixels[loc] = color(Hue, Saturation, Brightness, MAX_ALPHA);
        }
        else {
          pickerImage.pixels[loc] = color(0, 0, 0, 0); //TRANSPARENT PIXEL???
          //print("transparent ddd ("+ x + ", " + y +")");
        }

      }
    }
    pickerImage.updatePixels();
    renderWheel = false;
  }

  void renderBar() {

    pickerImage.loadPixels();
  
      float step = 1.0/((float)barWidth);
      int x = 0, baseY = borderPadding + wheelDiameter + wheel_bar_spacer, y, loc;
      float a = 0;
      for (x = 0; x < barWidth; x++) {
        for(y = 0; y < barHeight; y++){
          loc = (x + borderPadding) + (baseY + y)*(pickerImage.width);
          pickerImage.pixels[loc] = color(0, 0, a, MAX_ALPHA);
        }
        a += step;
      }
    pickerImage.updatePixels();
    renderBar = false;
  }

  void renderFull() {
    

    //print("--*-- in renderFull --*--\n");
        pickerImage.beginDraw();
    if (renderWheel) {
      renderWheel( (((float)pickedB)/barWidthScale)*MAX_BRIGHTNESS );
    }

    if (renderBar) {
      renderBar();
    }
    

      pickerImage.stroke(0, 0, MAX_BRIGHTNESS, MAX_ALPHA);
      pickerImage.noFill();
      pickerImage.rectMode(CORNER);
      pickerImage.rect(barLeft + pickedB - 2, barTop - 2, 5, barHeight + 5);
      pickerImage.rect(pickedXY[0] - 2, pickedXY[1] - 2, 5, 5);  
    pickerImage.endDraw();   
    //*/
  }


  void show(PGraphics pg) {
    pg.beginDraw();
      pg.image(pickerImage, left, top);
    pg.endDraw();
  }


  void checkMousePressed(int x, int y) {
    int realX = x - left, realY = y - top;
    pickBrightness(realX, realY);
    //renderFull();
    pickColor(realX, realY);
    
  }

  void pickColor(int x, int y) {

    if (mouseInWheel(x, y)) {
      pickedXY[0] = x;
      pickedXY[1] = y;
      pickedColor = pickerImage.get(pickedXY[0], pickedXY[1]);
    }
  }

  void pickBrightness(int x, int y) {
    if ( mouseInBar(x, y) ) {

      pickedB = x - borderPadding;
//      print("pickedB = " + pickedB + "("+ x + ", " + y + ")\n");
      renderWheel = true;
      renderFull();
      pickedColor = pickerImage.get(pickedXY[0], pickedXY[1]);
    }
  }  

  boolean mouseInWheel(int x, int y) { 
    int xDist2 = (x - wheelCenterX), 
    yDist2 = (y - wheelCenterY);

    xDist2 *= xDist2;
    yDist2 *= yDist2;

    if (xDist2 + yDist2 < wheelRadio2) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean mouseInBar(int x, int y) {

    if ( ((x > barLeft) && (x < barRight)) && ((y > barTop)  && (y < barBottom)) ) {
      return true;
    }
    else {
      return false;
    }
  }

  int getRed() {
    return (int)(red(pickedColor)*(255.0/MAX_HUE));
  }

  int getGreen() {
    return (int)(green(pickedColor)*(255.0/MAX_SATURATION));
  }

  int getBlue() {
    return (int)(blue(pickedColor)*(255.0/MAX_BRIGHTNESS));
  }

  float getHue() {
    return hue(pickedColor)*(255.0/MAX_HUE);
  }

  float getSaturation() {
    return saturation(pickedColor)*(255.0/MAX_SATURATION);
  }

  float getBrightness() {
    return brightness(pickedColor)*(255.0/MAX_BRIGHTNESS);
  }
}


