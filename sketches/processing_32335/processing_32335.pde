
int h=750;
void setup() {
  background(0, 0, 0);
  PFont courier;
  courier=loadFont("CourierNewPSMT-90.vlw");
  size(900, h);
  stroke(255);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(80);
  textFont(courier);
}
float x=0.0;
float y=50.0;
void draw() {
  /*noLoop();
   loop();*/
  if (keyPressed) {
    if (keyCode!=SHIFT&&key!=BACKSPACE&&key!=TAB&&key!=DELETE&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=LEFT&&keyCode!=RIGHT&&keyCode!=ALT) {
      if (x==850) {//if text at end
        delay (175);//text delay
        //size(1500, h+=50);//increase height...not working
        text(key, 50, y+=100);
        x=50;
      }
      else {
        delay(175);//text delay
        text(key, x+=50, y);//move over 50 px
      }
      //else {
    }
  }
}


