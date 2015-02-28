
import processing.serial.*;


Serial myPort;                       // The serial port
boolean firstContact = false;         // Whether we've heard from the microcontroller
int stretch;                        // Size of the circle

void setup() {
  size(600, 600);
  noStroke();
  fill(255, 255, 70, 50);
  println(Serial.list());

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(23,121,255);
  

  //two rectangles get closer and farther away
    for (int i = 15; i <570; i += 60){
    for (int j = 15; j <570; j +=60){
rect(stretch+i,j, 30,30);
rect(-stretch+i, j, 30,30);
rect(stretch+i, stretch+j, 30,30);
rect(-stretch+i, stretch+j, 30,30);
rect(stretch+i, -stretch+j, 30,30);
rect(-stretch+i, -stretch+j, 30,30);
rect(i, stretch+j, 30,30);
rect(i, -stretch+j, 30,30);

    }
    }
 }
void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  if (firstContact == false) {
    if (inByte == 'A') { 
      myPort.clear();          
      firstContact = true;    
      myPort.write('A');      
    }
  } 
  else {

    stretch = inByte;
    println(stretch);
    myPort.write('A');
  }
}


