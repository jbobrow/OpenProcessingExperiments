
/**
 * spxlTwoDigitInput
 * 2010-02-04 by subpixel
 * http://subpixels.com
 *
 * Use keyboard input to control a numeric parameter
 * Single digit entry gets "simple" value (eg 10, 20, 30, ...)
 * Two digit entry gets "refined" value (eg 03, 25, 99)
 * '0' and '00' are treated as 100
 */

String inputStr = "";
int inputVal = 100;
long lastDigitTime = 0;

// Sequence of digits allowed with up to
// this many milliseconds between keypresses
long entrySeparation = 400;

int fontSize = 20;
int tx, ty; // Text location used in txt()

void setup()
{
  size(400, 400);
  textFont(createFont("", fontSize)); // default font
  ellipseMode(RADIUS);
  noCursor();
}

void draw()
{
  background(0);
  
  fill(255);

  tx = fontSize;
  ty = fontSize * 2;
  
  txt("Use digits to set radius:");
  txt("- Single digit sets 10, 20, 30, ... 100");
  txt("- Two digits sets 01, 02, 03, ... 99");
  txt("");
  txt("UP and DOWN adjust radius");
  txt("");
  txt("inputStr: [" + inputStr + "]");
  txt("inputVal:  " + inputVal);
  
  translate(mouseX, mouseY);

  stroke(255, 0, 0);
  
  line(-110, 0, 110, 0);
  line(0, -110, 0, 110);
  
  int tickWidth = 2;
  for (int tick = -100; tick <=100; tick += 10)
  {
    if (tick == 0) continue;
    
    line(-tickWidth, tick, tickWidth, tick); // y-axis ticks
    line(tick, -tickWidth, tick, tickWidth); // x-axis ticks
  }
  

  stroke(255);
  noFill();
  ellipse(0, 0, inputVal, inputVal);
}

// Utility on-screen text printing method
void txt(String s)
{
  text(s, tx, ty);
  ty += fontSize;
}

void keyPressed()
{
  long time = millis();
  println("keyPressed(): key: [" + key + "]");
  
  if (key == CODED)
  {
    switch(keyCode)
    {
      case UP:   inputVal += 1; break;
      case DOWN: inputVal -= 1; break;
    }
    inputVal = constrain(inputVal, 01, 100);
  }
  else if (Character.isDigit(key))
  {
    int digit = Character.digit(key, 10); // base 10 numbering
    println("Digit! " + digit);
    
    if (time - lastDigitTime > entrySeparation)
    {
      inputStr = "";
    }
    else if (inputStr.length() > 1)
    {
      inputStr = inputStr.substring(1);
    }
    
    inputStr += key;
    lastDigitTime = time;

    // And now to interpret the "vlaue"
    if (inputStr.length() == 1)
      inputVal = digit * 10;
    else
      inputVal = Integer.parseInt(inputStr);
    
    // Special case: 0 -> 100
    if (inputVal == 0) inputVal = 100;
  }
}


