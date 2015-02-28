
Switch[] theSwitches = new Switch[8];

void setup() {
  size(500, 200);
  strokeWeight(3);
  textSize(16);

  for (int i = 0; i < theSwitches.length; i++) {
    theSwitches[i] = new Switch(20+i*60, 40, theSwitches.length-i-1);
    //println(theSwitches.length-i-1); // Uncomment to see what it is doing
  }
}

void draw() {
  background(255);

  // An advantage of the loop is making a lot of if statements on general one :)
  for (int i = 0; i < theSwitches.length; i++) {
    // The current Switch of the loop (arbitraily named iSwitch)
    Switch iSwitch = theSwitches[i];

    iSwitch.display();

    if (iSwitch.on) {
      /* The part that says: (int)pow(2, iSwitch.binValue)
       produces the sequence of powers of two your switches represent
       pow(2, x) produces 2 to some power
       The (int) part shows it without decimal information */
      text((int)pow(2, iSwitch.binValue), iSwitch.x+14, iSwitch.y-6); 
      text("1", iSwitch.x+16, iSwitch.y+119);
    }
    else {
      text("0", iSwitch.x+16, iSwitch.y-6);
      text("0", iSwitch.x+14, iSwitch.y+119);
    }
  }

  // I moved these here so they are displayed once per frame
  fill(#FF1010);
  text("Decimal Value = Top Numbers Added Together", 80, 176);
  text("Binary value is represented by the 1's and 0's at the bottom...", 10, 196);
  fill(#1010BB);
  text("Counting in Binary... Click on the Switches", 120, 16);
}

class Switch {
  boolean on;
  int x, y, binValue;
  
  Switch(int inX, int inY, int inVal) {
    on = false;
    x = inX;
    y = inY;
    binValue = inVal;
  }
  
  void display() {
    if (on) fill(50);
    else fill(100);
    rect(x, y, 40, 100);
    if (on) fill(100);
    else fill(50);
    rect(x, y+50, 40, 50);
    fill(225);
    if (on) text("ON", x+10, y+78);
    else text("OFF", x+8, y+30);
    fill(0);
  }
}

void mousePressed() {
  if (mouseY > 40 && mouseY < 140) {
    for (int i = 0; i < theSwitches.length; i++) {
      if (mouseX > 20+i*60 && mouseX < (i+1)*60) {
        theSwitches[i].on = !theSwitches[i].on;
      }
    }
  }
}


