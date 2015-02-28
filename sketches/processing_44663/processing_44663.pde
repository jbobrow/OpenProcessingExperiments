
//EJ Posselius - Processing.3 - 2011.12.02 - v4.2

//import library for speaking to the serial port
import processing.serial.*;

//import arduino library
import cc.arduino.*;

//this variable tells processing which seral port your board is connected to
int port = 0;
int randD = 1;

//create arduino instance for each board you are speaking to
Arduino arduino;

//int dialX, dialY;
int x,y,d;

void setup () {
  size(800,800);
  //setup the arduino instance by stating the serial port you will be using and the speed of the communication
  //in this case, on my macBook Pro, the first port on the list located at slot 0 is where my USB cable is plugged in
  arduino = new Arduino(this, Arduino.list()[port], 57600);

  noStroke();    
  x=width/2;
  y=height/2;
  d = 10;  

  background(0);  
  smooth();
}

void draw () {
      
      fill(0,8);
      rect(0,0,width,height);
      
      
      randD = round((random(0,30)/10)*(arduino.analogRead(0)+arduino.analogRead(1))/2);
      d = round(map(randD,0,1023,0, 30));
      x = round(map(arduino.analogRead(0), 0,1023,0.01,width-(d/2)));
      y = round(map(arduino.analogRead(1), 0,1023,0.01,height-(d/2)));
      
      ellipseMode(CENTER);
   
      for(float i=0.; i<2*PI; i+=0.01) {

        float a = map(sin(i+x), -1., 1.,0,width-(d));
        float b = map(cos(i+y), -1., 1., 0, height-(d));
      
      fill(255);
      ellipse((d/2)+a,(d/2)+b,d,d);
      
        }    
        
}   
 

