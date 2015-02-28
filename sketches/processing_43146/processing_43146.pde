
class Button {
  //locations
  float x; //x location
  float y; //y location
  color c; //fill color
  float a; //alpha value
  boolean correct; //correct button
  boolean fade;
  boolean rollover; //rollover effect 
  
  int state = 0;

  Button (float tempX, float tempY) {
    x = tempX;
    y = tempY;
    correct = false; // all buttons set to unknown
    fade = false;
    rollover = false; //no rollover until mouse starts moving
    a = 255; //initial alpha value = full
  }
  
    void display () { //display the squares
    noStroke();
    fill(c);
    rect(x, y, 25, 25);
    
    //displays colors for squares  
    if (state == 3) { 
      c = color (21, 178, 2, a);
      //a = a-2;  //turns square green
    } 
    else if (state == 2) {
      c = color (255, 0, 0, a); //turns square red
    } 
    else if (rollover) {
      c = color (61, 86, 147, a); //gets darker when rolled over
    } 
    else {
      c = color (121, 145, 203, a); //regular color for squares
    }
    
    if (fade) {
      a = a-5;
    }
  }
  
  boolean clicked () { //establishes when wrong = true
    if (mouseX>=x && mouseX <= x+25 && mouseY >=y && mouseY <=y+25) {
      return true;
    } else {
      return false;
    }
  }
  
  void rollover () { //establishes when rollover function occurs
    if (mouseX>=x && mouseX <= x+25 && mouseY >=y && mouseY <=y+25) {
      rollover = true;
    } else {
      rollover = false;
    }
  }
}

