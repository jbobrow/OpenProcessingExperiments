
/*

 Information on spirograph mathematics & functions obtained here:
 http://yourideahere.umbc.edu/ARTISTS/jamesdaly/Spirograph/SpiroGraph.html
 
 "A Spirograph is formed by rolling a circle inside or outside of another circle. The pen is placed at any point on the rolling circle. If the radius of fixed circle is R, the radius of moving circle is r, and the offset of the pen point in the moving circle is O, then the equation of the resulting curve is defined by:
 
 x = (R+r)*cos(t) - (r+O)*cos(((R+r)/r)*t) 
 y = (R+r)*sin(t) - (r+O)*sin(((R+r)/r)*t)"
 
 */


// Import Libs
import processing.pdf.*;
import processing.serial.*;

// Vars for spirograph
float r;
float R;
float O;

int resolution = 2000;

// Inputs from Arduino
int pot1;
int pot2;
int pot3;
int pr;
int button;


// Other program stuff
PFont font;
Serial port;

void setup() {

  colorMode(HSB, 360, 100, 100);
  fill(0, 0, 100);
  smooth();

  size(displayWidth, displayHeight);

  font = loadFont("Raleway-Thin-80.vlw");
  textFont(font, 32);

  port = new Serial(this, Serial.list()[4], 9600);
  port.bufferUntil('\n');
}

void draw() {

  if (keyPressed && key == 'r')
    beginRecord(PDF, "spiro-"+frameCount+".pdf");

  background(0, 0, 0);

  //  r = map(mouseX, 0, width, 0, 1);
  //  R = map(mouseY, 0, height, 100, 200);
  //  O = map(mouseX+mouseY, 0, width+height, 10, 100);


  r = map(pot1, 0, 1023, 0, 1);
  R = map(pot2, 0, 1023, 50, 300);
  //O = map(pot3, 0, 1023, 100, 200);
  O = 100;

  text("R: " + R, 10, 30);
  text("r: " + r, 10, 60);
  text("O: " + O, 10, 90);

  if (button == 1) {


    float px = 0;
    float py = 0;

    translate(width/2, height/2);
    rotate(millis()/100);

    float noise = noise(millis());
    noise = map(noise, 0, 1, -2, 2);
    translate(noise, noise);

    //    int mill = millis();
    //
    //    if ((mill - programCounter) < 1500) {
    //      float mapped = map(mill, 0, 1500, 0, 1);
    //      mapped = (float) Math.pow(mapped, 4);
    //      println(mapped);
    //      scale(mapped);
    //    }

    //stroke(millis() / 50 % 360, 80, 80);
    stroke(map(pr, 250, 120, 0, 360), 80, 80);

    for (int i = 0; i < resolution; i++) {
      //for (int i = 0; i < TWO_PI; i+= 0.1) {
      float theta = map(i, 0, resolution, 0, TWO_PI);

      float x = (R+r)*cos(theta) - (r+O)*cos(((R+r)/r)*theta);
      float y = (R+r)*sin(theta) - (r+O)*sin(((R+r)/r)*theta);

      //point (x, y);
      if (px != 0 && py != 0)
        line(x, y, px, py);

      px = x;
      py = y;
    }
  }

  if (keyPressed && key == 'r')
    endRecord();
}

void serialEvent(Serial port) { 

  String data = port.readStringUntil('\n');
  println(data);
  int values[] = int(split(data, ","));
  println(values);

  if (values.length == 5) {
    pot1 = values[0];
    pot2 = values[1];
//    pot3 = values[2];
    pr = values[2];
    button = values[3];
  }
} 

boolean sketchFullScreen() {
  return true;
}
