
//serial communication between processing and arduino 
 import processing.serial.*;
 
 PImage img;
 
 Serial myPort;        // The serial port
 int dataIn = 0;  //variable for sensor value from arduino
 
 //shape variables
 float ellipseX;
float ellipseY;
float ellipseWidth;
float ellipseHeight;
float r;
float g;
float b;
float alpha;
 
 void setup () {
 // set the window size:
 size(500, 500);        
 img = loadImage("blue_gradient_500.jpg");
 background(img);
 //background(0);
 smooth();
 // List all the available serial ports
 println(Serial.list());

 // the serial port used was #9
 myPort = new Serial(this, Serial.list()[9], 9600);

 
 }
 void draw () {
    size(500,500); 
    //read serial port value if it is available
    while (myPort.available() > 0) { 
    dataIn = myPort.read(); 
    //frameRate(50);
  }
  //if sensor value is more than 50
  if (dataIn > 50) {
   println("draw");
 // draw the squares:
 ellipseX = random(0, 500);
  ellipseY = random(0, 500);
 //ellipseWidth = random(0,50);
  //ellipseHeight = random(0,50);

 r = random(0,256);
 g = random(0,256);
 b = random(0,256);
 //alpha = random(50,250);

 fill(88,158,255,191);
 //fill(r,g,b, 191);
 noStroke();
  ellipse(ellipseX, ellipseY, 50, 50);
   
   filter( BLUR, 4);

  
 }
 
  println(dataIn);
 
 }
 


