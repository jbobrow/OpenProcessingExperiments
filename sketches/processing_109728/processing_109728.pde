
int prevSecond; 
int lastRolloverTime; 

void setup(){
  size (400, 260); 
  lastRolloverTime = 0; 
}

void draw(){
  background(255); 
  
  //-------------------------------------------------
  // Fetch the components of the time (hours, minutes, seconds, milliseconds).
  // Incidentally, you can also get day(), month(), year(), etc. 
  int h = hour(); 
  int m = minute(); 
  int s = second(); 
  
  // The millis() are not synchronized with the clock time. 
  // Instead, the millis() represent the time since the program started. Grrr. 
  // To approximate the "clock millis", we have to check when the seconds roll over. 
  if (s != prevSecond){ 
    lastRolloverTime = millis(); 
  }
  int mils = millis() - lastRolloverTime;
  prevSecond = s;
  
  //-------------------------------------------------
  // Assemble a string to display the time conventionally.
  String hourStr   = nf(((h>12)? h-12:h), 2); // format String with 2 digits
  String minuteStr = nf(m, 2); // format String with 2 digits
  String secondStr = nf(s, 2); // format String with 2 digits
  String ampmStr   = (h < 12) ? "AM" : "PM"; 
  String milsStr   = nf(mils, 3); 
  String theTimeString = hourStr + ":" + minuteStr + ":" + secondStr; 
  theTimeString += "." + milsStr + " " + ampmStr; 
  
  fill (0); 
  textAlign (CENTER); 
  text (theTimeString, width/2, 30); 
  
  //-------------------------------------------------
  // Draw some rectangles which "abstractly" indicate the time. 

  float margin = 10;
  float rectWidth = width - 2*margin;
  float hw = map (h, 0,24,      0,rectWidth); 
  float sw = map (s, 0,60,      0,rectWidth); 
  float mw = map (m, 0,60,      0,rectWidth); 
  float ww = map (mils, 0,1000, 0,rectWidth); 
  
  // background (grey) rectangles
  fill (180); 
  rect (margin, 50, rectWidth,50);
  rect (margin,100, rectWidth,50); 
  rect (margin,150, rectWidth,50); 
  rect (margin,200, rectWidth,50); 
  
  // foreground (indicator) rectangles
  fill (255, 220, 20); 
  rect (margin, 50, hw,50);
  rect (margin,100, mw,50);
  rect (margin,150, sw,50);
  rect (margin,200, ww,50);
}
