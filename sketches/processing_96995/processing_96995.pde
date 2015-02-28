


import processing.serial.*;

int bgcolor;           // Background color
int fgcolor;           // Fill color
Serial myPort;                       // The serial port
int[] serialInArray = new int[3];    // Where we'll put what we receive
int serialCount = 0;                 // A count of how many bytes we receive
int xpos, ypos;                 // Starting position of the ball
boolean firstContact = false;        // Whether we've heard from the microcontroller

import ddf.minim.*;
Minim minim;
//AudioPlayer player;
AudioSample buzzer;

void setup() {
  size(500, 550, P3D);  // I had to make this P3D to make the audio play
  // because unlike 'player' 'AudioSample' uploads the track to the applet
  // so it uses more memory going to get the track each time it's needed like
  // player.
  noStroke();      
  minim = new Minim(this);
//  player = minim.loadFile("buzzer.wav");
buzzer = minim.loadSample("buzzer.wav", 512);
textFont (createFont ("Monospaced-48", 24));

  // Set the starting position of the ball (middle of the stage would be
  // width/2 for both x and y)
  xpos = 100; // I want my ball to start at this starting position. 
  ypos = 100;

  // Print a list of the serial ports, for debugging purposes:
  println(Serial.list());

  String portName = Serial.list()[4];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  int x = mouseX; // I was trying to make it work by getting the colour
  int y = mouseY; // and using that to make a change.
  fill (255, 255, 255);
  text ("Buzzer Challenge", 100, 400);

  fill(162, 18, 224);
  ellipse(xpos, ypos, 20, 20);


  background(229, 252, 249);
  //fill(fgcolor);
  // Draw the shape
  fill(80, 46, 27);
  rect(40, 90, 50, 20);
  rect(20, 480, 460, 50);
  rect(50, 25, 15, 470);
  rect(445, 25, 15, 470);
  rect(430, 90, 50, 20);


  fill(101, 121, 245);
  ellipse(100, 100, 50, 50);
  ellipse(410, 100, 50, 50);

  rect(100, 100, 5, 150); // 1
  rect(100, 250, 100, 5); // 2
  rect(200, 250, 5, 50);
  rect(130, 300, 75, 5);
  rect(130, 300, 5, 155);
  rect(130, 455, 270, 5);
  rect(400, 330, 5, 130);
  rect(360, 330, 40, 5);
  rect(360, 330, 5, 100);
  rect(205, 430, 160, 5);
  rect(205, 400, 5, 30);
  rect(205, 400, 30, 5);
  rect(235, 325, 5, 80);
  rect(235, 325, 60, 5);
  rect(295, 250, 5, 80);
  rect(295, 250, 80, 5);
  rect(370, 180, 5, 75);
  rect(165, 180, 210, 5);
  rect(165, 100, 5, 80);
  rect(165, 100, 250, 5);

  color c = #6579F5; // The colour value of the path, Needs to be in the 
  // hexidecimal value to work.
  color d = get(xpos, ypos); // xpos and ypos of the potentiometer, rather
  // than the mouse. This detects or 'gets' the colour value of the location
  // of the potentiometer.
  fill(d);
  ellipse (xpos, ypos, 20, 20);

  if (c == d) buzzer.trigger(); // I think this means if this is true?
    //within line
   
   // player.rewind();

//  else {    
    
   // buzzer.trigger();
    //player.play(); 
    //outside line
    
//  }
  if (c == d) {  // To get the circle to change colour when not on the path
    buzzer.trigger();
    fill(162, 18, 224);
    ellipse (xpos, ypos, 20, 20);
  }
  else {
    fill(245, 49, 10);
    ellipse(xpos, ypos, 20, 20);
  }
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  // if this is the first byte received, and it's an A,
  // clear the serial buffer and note that you've
  // had first contact from the microcontroller. 
  // Otherwise, add the incoming byte to the array:
  if (firstContact == false) {
    if (inByte == 'A') { 
      myPort.clear();          // clear the serial port buffer
      firstContact = true;     // you've had first contact from the microcontroller
      myPort.write('A');       // ask for more
    }
  } 
  else {
    // Add the latest byte from the serial port to array:
    serialInArray[serialCount] = inByte;
    serialCount++;

    // If we have 3 bytes:
    if (serialCount > 2 ) {
      xpos = int(map(serialInArray[0], 0, 255, 0, width));
      ypos = int(map(serialInArray[1], 0, 255, 0, height)); // changing this means
      // that the xpos was mapping from 0 to 255 but now I want it to 
      // from 0 to the full width.. this data MIGHT result in a decimal
      // so above setup you need to change it from an integer to a float!
      fgcolor = serialInArray[2];

      // print the values (for debugging purposes only):
      println(xpos + "\t" + ypos + "\t" + fgcolor);// TURN ME BACK ON!

      // Send a capital A to request new sensor readings:
      myPort.write('A');
      // Reset serialCount:
      serialCount = 0;
    }
  }
}



