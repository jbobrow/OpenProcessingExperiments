


//improting library
import controlP5.*;
ControlP5 cp5;
Slider2D s;

boolean  dragging = false;
//variables
float r = 90; 
float t = 0;
//float x, y;
float cnt;
float a =2.0;
float b=1.0;
float x;
float y;

//int lineCount=1000;
//PVector[] lissajousfigure=new PVector ;



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

  smooth();
}



void draw() {
  pushStyle();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  popStyle();



  for (float i=0.0;i<=5.0;i++) {

    x= 400*sin(PI*((s.arrayValue()[0])/20)*t);
    y=400*cos(PI*((s.arrayValue()[1])/20)*t);
    if (!(dragging==true)) {
      ellipse(x + width/2, y + height/2, 3, 3);
      dragging=false;
    }
    noStroke();
    fill(255, 255, 255, 80);

    t += 0.001;

    //    float y0 = cos(map(i-1, 0, s.arrayValue()[0], -PI, PI)) * s.arrayValue()[1]; 
    //    float y1 = cos(map(i, 0, s.arrayValue()[0], -PI, PI)) * s.arrayValue()[1];
  }


  //  float x = 100*sin(PI * a * t);
  //  y = (float)100*cos(b * t * PI);
}

void mousePressed() {
  dragging = true;
}

void mouseReleased() {
  dragging=false;
}


