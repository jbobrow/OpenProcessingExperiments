
/*
 * Creative Coding
 * Week 5, 02 - Digital Clock Exercise
 *
 * The sketch creates a digital clock that shows the current time in hours, minutes and seconds
 *
 * Source Image http://www.gadling.com/2013/10/21/texas-night-sky-photo/
 * Adam Baker Attribution-NonCommercial 2.0 Generic (CC BY-NC 2.0)
 * Repainted in GIMP to create day, dusk, night and dawn impressions.
 * Done with G'MIC filters and soft brush for painting and smudging.
 *
 * Position the time by dragging it, size the time by click on the screen but not on the time itself
 */
 /* @pjs preload="day.png, dusk.png, night.png, dawn.png"; */
 
PImage[] bg = new PImage[4];
boolean accel_time = false;
boolean debug = false;

void setup() {
  size(1024, 600);
  bg[0] = loadImage("night.png");
  bg[1] = loadImage("dawn.png");
  bg[2] = loadImage("day.png");
  bg[3] = loadImage("dusk.png");
  noStroke();
}

float counter = 0;
void draw() {
if (accel_time) {
  if (counter < 23*60+59) counter++;
  else counter=0;
  float hour = int(counter/60);
  float minute = int(counter%60);
  tint(255,255);
  image(bg[int(hour/6)],0,0);
  tint(255,map((hour%6)*60+minute,0,360,0,255));
  image(bg[(int(hour/6)+1)%4],0,0);
  if (debug) println("counter: "+counter+" hour:"+hour+ "minute:"+minute+" current bg:"+int(hour/6)+" overlay image:"+(int(hour/6)+1)%4+" at opacity:"+map((hour%6)*60+minute,0,360,0,255));
  drawTime(hour, minute, minute);
} else {
  tint(255,255);
  image(bg[int(hour()/6)],0,0);
  tint(255,map((hour()%6)*60+minute(),0,360,0,255));
  image(bg[(int(hour()/6)+1)%4],0,0);
  if(debug) println("current bg:"+int(hour()/6)+" overlay image:"+(int(hour()/6)+1)%4+" at opacity:"+map((hour()%6)*60+minute(),0,360,0,255));
  drawTime(hour(), minute(), second());
}
}

void keyPressed() {
  if (key == 'a') accel_time = !accel_time;
  if (key == 'd') debug = !debug;
}
/*
 * function to draw the time at a location x,y on the screen, keeping it in screen
 * allow the time to be moved using the mouse
 * allow the time to be resized between a minimum and maximum size
 *
 */

float x = 330, y = 100;
float text_s = 100;
PFont time_font = createFont("Times New Roman", text_s, true);
float text_w;
float text_h;
String timestring;

void drawTime(float hr, float min, float sec) {
  timestring = nf(hr,2)+":"+ nf(min,2) +":"+ nf(sec,2);
  int shadow = 3;
  textFont(time_font, text_s);
  text_w = textWidth(timestring);
  text_h = textAscent()*0.8;

  if (mousePressed && mouseInTimeBox()) {
    x = (mouseX > 0 && mouseX < (width - text_w)) ? mouseX : x;
    y = (mouseY > text_h && mouseY < height) ? mouseY : y;
    x = (x+text_w > width) ? width-text_w : x;
    y = (y-text_h < 0) ? text_h : y;
  } else {
    x = (x+text_w > width) ? width-text_w : x;
    y = (y-text_h < 0) ? text_h : y;
  }
  
  fill(0, 175);
  text(timestring, x + shadow, y + shadow);
  fill(255);
  text(timestring, x, y);
}

boolean mouseInTimeBox() {
  fill(#BB79FF, 125);
  arc(x,y,text_w*0.1,text_w*0.1,0,HALF_PI*3);
  if (mouseX >= x*0.8 && mouseX <= x+text_w && mouseY >= y*0.8-text_h && mouseY <= y+text_h)
  return true;
  else
  return false;
}

boolean mouseInBox(float bx, float by, float bw, float bh) {
  if (mouseX >= bx && mouseX <= bx+bw && mouseY >= by && mouseY <= by+bh)
  return true;
  else
  return false;
}

void mouseClicked(){
  if (!mouseInTimeBox()) {
    text_s = ceil((float(mouseX)/float(width))*200);
    if (text_s < 50) text_s = 50;
  }
}


