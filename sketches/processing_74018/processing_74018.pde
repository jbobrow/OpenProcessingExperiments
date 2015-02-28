
import processing.net.*; 
Client myClient; 
int dataIn; 
void setup() { 
  size(200, 200); 
      background(0, 0, 255);  
  // Connect to the local machine at port 5205.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "216.70.68.206", 5205); 
} 
 
void draw() { 
  if (myClient.available() > 0) { 
    dataIn = myClient.read(); 
  } 
if (dataIn == 1) { 
  //blink 
  background(255, 0, 0);
  
} 
} 
void mouseClicked() {
 dataIn = 0;
    }
