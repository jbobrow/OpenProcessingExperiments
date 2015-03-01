
/********************************************************************
*                  **ADVANCED CHAT CLIENT**                         *
*                                                                   *
* By: Jonah Boe                                                     *
*                                                                   *
* NOTE:                                                             *
* This program is the client for chatting/drawing between two       *
* computers. I do realize that so many universal variables is       * 
* undesierable, and makes it look bad, but it's to much of a small  *
* project for me to feel bad about it hahaha.                       *
*                                                                   *
* Not all code is my own, and therfore all of the fallowing is      *
* open source. However, I do follow my own format, so sorry if this *
* jumble is confusing to anyone.                                    *
*                                                                   *
* HOPE YOU ENJOY!!!!!                                               *
********************************************************************/


import netscape.javascript.*;

// Import internet library and set up
import processing.net.*; 
Client myClient;     // Create client

// Improt camera library
import processing.video.*;
Capture video;    // Create new tag for video

// Universal variables
int dataIn = 0;   // Incoming data from server
int valx = 0;     // X-value of where to draw in color
int valy = 0;     // Y-value of where to draw in color
int keyPlace = 1; // Position of cursor for text       
color marker = color(0, 255, 0);   // the starting color for drawing
char keyIn;       // Incoming char from server
boolean keyDown = false; // If a key has been released then true

boolean messageComing = false;
boolean xComing = false;
boolean yComing = false;
boolean cameraRuning = false;

String numberIn = ""; // IP address number of server
boolean firstStart = true; // If true, then the Server IP prompr will
                           //   bedisplayed.
 
 
 
/*******************************************************************
Set up program settings
*******************************************************************/
void setup() {
  
  // Set up screen apearance
  size(718, 480);    // Screen size
  textSize(15);      // Set text size
  noStroke();        // Draw without outline
  fill(255);         // Set filling color to white (text, etc.)
  background(0);     // Clear screen to all black
  
  // display prompt
  text("Enter Server IP Address And Press Space:", 1, 15);
  
  // Start a temporary myClient on port 5204
  myClient = new Client(this, "127.0.0.1", 5204);
  
  // Set up video library
  video = new Capture(this, 640, 480);
} 
 
 
 
/*******************************************************************
Loop too run program till ended. Tasks are:
  1) Run startup prompt for server IP address.
  2) Display data recived from the server.
  3) Send out data to server.
*******************************************************************/
void draw() { 
  
  // Check to see if program has just started.
  if (firstStart == true) { // If so,
    begining();             // Goto function begining()
  }
  
  else if (messageComing) { // If there is text coming 
    getMessage();           // Goto function getMessage()
  }
  
  else if (xComing) {  // If there is an X-position coming in
    gettingMarkerX();  // Goto function gettingMarkerX()
  }
  
  else if (yComing) {  // If there is a Y-position coing in
    gettingMarkerY();  // Goto function gettingMarkerY()
  }
  
  else if (cameraRuning) { // If camera button has been pressed
    displayCamera();   // Goto function displayCamera()
  }
  
  // If server IP has allready been given
  else {
    takeIn();               // Goto function takeIn
    sendOut();              // Goto function sendOut
  }
} 



/*******************************************************************
Recive data from server. Tasks are:
  1) Check for incoming data on the buffer.
  2) Update screen based on new data.
*******************************************************************/
void takeIn() {
  
  // Check variable "myClient" for incoming data
  if (myClient.available() > 0) {   // If there is,
    dataIn = myClient.read();       // Set variable "dataIn" to incoming
                                    //  data value
                                  
    // Print incoming data in monitor
    println("incoming: "); 
    print(dataIn);
  } 
  else {                            // Otherwise erase previouse data  
    dataIn = 0;
  }
  
  // If there is new data in "dataIn"
  if (dataIn > 0) {
    
    // If some other function is coming in
    switch (dataIn) {
      case 200:
        background(0);                 // Clear screen   
        setColor();                    // Redraw interface
        keyPlace = 1;                  // Reset cursor position
        break;
      case 201:                        // If 201 was recived 
        marker = color(0, 255, 0);     // Set color to Green
        break;
      case 202:                        // If 202 was recived
        marker = color(0, 193, 255);   // Set color to Blue
        break;
      case 203:                        // If 203 was recived
        marker = color(204, 59, 255);  // Set color to Purple
        break;
      case 204:                        // If 204 was recived
        marker = color(255, 0, 115);   // Set color to Pink
        break;
      case 205:                        // If 205 was recived
        messageComing = true;          // Send "draw" loop to look for incoming text
        break;
      case 206:                        // If 206 was recived
        xComing = true;                // Send "draw" loop to look for incoming X-position
        break;
      case 207:                        // If 207 was recived
        yComing = true;                // Send "draw" loop to look for incoming X-position
        break;    
    }
    fill(marker);                      // Set marker color
  }
}



/*******************************************************************
Send data to server. Taskes are:
  1) Check for user interface (keypad & mouse)
  2) Display new data on server monitor
  3) Send new data to server
*******************************************************************/
void sendOut() {
  
  // Check for mouse interface
  if (mousePressed == true) {      // If mouse has been pressed
    if (mouseX < (width - 78)) {            // If mouse is inside drawing box
      // Note: for the fallowing, drawing box is split to 3pixel grid
      valx = (mouseX / 3);         // Set to draw in mouse X position
      valy = (mouseY / 3);         // Set to draw in mouse Y position
      ellipse((valx * 3), (valy * 3), 10, 10); // Draw circle at X/Y
      
      myClient.write(206);         // Prep client for incoming X-val
      myClient.write(valx);        // Send X-value
      myClient.write(207);         // Prep client for incoming X-val
      myClient.write(valy);        // Send Y-value
    }
    else if (mouseY < 300) {       // If mouse is in position to select color 
      marker = get(mouseX, mouseY); // Set drawing color to color @ mouse position
      setColor();                  // Goto function setColor(), this will set fill color
      
      // Tell server what the new color is
      if (mouseY < 75) {           // If mouse is above Green
        myClient.write(201);       // Send 201
      }
      else if (mouseY < 150) {     // If mouse is above Blue
        myClient.write(202);       // Send 202
      }
      else if (mouseY < 225) {     // If mouse is above Purple
        myClient.write(203);       // Send 203
      }
      else {                       // If mouse is above Pink
        myClient.write(204);       // Send 204
      }
    }
    
    else {                       // If mouse is above camera button
      cameraRuning = true;       // Send "draw" loop to camera function
      video.start();             
    }
  }
  
  // If a key has been pressed and hasn't been registerd yet
  if (keyPressed && keyDown == false) {
    char keyOut = key;             // Outgoing key press    
    if (keyOut == '-') {           // If "minus" was pressed
      myClient.write(200);         // Send send 200 to server
      background(0);               // Clear the screen
      setColor();                  // Redraw interface
      keyPlace = 1;                // Set cursor back to start
    }
    
    // If any range of keys (A-B, a-b, 0-1, etc..) was pressed
    else if (int(keyOut) > 31 && int(keyOut) < 127){
      writeMessage(keyOut);              // Goto function writeMessage() 
    }
    
    keyDown = true;                // Register that key press has been processed
                                   //   see function keyReleased() for reset on 
                                   //   variable "keydown"
  }
}



/*******************************************************************
Just some side stuff, so I dont have to type all this 100 times :)
  1) Redraw user interface; Drawing box & color boxes.
  2) Set fill to marker color.
*******************************************************************/
void setColor() {
  
  // Draw green box
  fill(0, 255, 0);
  rect((width - 75), 0, 74, 74);
  
  // Draw blue box
  fill(0, 193, 255);
  rect((width - 75), 75, 74, 74);
  
  // Draw purple box
  fill(204, 59, 255);
  rect((width - 75), 150, 74, 74);
  
  // Draw pink box
  fill(255, 0, 115);
  rect((width - 75), 225, 74, 74);
  
  // Draw camera box
  fill(255);
  rect((width - 75), 300, 74, (height - 301));
  fill(0);
  rect((width - 60), (((height - 320)/2) + 301), 45, 30);
  rect((width - 55), (((height - 326)/2) + 301), 10, 3);
  fill(255);
  ellipse((width - 36), (((height - 292)/2) + 301), 18, 18);
  fill(0);
  ellipse((width - 36), (((height - 292)/2) + 301), 15, 15);
  
  // Set drawing color
  fill(marker);
}



/*******************************************************************
The mouse draws if static data is recived, so send values to hidden 
place.
*******************************************************************/
void mouseReleased() {
  valx = -10;
  valy = -10; 
}



/*******************************************************************
If a key was released reset keyDown variable to false.
*******************************************************************/
void keyReleased() {
  keyDown = false;
}

/*******************************************************************
Display image coming through on camera. This is made harder due to
the fact that:
  1) The image will come in mirrored, and has to be reversed.
  2) The video is being placed in an area smaller than the screen.
*******************************************************************/
void displayCamera(){
  int numPixels = video.width * video.height; // Number of pixles to buffer  
  int pos = 0;                                // Position of the pixles
  if (video.available()) {                    // If there is video coming in
    video.read();                             // Read it
    video.loadPixels();                       // Load it to a string
    loadPixels();
    
    // Go through each pixle on by one 
    for (int i = 0; i < numPixels; i++) {
      // Mirror image
      pos = (((floor(i / video.width)) * width) + (video.width - 1 - (i - ((floor(i / video.width)) * video.width))));
      // Load image
      pixels[pos] = video.pixels[i]; // Threshold value, make it white
    }
  }
  updatePixels();

  // check for space bar being pressed
  if (keyPressed && key == ' ') {
    sendPic();                    // Goto function sendPic()
  }
}



/*******************************************************************
Send image to server
*******************************************************************/
void sendPic() {
  video.stop();           // End video stream
  cameraRuning = false;   // Send "draw" loop out of camera function
}
/*******************************************************************
Get incoming X-position data, and store it.
*******************************************************************/
void gettingMarkerX() {
  if (myClient.available() > 0) {   // If there is incoming data
    dataIn = myClient.read();       // Set variable "dataIn" to incoming
    valx = dataIn * 3;              // Store X-position
    xComing = false;                // Set "draw" loop NOT to enter this function
  }
}



/*******************************************************************
Get incoming Y-position data, and store it.
*******************************************************************/
void gettingMarkerY() {
  if (myClient.available() > 0) {   // If there is incoming data
    dataIn = myClient.read();       // Set variable "dataIn" to incoming
    valy = dataIn * 3;              // Store Y-position
    ellipse(valx, valy, 10, 10);    // Draw a circle at that point
    yComing = false;                // Set "draw" loop NOT to enter this function
  }
}
/*******************************************************************
Code for writing a messsage. Tasks are:
  1) Display text typed in Client monitor
  2) Send key pressed to Server
*******************************************************************/
void writeMessage(char keyOut) {
  text(keyOut, keyPlace, 15);         // Display new text
  keyPlace = (keyPlace + 11);         // Advance cursor 1 place
  myClient.write(205);                // Tell client text is coming
  myClient.write(keyOut);
}



/*******************************************************************
Code for reciving a messsage. Tasks are:
  1) Get incoming data from client
  2) Send key pressed to Client
*******************************************************************/
void getMessage() {
  
  // If there is new data
  if (myClient.available() > 0) { 
     keyIn = myClient.readChar();   // Save incoming data to "keyIn"
     
     // Send confirmation to monitor
     println("incoming: ");
     print(keyIn);
     
     messageComing = false;            // Send "draw" loop NOT to look for text
  } 
  text(keyIn, keyPlace, 15);          // Print new text on display 
  keyPlace = (keyPlace + 11);         // Advance cursor one place
}
/*******************************************************************
Code for starting program. Tasks are:
  1) Chech for IP input
  2) Update display with current input
*******************************************************************/
void begining() {
  
  // If a key was pressed
  if (keyPressed == true) {
    keyIn = key;               // Set keyIn to input value
    
    // If the key pressed was space
    if (keyIn == ' ') {
      myClient = new Client(this, numberIn, 5204); // Conect client to that IP
      background(0);           // Clear screen 
      setColor();              // Goto function setColor()
      firstStart = false;      // Exit startup functions
    }
    
    // Otherwise keep updating prompt screen
    else {
      background(0);               // Clear Screen
      text("Enter Server IP Address And Press Space:", 1, 15); // Display text
      numberIn = numberIn + keyIn; // Add new input to IP address sting
      text(numberIn, 1, 35);       // Display currently had IP address
      println(numberIn);           // Print currently had IP address in monitor
    }
    
    delay(200); // Delay to reduce repeted key presses on input.
  }
}


