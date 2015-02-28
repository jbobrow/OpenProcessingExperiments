
/*

NOTE: THIS CODE MUST RUN USING PROCESSING ON YOUR DESKTOP!

You must also install the parallel port library first - see the project instructions on mr.cordiner.com

Finally you must have built your interface circuit before this can do anything useful. 

*/

import techne.portIO.*;
parportIO port; // Creates a parportIO object for interfacing with the parallel port
int counter=0;

void setup(){
  size(200,200);
  
  port = new parportIO();
  port.writePin(2,1); 
  // this is pin 2 which is D0, a data output pin
  
}

void draw() {

  rect(10,10,10,10);
  
  // this will flash an LED connected to your D0 / pin 2 line
  counter++;
  if (counter > 100) {
    counter = 0;
    port.writePin(2,1);
  } else if (counter > 50) {
    port.writePin(2,0);
  }
  
}
