
 import processing.serial.*;
 Serial port;
 String port_reading;

import processing.video.*;
 
Capture video;
 
PImage prevFrame;
 
float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;
 
int Old_Mx = 0;
int Old_My = 0;

int x_diff = 0;
int y_diff = 0;  
    
int ballX = width/2;
int ballY = height/2;
int rsp = 25;
 
void setup() {
  println("Available serial ports:");
  println(Serial.list());

 // Uses the first port in this list (number 0).  Change this to
 // select the port corresponding to your Arduino board.  The last
 // parameter (e.g. 9600) is the speed of the communication.  It
 // has to correspond to the value passed to Serial.begin() in your
 // Arduino sketch.
 port = new Serial(this, Serial.list()[0], 9600);  
 
 // If you know the name of the port used by the Arduino board, you
 // can specify it directly like this.
 //port = new Serial(this, "COM1", 9600);  
  
  size(640,480);
  video = new Capture(this, width, height, 30);
 
  prevFrame = createImage(video.width,video.height,RGB);
  video.start();
}
 
void draw() {  
 
  if (video.available()) {
    
    prevFrame.copy(video,0,0,video.width,video.height,0,0,video.width,video.height); 
    prevFrame.updatePixels();
    video.read();
  }
  
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
  
  Mx = 0;
  My = 0;
  ave = 0;
  
 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
      
     
      float r1 = red(current); float g1 = green(current); float b1 = blue(current);
      float r2 = red(previous); float g2 = green(previous); float b2 = blue(previous);
      float diff = dist(r1,g1,b1,r2,g2,b2);
      
      
      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        
        Old_Mx = Mx;
        Old_My = My;
        
        Mx += x;
        My += y;
        ave++;
      } else {
        
        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  rect(0,0, width, height);
  if(ave != 0){ 
    
    Old_Mx = Old_Mx/ave;
    Old_My = Old_My/ave;
    
    Mx = Mx/ave;
    My = My/ave;    

  }
  if (Mx > ballX + rsp/2 && Mx > 50){
    ballX+= rsp;    
    port.write("R\n");
    delay(100);
    if (port.available() > 0) {port_reading = port.readString();
    println(port_reading);
    }
  }else if (Mx < ballX - rsp/2 && Mx > 50){
    ballX-= rsp;
    port.write("L\n");
    delay(100);
    if (port.available() > 0) {port_reading = port.readString();
    println(port_reading);
    }
  }
  if (My > ballY + rsp/2 && My > 50){
    ballY+= rsp;
    port.write("D\n");
    delay(100);
    if (port.available() > 0) {port_reading = port.readString();
    println(port_reading);
    }
  }else if (My < ballY - rsp/2 && My > 50){
    ballY-= rsp;   
    port.write("U\n");
    delay(100);
    if (port.available() > 0) {port_reading = port.readString();
    println(port_reading);
    }
  }
    
    updatePixels();
    noStroke();
    fill(200,0,0);
    ellipse(ballX, ballY, 25, 25);
    
    //println("X: " + Mx + " vs " + Old_Mx + " Delta of " + x_diff);
   // println("Y: " + My + " vs " + Old_My + " Delta of " + y_diff);
}


