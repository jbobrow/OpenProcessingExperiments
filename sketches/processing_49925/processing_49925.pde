
//color selector
//karl clayton sluis, january 2012
 
import controlP5.*;
ControlP5 controlP5;
 
public int h1 = 0;
public int s1 = 50;
public int b1 = 50;
public int h2 = h1;
public int s2 = s1;
public int b2 = b1;
 
public boolean hueToggle = true;
public boolean satToggle = false;
public boolean briToggle = false;
 
public color primary, secondary;
 
Textlabel primaryLabel, secondaryLabel, title;
PFont font;
 
 
void setup () {
   
  size (800,638);
  smooth ();
  frameRate (30);
  colorMode (HSB,360,100,100);
  font = loadFont("Standard0757-8.vlw");
  textFont(font);
  controlP5 = new ControlP5(this);
   
  //dashboard
  controlP5.addSlider("h1",0,360,h1,200,450,400,25);
  Slider slider1 = (Slider)controlP5.controller("h1");
  slider1.setLabel(" Hue");
  controlP5.addSlider("s1",0,100,s1,200,500,400,25);
  Slider slider2 = (Slider)controlP5.controller("s1");
  slider2.setLabel(" Saturation");
  controlP5.addSlider("b1",0,100,b1,200,550,400,25);
  Slider slider3 = (Slider)controlP5.controller("b1");
  slider3.setLabel(" Brightness");
   
  controlP5.addToggle("hueToggle",true,50,450,100,25).setMode(ControlP5.SWITCH);
  Toggle toggle1 = (Toggle)controlP5.controller("hueToggle");
  toggle1.setLabel("Hue");
  controlP5.addToggle("satToggle",false,50,500,100,25).setMode(ControlP5.SWITCH);
  Toggle toggle2 = (Toggle)controlP5.controller("satToggle");
  toggle2.setLabel("Saturation");
  controlP5.addToggle("briToggle",false,50,550,100,25).setMode(ControlP5.SWITCH);
  Toggle toggle3 = (Toggle)controlP5.controller("briToggle");
  toggle3.setLabel("Brightness");
  
}
 
void draw () {
   
  background (0,0,5);
  stroke (0,0,100);
  color primary = color (h1,s1,b1);
  fill (primary);
  rect (50,50,350,350);
   
  //toggle logic
  if(hueToggle==true) {
    if (h1<180) {
      h2 = h1+180;
    } else {
      h2 = h1-180;
    }
  } else {
    h2 = h1;
  }
  if(satToggle==true) {
    s2 = 100 - s1;
  } else {
    s2 = s1;
  }
  if(briToggle==true) {
    b2 = 100 - b1;
  } else {
    b2 = b1;
  }
   
  color secondary = color (h2,s2,b2);
  fill (secondary);
  rect (400,50,350,350);
   
  //color control bars
  for (int i = 0; i < 400; i++) {
    stroke (i*0.9,100,100);
    line (200+i,475,200+i,488);
  }
  for (int i = 0; i < 400; i++) {
    stroke (h1,i*.25,b1);
    line (200+i,525,200+i,538);
  }
  for (int i = 0; i < 400; i++) {
    stroke (h1,s1,i*.25);
    line (200+i,575,200+i,588);
  }
   
  //color information
  noStroke ();
  fill (0,0,0,50);
  rect(50,350,350,50);
  rect(401,350,349,50);
 
  fill (0,0,100);
  text("HEX: #"+hex(primary,6),60,370);
  text("R:"+int(red(primary))+" G:"+int(green(primary))+" B:"+int(blue(primary)),60,380);
  text("H:"+int(hue(primary))+" S:"+int(saturation(primary))+" B:"+int(brightness(primary)),60,390);
  text("HEX: #"+hex(secondary,6),410,370);
  text("R:"+int(red(secondary))+" G:"+int(green(secondary))+" B:"+int(blue(secondary)),410,380);
  text("H:"+int(hue(secondary))+" S:"+int(saturation(secondary))+" B:"+int(brightness(secondary)),410,390);
  text("OPPOSITE",50,440);
  text("MATCH",100,440);
  text("BASE COLOR CONTROLS",200,440);
  textAlign(RIGHT);
  text("TWO COLORS",750,40);
  textAlign(LEFT);
   
}

/*
void hueToggle(boolean theFlag) {
  if(theFlag==true) {
    if (h1<180) {
      h2 = h1+180;
    } else {
      h2 = h1-180;
    }
  } else {
    h2 = h1;
  }
}
*/

