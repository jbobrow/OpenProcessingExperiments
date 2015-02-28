
PFont font;

int ypos;
int xpos;
int opa;
int inc;
color col;
boolean el;


void setup () {
  col = color (234, 52, 232);
  font = loadFont ("font.vlw"); // contained within data folder. tools > create font
  size (1000, 100); // long banner shape page
  smooth (); // smooth so that text and shapes look clearer
  textSize (60); // text size is 60
  ypos=70; // y position is 70
  frameRate (120); // framerate is equal to 120
  el = false;
}


void draw () {
  background (255); // white background
  if (el == true) {
    col = color (int(random(255)), int(random(255)), int(random(255)));
    el = false;
  }
  inc++; // add 1 to inc
  xpos=inc/12;
  opa=mouseY*2;
  if (mousePressed) {
    inc = 0;
    el = true;
  }
  if(inc>900){
    fill(col,80); // col is equal to 3 integer variables so can use this instead
    inc = 900;
    stroke(255); // make stroke colour white
    ellipse(xpos*10, ypos-10, 25, 25);
  }
  else {
    fill(127, 80);
    ellipse (mouseX, mouseY, 25, 25);
  }
  
  fill(col, opa);
  text("A", 2*xpos, ypos);
  text("M", 3*xpos, ypos);
  text("A", 4*xpos, ypos);
  text("N", 5*xpos, ypos);
  text("D", 6*xpos, ypos);
  text("A", 7*xpos, ypos); // increasing number before xpos makes letter go faster
}


