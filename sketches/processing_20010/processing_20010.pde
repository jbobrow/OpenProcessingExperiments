
// make the rollover rectangle a button that you need to 
// click to turn on or off
// basically we're making the logical equivalent of a light switch.

// use a boolean (true/false) variable to keep track of 
// the state of our imaginary switch.
boolean on = false;

int btnX = 50;
int btnY = 50;
int btnW = 100;
int btnH = 100; 

//-------------------------------------------------------
void setup() {
  size(400, 400);
  noStroke();
}

//-------------------------------------------------------
void draw() { 
  // keep looking at the boolean variable to decide on the 
  // background color 
  if (on == true) {
    background(255);  
  }
  else {
    background(0);  
  }
   
  // draw something else
  fill(0);
  ellipse(mouseX, mouseY, 50, 50);
  
    // draw the rollover area
  fill(128);
  rect(btnX, btnY, btnW, btnH);    
}

//-------------------------------------------------------
void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    // toggle the value of 'on'
    // in other words, if on == true, then on becomes not true (false) and
    // vice versa
    on = !on;   // on = (not)on
  }
}
