
// week 2 touching rainbow squares

// copy this V
import java.util.Date;
import java.text.*;

String catName = "Bagels";
SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd-HH-mm-ss-SSS"); // 24 hr time w/ msec
// copy that ^ for save file

void setup () {
  size (500, 500);
  colorMode (HSB, 360, 100, 100);
  rectMode (CENTER); // rect is center of size
  frameRate (80);
}
float noiseIncrement = 0.01;
void draw () {
  background (128); //erases the frame everytime
  int rectColor = 0; // hue angle
  int i = 0; // counting 
  
  
for (i=0; i<10; i=i+1) {
  //int randomColor = (int) random (0, 36);
  float randomColor = 36.0*noise (noiseIncrement); // noise is between 0 and 1
  noiseIncrement = noiseIncrement+ 0.01;
  fill (i*36+randomColor, 100, 100);
  radiusRect (width/2, height/2, randomColor*8, 10, i);}
}

void radiusRect (float x, float y, float radius, int nrects, int rectNum) {
  float angle = TWO_PI / nrects; //basic angular increments
  float a = angle * rectNum; //total angle for rects
  
  // location of rect center
  float sx = x + cos(a) * radius;
  float sy = y + sin(a) * radius;
    
  //draw rect
  rect (sx, sy, 25, 25); //sx and sy is center
}

void keyPressed() {
  if (key=='s' || key=='S') saveFrame(timeStamp(catName)+".jpg");
}

String timeStamp (String filename) {
  Date dNow = new Date( );
  return filename + "_" + ft.format(dNow);}


