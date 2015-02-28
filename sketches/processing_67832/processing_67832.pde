
import hypermedia.video.*;
import processing.video.*;
OpenCV opencv;
MovieMaker mm;
float threshold = 80f;
final int IMG_WIDTH  = 120;
final int IMG_HEIGHT = 90;
final int COLOR_SPACE = OpenCV.RGB;


void setup() {

  size(800, 600);
  mm = new MovieMaker(this, width, height, "Assignment3.mov", 10,
                       MovieMaker.H263, MovieMaker.HIGH);
  opencv = new OpenCV(this);
  opencv.capture(width, height);
}
void draw() {
  opencv.read();
  image(opencv.image(), 0, 0);
  mm.addFrame(); //make movie
  opencv_color(); // change effect by key
}

void opencv_color() {
  if (key=='0') {
    image(opencv.image(), 0, 0); //press 0, to orininal image
  }
  if (key == '1') {
    tint_b(); //press 1 become to blue
  }
  else if (key == '2') {
    tint_y(); //press 2 become to yellow
  }
  else if (key == '3') {
    tint_r(); //press 3 become to red
  }
  else if (key =='4') {
    tint_4(); // press 4 shuffle the color
  }
  else if (key =='5') {
    tint_5(); // mouse move change the bright
  }
  else if (key =='6') {
    key_6(); // mouse move change effect
  }
}

void tint_b() {  
  tint(0, 3, 199);
  image(opencv.image(), 0, 0);
}

void tint_y() {
  tint(255, 255, 0);
  image(opencv.image(), 0, 0);
}

void tint_r() {
  tint(227, 0, 0);
  image(opencv.image(), 0, 0);
}
void tint_4() {
  tint(int(random(225)), int(random(225)), int(random(225)));
  image(opencv.image(), 0, 0);
}
void tint_5() {
  tint (map(mouseX, 0, width, 0, 255), map(mouseX, 0, width, 0, 255), map(mouseX, 0, width, 0, 255));
  image(opencv.image(), 0, 0);
}
void key_6() {
  float value = 0;
  float otsu  = 0;
  opencv.read();
  if ( COLOR_SPACE!=OpenCV.RGB ) opencv.convert( COLOR_SPACE );
  opencv.restore( COLOR_SPACE );
  opencv.threshold( threshold, 255, OpenCV.THRESH_TOZERO_INV );
  threshold = map(mouseX, 0, width, 0, 255);
  image( opencv.image(), 0, 0 );
}




public void stop() { //stop all
  mm.finish();
  opencv.stop();
  super.stop();
}
