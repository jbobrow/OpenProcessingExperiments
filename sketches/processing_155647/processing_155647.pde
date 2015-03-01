
import processing.serial.*;

Serial serialPort;

String inString;

void setup() {
  
  size(600, 400);
  background(0);
  
  serialPort = new Serial(this, Serial.list()[1], 9600);
  serialPort.bufferUntil('\n');
  
  background(0); 
  
}

void draw() {
  
}


void serialEvent(Serial serialPort) {
 inString = serialPort.readStringUntil('\n'); 
 
 //println (inString);
 
 int Flat = inString.indexOf("F");
 int Right = inString.indexOf("R");
 int Left = inString.indexOf("L");
 int Up = inString.indexOf("U");
 int Down = inString.indexOf("D");
 
 if (Flat != -1) {
  println("FLAT");
  fill(125,255,5);
  rect(100, 81, 63, 63);  
}  
   else if (Flat != 1) {
   println("FLATNO");
   fill(0,0,0);
   rect(100, 81, 63, 63);
 }
 
   if (Right != -1) {
   println("RIGHT");
   fill(255,5,5);
   rect(200, 81, 63, 63);
   }
   
  else if (Right!= 1) {
  println("RIGTHNO"); 
   fill(0);
   rect(200, 81, 63, 63);  
  }
      
    if (Left != -1) {
   println("LEFT");
   fill(5,11,255);
   rect(300, 81, 63, 63);
    }
    else if (Left != 1) {
   println("NOLEFT");
   fill(0);
   rect(300, 81, 63, 63);
    }
      
// } else if (Up != -1) {
//  println("UP");
     
  if (Down != -1) {
   println("DOWN");
   fill(254,255,5);
   rect(400, 81, 63, 63);
 }
   else if (Down != 1) {
   println("NODOWN");   
   fill(0);
   rect(400, 81, 63, 63);
 }
}


