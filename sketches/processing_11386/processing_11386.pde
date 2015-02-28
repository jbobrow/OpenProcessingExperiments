
void mouseReleased ()
{
  if (mouseX >= sliderX && mouseX <= sliderWidth + sliderX && mouseY >= sliderY && mouseY <= sliderY + sliderHeight) mouseIsReleased = true;
}

void keyPressed ()
{
  if (keyCode == KeyEvent.VK_Q) lightX -= 10;
  if (keyCode == KeyEvent.VK_W) lightX += 10;
  if (keyCode == KeyEvent.VK_A) lightY -= 10;
  if (keyCode == KeyEvent.VK_S) lightY += 10;
  if (keyCode == KeyEvent.VK_Y) lightZ -= 10;
  if (keyCode == KeyEvent.VK_X) lightZ += 10;
  //println ("X:" + lightX + " Y:" + lightY + " Z:" + lightZ);

  if (keyCode == KeyEvent.VK_ALT)
  {
    if (blackBG == true) blackBG = false;
    else if (blackBG == false) blackBG = true;
  }
  if (keyCode == KeyEvent.VK_E) {
    res -= 10;
    res = constrain (res, -startResolution+10,100);
    setSetup();
    setupDotList();
    createDotsOne();
  }
  if (keyCode == KeyEvent.VK_R)
  {
    res += 10;
    res = constrain (res, -startResolution+10,100);
    setSetup();
    setupDotList();
    createDotsOne();
  }

  
  if (keyCode == KeyEvent.VK_SPACE)
  {
    if (showImage == false) showImage = true;
    else if (showImage == true) showImage = false;
  } 

  if (keyCode == KeyEvent.VK_C)
  {
    if (showImageColor == false) showImageColor = true;
    else if (showImageColor == true) showImageColor = false;
  } 

  if (keyCode == KeyEvent.VK_V)
  {
    if (showGrid == false) showGrid = true;
    else if (showGrid == true) showGrid = false;
  }

  if (keyCode == KeyEvent.VK_MINUS) 
  {
    reloadImage ();
    blur -= 0.3;
    blur = constrain (blur, 1,6);
    img_01.filter (BLUR, blur);
    img_02.filter (BLUR, blur);
    createDotsOne();
    createDotsTwo();
  } 


  if (keyCode == KeyEvent.VK_PLUS) 
  {
    reloadImage ();
    blur += 0.3;
    blur = constrain (blur, 1,6);
    img_01.filter (BLUR, blur);
    img_02.filter (BLUR, blur);
    createDotsOne();
    createDotsTwo();
  } 

  if (keyCode == KeyEvent.VK_RIGHT) schwellenwert += 1;
  if (keyCode == KeyEvent.VK_LEFT) schwellenwert -= 1;

  schwellenwert = constrain (schwellenwert, 1,254);


// Position------------------------------------------------------------------------
    if (keyCode == KeyEvent.VK_DOWN) 
    {
      positionFactor -= 0.15;
      positionFactor = constrain (positionFactor, 0,maxPositionFactor);
      sliderPos = positionFactor*sliderFactor;
    }

    if (keyCode == KeyEvent.VK_UP) 
    {
      positionFactor += 0.15;
      positionFactor = constrain (positionFactor, 0,maxPositionFactor);
      sliderPos = positionFactor*sliderFactor;
    }
}









