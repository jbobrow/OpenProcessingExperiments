
 import processing.serial.*;
 color fillVal = color(0,0,0); // set variable 'fillVal'
 Serial port;
 
 void setup() {
 size(100, 100);
 println("Available serial ports:");
 println(Serial.list());
 port = new Serial(this, Serial.list()[2], 9600);  
 }
 
 void draw() {
   background(0,0,0);
   if (keyPressed == true) { // if key is pressed
   fill(fillVal);
   ellipse(50, 50, 50, 50); 
   }
   else {
    keyReleased(); 
   }
 }

void keyPressed() {
     if (key == CODED) {
       if (keyCode == UP) {
         fillVal = color(255,255,255); // 'fillVal' = white
       } else if (keyCode == DOWN) {
         fillVal = color(255,0,0); // ... red
       } else if (keyCode == LEFT){
         fillVal = color(0,255,0); // ... green1
       } else if (keyCode == RIGHT) {
         fillVal = color(0,255,150); // ... green2      
       }
     } else {
    fillVal = 0;
  }
  port.write(keyCode);
  if (keyPressed == false) {
    port.write('0');
  }
}

void keyReleased() {
  port.write('0'); 

