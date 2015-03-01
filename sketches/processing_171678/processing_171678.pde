
/**
  Click and drag up and down to change the multiplier for the line length.
  The value mapped is an absolute that begins at halfway height.
  Click and drag left and right to change framerate, if that's your thing.
  
  Release to return it to default value.
  Right click to reset the screen. Right click will not activate dragging.
  
  This program is modular and can be edited to any window size. Seriously, edit that size() and see what happens.
*/
PGraphics rend;                         //Calls for a new non-visible place to draw on.
float divSig = 25;                      //Makes a new float for the lengthy line() multiplier process.
void setup(){                           //Setup program.
  size(600, 400, P2D);                  //New size is 600 pixels by 400 pixels.
  rend = createGraphics(width, height); //Sets the size of our offscreen area to the window size.
  imageMode(CORNER);
}

void draw(){                            //Draw to screen.
  rend.beginDraw();                     //Informs rend to begin drawing.
  rend.colorMode(RGB, 255);             //Informs rend to set the color mode to a pseudo-default.
  rend.background(0, 25);               //Informs rend to create a background of complete black and 25-part transparency.
  rend.colorMode(HSB, width, 255, 1.0); //Informs rend to set the color mode to a custom Hue-Saturation-Brightness.
  for(int x = 0; x < width; x ++){      //For loop. Creates local variable x, sets it to 0, asks if we have met the end of the screen, if no, run and add one, then repeat.
    float rand = randomGaussian();      //Creates a local float named rand that is a Gaussian value.
    rend.stroke(x, 255, abs(rand));     //Informs rend to set the stroke to the current x, maximum saturation, with an absolute gaussian value.
    int rerend = (rand < 0) ? height / 2 : (height / 2) + 1;//Creates a local interger named rerend, which asks if it's less than 0. if yes, rerend is half the height, if no, half the height plus 1.
    rend.line(x, rerend, x, rerend + (rand * (height / (height / divSig))));//Informs rend to draw a line, at x and rerend, to x and a value that is rand...
  }                                     //times our height as divided by our height as divided by our divSig. Has your head exploded yet? Trust me, it works.
  rend.endDraw();                       //Informs rend to end drawing.
  image(rend, 0, 0);                    //Draws to the screen rend, beginning at 0, 0.
  //println("divSig", divSig, "FrmRate", frameRate);//For debug purposes, prints to the console our divSig and framerate.
}

void mousePressed(){                    //Looks for a mouse pressed.
  if(mouseButton == RIGHT){             //If. If the mouse button pressed is the right...
    clear();                            //Clear everything.
  }
}

void mouseDragged(){                    //Looks for the mouse being dragged.
  if(!(mouseButton == RIGHT)){          //If. If the mouse button pressed is not the right...
    divSig = abs(mouseY - (height / 2));//divSig is now a absolute of our mouse Y, as minus our height divided by 2.
    frameRate(int(mouseX / (width / (width / 4)))); //Framerate becomes an weirdly calculated number, like our lines. Trust me, it works.
  }
}

void mouseReleased(){                   //Looks for the mouse being released.
  divSig = 25;                          //divSig is now the original number first set, 25. 
  frameRate(60);                        //Framerate is now the default, 60.
}


