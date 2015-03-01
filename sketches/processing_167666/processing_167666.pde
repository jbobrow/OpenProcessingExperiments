
/* @pjs font="ACaslonPro-Bold.ttf"; */

PFont font;
int opacity = 0;
int direction = 1;
int lastTime = 0;

void setup () {
  size (591,400);
//  font = loadFont("ACaslonPro-Bold-48.vlw");
font = createFont("ACaslonPro-Bold",48);
  textFont(font);
}

void draw() {
  fill(0,10);
  rect(0,0,width,height);
  fill(140,250,120,50);
  noStroke();
  
  
  if ((millis() - lastTime) > 500) {
    text("start", 290,250);
//    lastTime = millis();
  }
  
  if ((millis() - lastTime) > 1000) {
    text("at", 402,250);
//    lastTime = millis();
  }
  
  if ((millis() - lastTime) > 1500) {
    text("the", 460,250);
//    lastTime = millis();
  }
  
  if ((millis() - lastTime) > 2000) {
    fill(120,190,220,50);
    text("beginning", 62,250);
//    lastTime = millis();
  }
  
  if ((millis() - lastTime) > 3000) {
    lastTime = millis();
  }
  

}


