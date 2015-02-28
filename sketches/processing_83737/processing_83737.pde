
////////////////////////////////////////////////////////////////////////////GLOBAL VAR
PImage goldbutton;  
PImage bar2007;
PImage bar2008;
PImage bar2009;
PImage bar2010;
PImage bar2011;
PFont novecento;
boolean goldbuttonclick =false;  
boolean click2007 = false;  
boolean click2008 = false;
boolean click2009 = false;
boolean click2010 = false;
boolean click2011 = false;
int bar_y=385;  //bar_y+64 is the bottom of the 2007 button
int bar_x=60;
//////////////////////////////////////////////////////////////////////////END GLOBAL VAR

//////////////////////////////////////////////////////////////////////////////SETUP
void setup() {                                    
  smooth();
  size(1900, 910);  
  novecento = loadFont("novecento.vlw");  
  goldbutton = loadImage("goldbutton.png");  
  bar2007 = loadImage("bar2007.png");
  bar2008 = loadImage("bar2008.png");
  bar2009 = loadImage("bar2009.png");
  bar2010 = loadImage("bar2010.png");
  bar2011 = loadImage("bar2011.png");
}//////////////////////////////////////////////////////////////////////////END SETUP  



////////////////////////////////////////////////////////////////////////////BEGIN DRAW
void draw() {
  background(#E5E5DF);
  image (goldbutton, 60, 150);

  if (goldbuttonclick == true) {
    button2007();
    button2008();
    button2009();
    button2010();
    button2011();
  }

  if (click2007 == true) {
    data07();
  }

  if (click2008 == true) {
    data08();
  }

  if (click2009 == true) {
    data09();
  }

  if (click2010 == true) {
    data10();
  }

  if (click2011 == true) {
    data11();
  }
}/////////////////////////////////////////////////////////////////////////////END DRAW



/////////////////////////////////////////////////////////////////////////////BUTTON2007
void button2007() {
  image(bar2007, bar_x, bar_y);
}////////////////////////////////////////////////////////////////////////////END BUTTON2007

/////////////////////////////////////////////////////////////////////////////BUTTON2008
void button2008() {
  image(bar2008, bar_x, bar_y+80);
}////////////////////////////////////////////////////////////////////////////END BUTTON2008

/////////////////////////////////////////////////////////////////////////////BUTTON2009
void button2009() {
  image(bar2009, bar_x, bar_y+160);
}////////////////////////////////////////////////////////////////////////////END BUTTON2009

/////////////////////////////////////////////////////////////////////////////BUTTON2010
void button2010() {
  image(bar2010, bar_x, bar_y+240);
}////////////////////////////////////////////////////////////////////////////END BUTTON2010

/////////////////////////////////////////////////////////////////////////////BUTTON2011
void button2011() {
  image(bar2011, bar_x, bar_y+320);
}////////////////////////////////////////////////////////////////////////////END BUTTON2011

/////////////////////////////////////////////////////////////////////////////DATA07
void data07() {
  noStroke();
  fill(195, 176, 64);
  rect(bar_x+200, bar_y+34, 699, 30);
}////////////////////////////////////////////////////////////////////////////END DATA07

/////////////////////////////////////////////////////////////////////////////DATA08
void data08() {
  noStroke();
  fill(195, 176, 64);
  rect(bar_x+200, bar_y+113, 874, 30);
}////////////////////////////////////////////////////////////////////////////END DATA08

/////////////////////////////////////////////////////////////////////////////DATA09
void data09() {
  noStroke();
  fill(195, 176, 64);
  rect(bar_x+200, bar_y+192, 975, 30);
}////////////////////////////////////////////////////////////////////////////END DATA09

/////////////////////////////////////////////////////////////////////////////DATA10
void data10() {
  noStroke();
  fill(195, 176, 64);
  rect(bar_x+200, bar_y+271, 1227, 30);
}////////////////////////////////////////////////////////////////////////////END DATA10

/////////////////////////////////////////////////////////////////////////////DATA11
void data11() {
  noStroke();
  fill(195, 176, 64);
  rect(bar_x+200, bar_y+350, 1600, 30);
}////////////////////////////////////////////////////////////////////////////END DATA11




/////////////////////////////////////////////////////////////////////////////MOUSECLICKED
void mouseClicked() { //clicking in gold sets it to true
  if ((mouseX > 60 && mouseX < 243) && (mouseY > 150 && mouseY < 370)) {
    if (goldbuttonclick==true) {
      goldbuttonclick = false;
    }
    else {
      goldbuttonclick = true;
    }
  }//clicking within 2007 boundary, sets 'click2007' to true
  if ((mouseX > bar_x && mouseX < bar_x+182) && (mouseY> bar_y && mouseY<bar_y+64)) {
    if (click2007==true) {
      click2007=false;
    }
    else {
      click2007=true;
    }
  }
  if ((mouseX > bar_x && mouseX < bar_x+182) && (mouseY> bar_y+70 && mouseY<bar_y+143)) {
    if (click2008==true) {
      click2008=false;
    }
    else {
      click2008=true;
    }
  }


  if ((mouseX > bar_x && mouseX < bar_x+182) && (mouseY> bar_y+160 && mouseY<bar_y+226)) {
    if (click2009==true) {
      click2009=false;
    }
    else {
      click2009=true;
    }
  }

  if ((mouseX > bar_x && mouseX < bar_x+182) && (mouseY> bar_y+237 && mouseY<bar_y+305)) {
    if (click2010==true) {
      click2010=false;
    }
    else {
      click2010=true;
    }
  }


  if ((mouseX > bar_x && mouseX < bar_x+185) && (mouseY> bar_y+314 && mouseY<bar_y+390)) {
    if (click2011==true) {
      click2011=false;
    }
    else {
      click2011=true;
    }
  }
}/////////////////////////////////////////////////////////////////////////////END MOUSECLICKED  



////////////////////////////////////////////
//where you are + (total amount to move * a percentage)
////////////////////////////////////////////


