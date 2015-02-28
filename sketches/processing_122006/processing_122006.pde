
Switch[] redSwitches = new Switch[8];
Switch[] greenSwitches = new Switch[8];
Switch[] blueSwitches = new Switch[8];
 
int redDecVal;
int greenDecVal;
int blueDecVal;
int redVal;
int greenVal;
int blueVal;
color c;
 
void setup() {
  size(625, 800);
  smooth();
  strokeWeight(3);
   
 
  for (int i = 0; i < redSwitches.length; i++) {
    redSwitches[i] = new Switch(20+i*60, 60, redSwitches.length-i-1);
  }
  for (int i = 0; i < greenSwitches.length; i++) {
    greenSwitches[i] = new Switch(20+i*60, 250, greenSwitches.length-i-1);
  }
  for (int i = 0; i < blueSwitches.length; i++) {
    blueSwitches[i] = new Switch(20+i*60, 440, blueSwitches.length-i-1);
  }
   
}
 
void draw() {
  background(255);
  redVal = redDecVal;
  greenVal = greenDecVal;
  blueVal = blueDecVal;
  c = color(redVal,greenVal,blueVal);
   
  fill(222);
  rect(10,35,605,147,10);
  rect(10,224,605,147,10);
  rect(10,415,605,147,10);
   
  fill(0);
  textSize(33);
  text("24Bit RGB Color Explained", 100, 29);
  // Draw red
  textSize(17);
  for (int i = 0; i < redSwitches.length; i++) {
    Switch rSwitch = redSwitches[i];
    rSwitch.display();
    if (rSwitch.on) {
      text((int)pow(2, rSwitch.binValue), rSwitch.x+14, rSwitch.y-6);
      text("1", rSwitch.x+16, rSwitch.y+119);
    }
    else {
      text("0", rSwitch.x+16, rSwitch.y-6);
      text("0", rSwitch.x+14, rSwitch.y+119);
    }
  }
  fill(0);
  text("Red Decimal Value = " + redDecVal, 20, 199);
  text("Red Hex Value = " + hex(redDecVal,2),20,219);
 
  text("Red Value",510,53);
  fill(redVal,0,0);
  rect(500,60,100,100);
   
  // Draw green
  for (int i = 0; i < greenSwitches.length; i++) {
    Switch gSwitch = greenSwitches[i];
    gSwitch.display();
    if (gSwitch.on) {
      text((int)pow(2, gSwitch.binValue), gSwitch.x+14, gSwitch.y-6);
      text("1", gSwitch.x+16, gSwitch.y+119);
    }
    else {
      text("0", gSwitch.x+16, gSwitch.y-6);
      text("0", gSwitch.x+14, gSwitch.y+119);
    }
  }
  fill(0);
  text("Green Decimal Value = " + greenDecVal, 20, 389);
  text("Green Hex Value = " + hex(greenDecVal,2),20,409);
  text("Green Value",500,243);
  fill(0,greenVal,0);
  rect(500,250,100,100);
   
  // Draw blue
  for (int i = 0; i < blueSwitches.length; i++) {
    Switch bSwitch = blueSwitches[i];
    bSwitch.display();
    if (bSwitch.on) {
      text((int)pow(2, bSwitch.binValue), bSwitch.x+14, bSwitch.y-6);
      text("1", bSwitch.x+16, bSwitch.y+119);
    }
    else {
      text("0", bSwitch.x+16, bSwitch.y-6);
      text("0", bSwitch.x+14, bSwitch.y+119);
    }
  }
  fill(0);
  text("Blue Decimal Value = " + blueDecVal, 20, 579);
  text("Blue Hex Value = " + hex(blueDecVal,2),20,599);
  fill(0,0,blueVal);
  rect(500,440,100,100);
  fill(0);
  text("Mixed RGB Value Visualized Below = " + redVal + " " + greenVal + " " + blueVal, 20,655);
  text("Mixed Hex Value = " + hex(c,6),20,635);
  text("Blue Value",510,433);
  fill(redVal,greenVal,blueVal);
  rect(20,660,580,100,10);
  textSize(12);
  fill(0);
  text("* Values above switches are decimal, values below are binary.",20,775);
  text("** There are 16,777,216 valid RGB colors!",20,789);
}
 
void mousePressed() {
  if (mouseY > 60 && mouseY < 160) {
    for (int i = 0; i < redSwitches.length; i++) {
      if (mouseX > 20+i*60 && mouseX < (i+1)*60) {
        redSwitches[i].on = !redSwitches[i].on;
        if (redSwitches[i].on) {
          redDecVal += (int)pow(2, redSwitches[i].binValue);//+(int)pow(2, redSwitches[i].binValue);
        }else {
          redDecVal -= (int)pow(2, redSwitches[i].binValue);//+(int)pow(2, redSwitches[i].binValue);
        }
      }
    }
  }
  if (mouseY > 250 && mouseY < 350) {
    for (int i = 0; i < greenSwitches.length; i++) {
      if (mouseX > 20+i*60 && mouseX < (i+1)*60) {
        greenSwitches[i].on = !greenSwitches[i].on;
        if (greenSwitches[i].on) {
          greenDecVal += (int)pow(2, greenSwitches[i].binValue);//+(int)pow(2, greenSwitches[i].binValue);
        }else {
          greenDecVal -= (int)pow(2, greenSwitches[i].binValue);//+(int)pow(2, greenSwitches[i].binValue);
        }
      }
    }
  }
  if (mouseY > 440 && mouseY < 540) {
    for (int i = 0; i < blueSwitches.length; i++) {
      if (mouseX > 20+i*60 && mouseX < (i+1)*60) {
        blueSwitches[i].on = !blueSwitches[i].on;
        if (blueSwitches[i].on) {
          blueDecVal += (int)pow(2, blueSwitches[i].binValue);//+(int)pow(2, blueSwitches[i].binValue);
        }else {
          blueDecVal -= (int)pow(2, blueSwitches[i].binValue);//+(int)pow(2, blueSwitches[i].binValue);
        }
      }
    }
  }
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
    rect(x, y, 40, 100,5);
    if (on) fill(100);
    else fill(50);
    rect(x, y+50, 40, 50,5);
    fill(225);
    if (on) text("ON", x+8, y+78);
    else text("OFF", x+6, y+30);
    fill(0);
  }
}

