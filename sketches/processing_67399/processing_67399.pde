
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/67390*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

//importing library
import controlP5.*;
ControlP5 cp5;
Slider2D s;

boolean  dragging = false;
//variables
float r = 90; 
float t = 0;
float cnt;
float a =2.0;
float b=1.0;
float x;
float y;

void setup() {
  size(1000, 800);
  background(0);
  smooth();
  frameRate(100);

  cp5 = new ControlP5(this);
  s = cp5.addSlider2D("A/B")
    .setPosition(900, 700)
      .setSize(100, 100)
      .setArrayValue(new float[] {
        50, 50
      }
  );
}

void draw() {
  pushStyle();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  popStyle();

  for (float i=0.0;i<=5.0;i++) {
    println(x);
    x= 400*sin(PI*((s.arrayValue()[0])/20)*t);
    y=400*cos(PI*((s.arrayValue()[1])/20)*t);
    ellipse(x + width/2, y + height/2, 3, 3);
    noStroke();
    fill(255, 255, 255, 80);
    t += 0.001;
  }
}

