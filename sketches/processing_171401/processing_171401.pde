
//define
final int g_RectSize = 20;
final int g_RectSizeOffsetRange = 10;
final int g_RectPosOffsetRange = 8;

final int g_RectHueDisplaceMin = 0;
final int g_RectHueDisplaceMax = 15;
final float g_RectSaturationMultiplierMin = 0.5;
final float g_RectSaturationMultiplierMax = 1.5;
final float g_RectBrightnessMultiplierMin = 1.5;
final float g_RectBrightnessMultiplierMax = 3;

void setup()
{
  size(600,300);
  colorMode(RGB,255,255,255, 255);
  background(255,255,255);
  smooth();
  noStroke();
  
  pushStyle();
    leftSide();
  popStyle();
  rightSide();
}

void leftSide()
{
  translate(-1,-1);
  
  
  fill(110,105,180, 255);
  rect(1,1,300,300);
  
  //draw background
  pushStyle();
    colorMode(RGB,255,255,255, 300);
    for(int iY = 1; iY <= 300; iY++)
    {
      for(int iX = 1; iX <= 300; iX++)
      {
        stroke(255,171,165, iY);
        point(iX,iY); 
      }
    }
  popStyle();
  
  
  //draw rect
  pushStyle();
    rectMode(CENTER);
    colorMode(HSB,100,100,100, 300);
    for(int iY = 1+25; iY <= 300; iY += 50)
    {
      for(int iX = 1+25; iX <= 300; iX += 50)
      {
        color rectOriginColor = get(iX,iY);
        int rectOriginHue = int(round(hue(rectOriginColor)));
        int rectOriginSaturation = int(round(saturation(rectOriginColor)));
        int rectOriginBrightness = int(round(brightness(rectOriginColor)));
        
        fill(rectOriginHue,rectOriginSaturation,rectOriginBrightness*1.5,255);
        rect(iX,iY,g_RectSize,g_RectSize);
      }
    }
  popStyle();
}

void rightSide()
{
  //translate(300,0); //Java
  translate(300-1,0-1); //JavaScript
  
  
  fill(103, 180, 178, 255);
  rect(1,1,300,300);
  
  //draw background
  pushStyle();
    colorMode(RGB,255,255,255, 300);
    for(int iY = 1; iY <= 300; iY++)
    {
      for(int iX = 1; iX <= 300; iX++)
      {
        stroke(192,165,255, iY);
        point(iX,iY); 
      }
    }
  popStyle();
  
  
  //draw rect
  pushStyle();
    rectMode(CENTER);
    colorMode(HSB,100,100,100, 300);
    for(int iY = 1+25; iY <= 300; iY += 50)
    {
      for(int iX = 1+25; iX <= 300; iX += 50)
      {
        int rectOffsetX = int(round(random(-g_RectPosOffsetRange,g_RectPosOffsetRange)));
        int rectOffsetY = int(round(random(-g_RectPosOffsetRange,g_RectPosOffsetRange)));
        int rectSize = int(round(random(g_RectSize-g_RectSizeOffsetRange,g_RectSize+g_RectSizeOffsetRange)));  
        
        color rectOriginColor = get(iX+300,iY);
        int rectOriginHue = int(round(hue(rectOriginColor)));
        int rectOriginSaturation = int(round(saturation(rectOriginColor)));
        int rectOriginBrightness = int(round(brightness(rectOriginColor)));
              
        boolean subtractRectHue = boolean(round(random(0,1)));
        int rectHueAddend = 0;
        if(subtractRectHue) {rectHueAddend = -int(round(random(g_RectHueDisplaceMin,g_RectHueDisplaceMax)));}
        else {rectHueAddend = int(round(random(g_RectHueDisplaceMin,g_RectHueDisplaceMax)));}
        int rectHue = rectOriginHue + rectHueAddend;
        if(rectHue < 0) {rectHue = 100 - rectHue;}
        else if(rectHue > 100) {rectHue = rectHue - 100;}
        
        int rectSaturation = int(round(
          rectOriginSaturation * random(g_RectSaturationMultiplierMin,g_RectSaturationMultiplierMax)
        ));
        
        int rectBrightness = int(round(
          rectOriginBrightness * random(g_RectBrightnessMultiplierMin,g_RectBrightnessMultiplierMax)
        ));
        
        
        fill(rectHue,rectSaturation,rectBrightness, 255);
        rect(iX+rectOffsetX,iY+rectOffsetY,rectSize,rectSize);
      }
    }
  popStyle();
}


