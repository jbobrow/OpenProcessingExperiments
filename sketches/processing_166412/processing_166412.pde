
import processing.sound.*;

AudioIn input;
Amplitude rms;
Metronomy[] notes = new Metronomy[51];
float rotate;
import processing.serial.*;
Serial myPort;  
float angle;
float Rx, Ry;
float d;
float a, b;
int x, y;
int h, w;
boolean firstContact = false;
float xDegree, yDegree;        // Starting position of the ball
int buttonState;
int buttonStateN;
void setup() {
  size(1080, 720);
  // background(0);
  String portName = "/dev/tty.usbmodem1421";
  // myPort = new Serial(this, portName, 115200);
  for (int n = 0; n < notes.length; n++) {
    notes[n] = new Metronomy(0, random(width), random(height));
    // notes[n] = new Metronomy(0, 100,100);
    rotate = 0.2;
  }

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  // start the Audio Input
  input.play();
  // create a new Amplitude analyzer
  rms = new Amplitude(this);
  // Patch the input to an volume analyzer
  rms.input(input);
}      
// float noiseScale=0.02;

void draw() {
  // background(247,239,240);
  // background(0);
  fill(0, 0, 0, 20); //drawing this rect alpha creates the trails
  rect(0, 0, width, height);

  float scale = 2;


  scale=int(map(rms.analyze(), 0, 0.5, 1, 200));

  for (int n = 0; n < notes.length; n++) {
    float altscale = int(map(rms.analyze(), 0, 0.5, 1, 200)); 
    notes[n].display(altscale); //displays random white circles
    notes[n].move();
  }

  fill(230, 0, 250, 10);
  // We draw an ellipse coupled to the audio analysis

  float Rx = 10;
  float Ry = 10;

  for (int i = 0; i<3; i++) {
    noStroke();
    fill(54, 198, 244, 44);
    ellipse(width/2, height/2, i+scale, i+scale);
  }

  println(xDegree, yDegree, buttonState);

  rotate+= .001;
  // rotate += map(rms.analyze(), 0, 0.5, .0001, 1);
}

void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  // if you got any bytes other than the linefeed:
  if (myString != null) {

    myString = trim(myString);

    // if you haven't heard from the microncontroller yet, listen:
    if (firstContact == false) {
      if (myString.equals("hello")) {
        myPort.clear();          // clear the serial port buffer
        firstContact = true;     // you've had first contact from the microcontroller
        myPort.write('A');       // ask for more
      }
    }
    // if you have heard from the microcontroller, proceed:
    else {
      // split the string at the commas
      // and convert the sections into integers:
      int sensors[] = int(split(myString, ','));

      // print out the values you got:
      for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
        //    print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
      }
      // add a linefeed after all the sensor values are printed:
      println();

      //println(xpos,ypos);

      if (sensors.length > 1) {
        xDegree = map(sensors[0], 270, 420, 0, width);
        yDegree = map(sensors[1], 270, 420, 0, height);
        // buttonStateN = sensors[3];
      }
    }
    // when you've parsed the data you have, ask for more:
    myPort.write("A");
  }
}
class Metronomy {
  float scale = 10;
  float x, y;
  float altscale;

  Metronomy(float tempScale, float tempX, float tempY) {
    scale = tempScale;
    x = tempX;
    y = tempY;
  }

  void display(float altscale) {
    float offsetx = map(altscale, 1, 150, 1, x-width/2);
    float offsety = map(altscale, 1, 150, 1, y-height/2);
    pushMatrix();
    translate(width/2, height/2);
    rotate(rotate);
    stroke(255, 100);

    // line(0, 0, x-width/2, y-height/2); 
    line(0, 0, offsetx, offsety); 

    noStroke();
    // fill(random(200, 255), random(200, 255), random(200, 255), 100);
    // fill(255, 50);
    fill(147, 206, 250, 10);
    ellipseMode(CENTER);
    ellipse(x-width/2, y-height/2, altscale, altscale);

    popMatrix();
  }


  void move() {
    // x = x + random(-1, 1);
    // y = y + random(-1, 1);

    // x = x--;
    // y = y--;
  }
}


