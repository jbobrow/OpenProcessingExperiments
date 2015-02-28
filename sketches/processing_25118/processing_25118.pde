
void setup() {
  size(200, 200);
  // textAlign(horizontal, vertical)
  textAlign(CENTER, BASELINE);
  textSize(100); // in pixels 
  fill(0); // fill changes the text color
}

void draw() {      
  // key == coded when you press SHIFT, ALT, CTRL or OPTION
  // these keys don't have characters associated with them so 
  // we will avoid displaying them altogether using this 
  // conditional statement 
  if (key != CODED) {  
    background(255);
    
    // center (x,y) point       
    float x = width/2;
    float y = height/2;

    stroke(128);
    line(0, y, width, y);
    line(x, 0, x, height);
    
    // shift "y" a little bit to center the text a little better
    text(key, x, y+35);    
  }
}



