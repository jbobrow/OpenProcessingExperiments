
color hover = color (12,108,129,140);
color out = color (180,53,53,140);
color gray = color (180);
color darkgray = color (70);
color textCLight = color (80),textCDark = color (200), amountTextColor = color (247);

int reihenMax = 200, noiseAmountMax = 7, windAmountMax = 7, depthMax = 20, highlightAmountMax = 3, hMax = 360, audioDepthMax = 1000;

color menuColor = out, reihenColor = out, noiseAmountColor = out, windAmountColor = out, depthColor = out, highlightAmountColor=out, changeColorColor = out, hColor = out, sColor = out,b2Color = out, aColor = out;
color bgColor = out, fillColor = out, gridColor = out, dotColor = out, audioColor = out, audioDepthColor = out;

int startText = 20, startX = 130, amountTextX = startX+10, GUIwidth = 400, sliderWidth = GUIwidth-startText-startX, sliderHeight = 16;
int startX2 = startX + sliderHeight + 90, sliderWidth2 = sliderWidth - startX2+startX;
int startX3 = startX + 60, startX4 = startX3 + 60, startX5 = startX4 + 60;

int sliderSpacing = 26;
int menuY = sliderSpacing, reihenY =sliderSpacing*2, noiseAmountY = sliderSpacing*3, windAmountY = sliderSpacing* 4, depthY = sliderSpacing * 5, highlightAmountY = sliderSpacing*6;
int changeColorY = sliderSpacing*7, hY = changeColorY, sY= sliderSpacing*8, b2Y = sliderSpacing*9, aY = sliderSpacing*10;
int bgY = sliderSpacing*11, fillY = bgY, gridY = bgY, dotY = bgY, audioY = sliderSpacing*12, audioDepthY = audioY;


float reihenX, noiseAmountX, windAmountX, depthX, highlightAmountX, hX, sX,b2X, aX, bgX, fillX, gridX, dotX, audioDepthX;

void showGUI ()
{
  // hintergrund
  noStroke ();
  if (whiteBG == true) fill (220, 70);
  if (whiteBG == false) fill (40, 70);
  rect (0, 0, GUIwidth, height);

  String nextText, amountText;
  textFont (font, textS);

  if (whiteBG == true) fill (textCLight);
  if (whiteBG == false) fill (textCDark);

  // menu
  nextText = "Rows";
  text (nextText, startText, reihenY+textS);
  nextText = "Noise Amount";
  text (nextText, startText, noiseAmountY+textS);
  nextText = "Wind Amount";
  text (nextText, startText, windAmountY+textS);
  nextText = "Depth";
  text (nextText, startText, depthY+textS);
  nextText = "Hightlighting";
  text (nextText, startText, highlightAmountY+textS);
  nextText = "Change Color";
  text (nextText, startText, changeColorY+textS);
  nextText = "Hue";
  text (nextText, startX+2*sliderHeight, hY+textS);
  nextText = "Saturation";
  text (nextText, startText, sY+textS);
  nextText = "Brightness";
  text (nextText, startText, b2Y+textS);
  nextText = "Alpha";
  text (nextText, startText, aY+textS);
  if (whiteBG == true) nextText = "Black BG >>";
  else nextText = "White BG >>";
  text (nextText, startText, bgY+textS);
  nextText = "Fill";
  text (nextText, startX3+1.5*sliderHeight, fillY+textS); 
  nextText = "Grid";
  text (nextText, startX4+1.5*sliderHeight, fillY+textS);
  nextText = "Dots";
  text (nextText, startX5+1.5*sliderHeight, fillY+textS);
  nextText = "Add Music";
  text (nextText, startText, audioY+textS);
  nextText = "AudioDepth";
  text (nextText, startX+2*sliderHeight, audioDepthY+textS);

  // gray background
  if (whiteBG == true) fill (gray);
  if (whiteBG == false) fill (darkgray);
  rect (startX, reihenY, sliderWidth, sliderHeight);
  rect (startX, noiseAmountY, sliderWidth, sliderHeight);
  rect (startX, windAmountY, sliderWidth, sliderHeight);
  rect (startX, depthY, sliderWidth, sliderHeight);
  rect (startX, highlightAmountY, sliderWidth, sliderHeight);
  rect (startX, changeColorY, sliderHeight, sliderHeight);
  rect (startX2, hY, sliderWidth2, sliderHeight);
  rect (startX, sY, sliderWidth, sliderHeight);
  rect (startX, b2Y, sliderWidth, sliderHeight);
  rect (startX, aY, sliderWidth, sliderHeight);
  rect (startX, bgY, sliderHeight, sliderHeight);
  rect (startX3, fillY, sliderHeight, sliderHeight);
  rect (startX4, gridY, sliderHeight, sliderHeight);
  rect (startX5, dotY, sliderHeight, sliderHeight);
  rect (startX, audioY, sliderHeight, sliderHeight);
  rect (startX2, audioDepthY, sliderWidth2, sliderHeight);

  // colored slider
  fill (reihenColor);
  rect (startX, reihenY, reihenX, sliderHeight);
  fill (noiseAmountColor);
  rect (startX, noiseAmountY, noiseAmountX, sliderHeight);
  fill (windAmountColor);
  rect (startX, windAmountY, windAmountX, sliderHeight);
  fill (depthColor);
  rect (startX, depthY, depthX, sliderHeight);
  fill (highlightAmountColor);
  rect (startX, highlightAmountY, highlightAmountX, sliderHeight);
  fill (changeColorColor);
  rect (startX, changeColorY, sliderHeight, sliderHeight);
  if (changeColors == false)
  {
    fill (hColor);
    rect (startX2, hY, hX, sliderHeight);
  }
  fill (sColor);
  rect (startX, sY, sX, sliderHeight);
  fill (b2Color);
  rect (startX, b2Y, b2X, sliderHeight);
  fill (aColor);
  rect (startX, aY, aX, sliderHeight);
  fill (bgColor);
  rect (startX, bgY, sliderHeight, sliderHeight);
  fill (fillColor);
  rect (startX3, fillY, sliderHeight, sliderHeight);
  fill (gridColor);
  rect (startX4, gridY, sliderHeight, sliderHeight);
  fill (dotColor);
  rect (startX5, dotY, sliderHeight, sliderHeight);
  fill (audioColor);
  rect (startX, audioY, sliderHeight, sliderHeight);
  if (addAudio == true) 
  {
    fill (audioDepthColor);
    rect (startX2, audioDepthY, audioDepthX, sliderHeight);
  }

  // amount
  textFont (smallFont, textS-2);
  fill (amountTextColor);
  amountText = str (reihen);
  text (amountText, amountTextX, reihenY+textS);
  amountText = nf (noiseAmount,1,2);
  text (amountText, amountTextX, noiseAmountY+textS);
  amountText = nf (windAmount,1,2);
  text (amountText, amountTextX, windAmountY+textS);
  amountText = nf (depth,1,2);
  text (amountText, amountTextX, depthY+textS);
  amountText = nf (highlightAmount,1,2);
  text (amountText, amountTextX, highlightAmountY+textS);
  if (changeColors == true) shape (crossShape,startX+2,changeColorY+2,12,12);
  if (changeColors == false)
  {
    amountText = nf (hAmount,1,2);
    text (amountText, startX2+10, hY+textS);
  }
  amountText = str (s);
  text (amountText, amountTextX, sY+textS);
  amountText = nf (b2,1,2);
  text (amountText, amountTextX, b2Y+textS);
  amountText = nf (a,1,2);
  text (amountText, amountTextX, aY+textS);
  if (showFill == true && showDots == false) shape (crossShape,startX3+2,fillY+2,12,12);
  else if (showFill == false && showDots == false) shape (crossShape,startX4+2,gridY+2,12,12);
  if (showDots == true) shape (crossShape,startX5+2,dotY+2,12,12);
  if (addAudio == true) 
  {
    shape (crossShape,startX+2,audioY+2,12,12);
    amountText = nf (audioDepth,1,2);
    text (amountText, startX2+10, audioDepthY+textS);
  }
}

void GUIEvent ()
{
  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= reihenY && mouseY <= reihenY+sliderHeight)
  {
    reihenColor = hover;
    if (mouseIsReleased == true) {
      reihenX = mouseX-startX;
      reihenX = constrain (reihenX, 0, sliderWidth);
      reloadSetupDot = true;
    }
    mouseIsReleased = false;
  } 
  else reihenColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= noiseAmountY && mouseY <= noiseAmountY+sliderHeight)
  {
    noiseAmountColor = hover;
    if (mouseIsReleased == true) {
      noiseAmountX = mouseX-startX;
      noiseAmountX = constrain (noiseAmountX, 0, sliderWidth);
    }
    mouseIsReleased = false;
  } 
  else noiseAmountColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= windAmountY && mouseY <= windAmountY+sliderHeight)
  {
    windAmountColor = hover;
    if (mouseIsReleased == true) windAmountX = mouseX-startX;
    windAmountX = constrain (windAmountX, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else windAmountColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= depthY && mouseY <= depthY+sliderHeight)
  {
    depthColor = hover;
    if (mouseIsReleased == true) depthX = mouseX-startX;
    depthX = constrain (depthX, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else depthColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= highlightAmountY && mouseY <= highlightAmountY+sliderHeight)
  {
    highlightAmountColor = hover;
    if (mouseIsReleased == true) highlightAmountX = mouseX-startX;
    highlightAmountX = constrain (highlightAmountX, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else highlightAmountColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderHeight&& mouseY >= changeColorY && mouseY <= changeColorY+sliderHeight)
  {
    changeColorColor = hover;
    if (mouseIsReleased == true && changeColors == true) {
      changeColors = false;
    }
    else if (mouseIsReleased == true && changeColors == false) changeColors = true;

    hAmount = addH;
    hX = map (hAmount,0, hMax, 0, sliderWidth2);
    mouseIsReleased = false;
  } 
  else changeColorColor = out;

  if (changeColors == false && mouseX >= startX2 && mouseX <=startX2+sliderWidth2&& mouseY >= hY && mouseY <= hY+sliderHeight)
  {
    hColor = hover;
    if (mouseIsReleased == true) hX = mouseX-startX2;
    hX = constrain (hX, 0, sliderWidth2);
    mouseIsReleased = false;
  } 
  else hColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= sY && mouseY <= sY+sliderHeight)
  {
    sColor = hover;
    if (mouseIsReleased == true) sX = mouseX-startX;

    sX = constrain (sX, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else sColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= b2Y && mouseY <= b2Y+sliderHeight)
  {
    b2Color = hover;
    if (mouseIsReleased == true) b2X = mouseX-startX;

    b2X = constrain (b2X, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else b2Color = out;

  if (mouseX >= startX && mouseX <=startX+sliderWidth&& mouseY >= aY && mouseY <= aY+sliderHeight)
  {
    aColor = hover;
    if (mouseIsReleased == true) aX = mouseX-startX;

    aX = constrain (aX, 0, sliderWidth);
    mouseIsReleased = false;
  } 
  else aColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderHeight&& mouseY >= bgY && mouseY <= bgY+sliderHeight)
  {
    bgColor = hover;
    if (mouseIsReleased == true) {
      if (whiteBG== true) whiteBG = false;
      else if (whiteBG== false) whiteBG = true;
      if (whiteBG == true) 
      {
        b2 = 100.0;
        a = 1.0;
      }

      else if (whiteBG == false) 
      {
        b2 = 1.0;
        a = 80;
      }
      createGUIPosition ();
    }
    mouseIsReleased = false;
  } 
  else bgColor = out;

  if (mouseX >= startX3 && mouseX <=startX3+sliderHeight&& mouseY >= fillY && mouseY <= fillY+sliderHeight)
  {
    fillColor = hover;
    if (mouseIsReleased == true) {
      if (showDots == true) {
        reihen = 100;
        setupDotList ();
      }
      showFill = true;
      showDots = false;

      if (whiteBG == true) 
      {
        b2 = 100.0;
        a = 1.0;
      }

      else if (whiteBG == false) 
      {
        b2 = 1.0;
        a = 80;
      }

      minMax ();
      createGUIPosition ();
    }
    mouseIsReleased = false;
  } 
  else fillColor = out;

  if (mouseX >= startX4 && mouseX <=startX4+sliderHeight&& mouseY >= fillY && mouseY <= gridY+sliderHeight)
  {
    gridColor = hover;
    if (mouseIsReleased == true) {
      if (showDots == true) {
        reihen = 100;
        setupDotList ();
      }
      showFill = false;
      showDots = false;
      a = 80.0;
      b2 = 100.0;

      minMax ();
      createGUIPosition ();
    }
    mouseIsReleased = false;
  } 
  else gridColor = out;

  if (mouseX >= startX5 && mouseX <=startX5+sliderHeight&& mouseY >= dotY && mouseY <= dotY+sliderHeight)
  {
    dotColor = hover;
    if (mouseIsReleased == true) {
      showFill = false;
      showDots = true;
      if (whiteBG == true) 
      {
        b2 = 100.0;
        a = 1.0;
      }

      else if (whiteBG == false) 
      {
        b2 = 1.0;
        a = 80;
      }
      minMax ();
      setupDotList ();
      createGUIPosition ();
    }
    mouseIsReleased = false;
  } 
  else dotColor = out;

  if (mouseX >= startX && mouseX <=startX+sliderHeight&& mouseY >= audioY && mouseY <= audioY+sliderHeight)
  {
    audioColor = hover;
    if (mouseIsReleased == true) {
      if (addAudio == true) {
        groove.close();
        minim = null;
        groove = null;
        ceffect = null;

        addAudio = false;
      }
      else if (addAudio == false) {
        addAudio = true;

        minim = new Minim(this);
        groove = minim.loadFile("groove.mp3", 2048);
        ceffect = new CustomEffect();
        groove.loop();
        groove.addEffect(ceffect);

        minAudB = 1000.0;
        maxAudB = 0.0;
      }
    }
    mouseIsReleased = false;
  } 
  else audioColor = out;

  if (addAudio == true && mouseX >= startX2 && mouseX <=startX2+sliderWidth2&& mouseY >= audioDepthY && mouseY <= audioDepthY+sliderHeight)
  {
    audioDepthColor = hover;
    if (mouseIsReleased == true) audioDepthX = mouseX-startX2;
    audioDepthX = constrain (audioDepthX, 0, sliderWidth2);
    mouseIsReleased = false;
  } 
  else audioDepthColor = out;
}

void calGUI ()
{
  reihen = round (map (reihenX, 0, sliderWidth, 2, reihenMax));
  noiseAmount = map(noiseAmountX, 0, sliderWidth, 0, noiseAmountMax);
  windAmount = map(windAmountX, 0, sliderWidth, 0, windAmountMax);
  depth = map(depthX, 0, sliderWidth, 0, depthMax);
  highlightAmount = map(highlightAmountX, 0, sliderWidth, 0, highlightAmountMax);
  if (changeColors == false) hAmount = map(hX, 0, sliderWidth2, 0, hMax);
  s = round (map(sX, 0, sliderWidth, 0, 100));
  if (showFill == true || showDots == true)
  {
    if (whiteBG == false) b2 =map(b2X, 0, sliderWidth, 0, 2);
    else b2 = map(b2X, 0, sliderWidth, 0, 100);
  }
  else b2 = map(b2X, 0, sliderWidth, 0, 100);

  if (showFill == true || showDots == true)
  {
    if (whiteBG == false) a =map(aX, 0, sliderWidth, 0, 255);
    else a = map(aX, 0, sliderWidth, 0, 2);
  } 
  else a =map(aX, 0, sliderWidth, 0, 255);
  if (addAudio == true) audioDepth = map(audioDepthX, 0, sliderWidth2, 0, audioDepthMax);

  if (reloadSetupDot == true)
  {
    setupDotList ();
    reloadSetupDot = false;
  }
}

void menu ()
{
  String nextText, amountText;
  textFont (font, textS);

  if (whiteBG == true) fill (textCLight);
  if (whiteBG == false) fill (textCDark);

  // menu
  nextText = "Menu";
  text (nextText, startText, menuY+textS);

  noStroke();
  // gray background
  if (whiteBG == false) fill (gray);
  if (whiteBG == true) fill (darkgray);
  rect (0, menuY, sliderHeight, sliderHeight);

  // colored slider
  fill (menuColor);
  rect (0, menuY, sliderHeight, sliderHeight);

  if (mouseX >= 0 && mouseX <=sliderHeight&& mouseY >= menuY && mouseY <= menuY+sliderHeight)
  {
    menuColor = hover;
    if (mouseIsReleased == true)
    {
      if (showGUI == true) showGUI = false;
      else if (showGUI == false) showGUI = true;
    }
  } 
  else menuColor = out;
}

void createGUIPosition ()
{

  reihenX = map (reihen, 2, reihenMax, 0, sliderWidth);
  noiseAmountX = map (noiseAmount, 0, noiseAmountMax, 0, sliderWidth);
  windAmountX = map (windAmount, 0, windAmountMax, 0, sliderWidth);
  depthX = map (depth, 0, depthMax, 0, sliderWidth);
  highlightAmountX = map (highlightAmount,0, highlightAmountMax, 0, sliderWidth);
  hX = map (hAmount,0, hMax, 0, sliderWidth2);
  sX = map (s, 0, 100, 0, sliderWidth);
  if (showFill == true || showDots == true)
  {
    if (whiteBG == false) b2X = map (b2, 0, 2, 0, sliderWidth);
    else if (whiteBG == true)  b2X = map (b2, 0, 100, 0, sliderWidth);
  } 
  else b2X = map (b2, 0, 100, 0, sliderWidth);
  if (showFill == true || showDots == true)
  {
    if (whiteBG == false) aX =map(a, 0,255,0, sliderWidth );
    else aX = map(a, 0,2,0, sliderWidth);
  } 
  else aX =map(a, 0,255,0, sliderWidth);
  audioDepthX = map (audioDepth,0, audioDepthMax, 0, sliderWidth2);
}


