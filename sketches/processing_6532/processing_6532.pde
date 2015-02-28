

//import oscP5.*; //Library to talk to Max
//import netP5.*;
//import processing.serial.*;
//Serial port;

//OscP5 oscP5;
//NetAddress myRemoteLocation;
int d = 20; // diameter of each circle
int n = 20; // circles per axis
float swingFunc = 0; 
float[][] coords = new float[4][2];


void setup() {
  size(n*d, n*d);
  noStroke();
  background(0);
  //oscP5 = new OscP5(this,12000); //initialize open sound control
 //  myRemoteLocation = new NetAddress("127.0.0.1",12000); // the net address and Port 
   
 //  println("Available serial ports:");
// println(Serial.list());
 
 // port = new Serial(this, Serial.list()[0], 9600);  

  for(int i=0; i<4; i++) { // per speaker
    for(int j=0; j<2; j++) { // per coord.
      coords[i][j] = random(n*d);
    }
  }


}




void draw() {



  float t = 8; // cycle time (in seconds)
  float s = 2; // spatial frequency
  float c = millis() % (1000.*t) / (1000.*t); // cycle position (between 0 and 1)



  // draw each speaker
  fill(255, 0, 0);
  for(int i=0; i<4; i++) {     
    ellipse(coords[i][0], coords[i][1], d, d);
  }

//  print(c + "\n");


  // background (wipe out the previous drawing)
  fill(0);
  rect(0, 0, width, height);


  ellipseMode(CENTER);
  translate(d/2, d/2);

 // fill(255, 0, 0);
//  ellipse(random(n*d), random(n*d), d, d);


  fill(255); 
  for (int j=0; j<n; j++) {
    for (int i=0; i<n; i++) {
float swingFuncA = 0.5*sin(2*PI*(c           ))+0.5; // one oscillation (between 0 and1) per cycle; all synchronized
      float swingFuncB = 0.5*sin(2*PI*(c+ s* i   /n))+0.5; // one oscillation (between 0 and 1) per cycle; horizonal wave
      float swingFuncC = 0.5*sin(2*PI*(c+ s*   j /n))+0.5; // one oscillation (between 0 and 1) per cycle; vertical wave
      float swingFuncD = 0.5*sin(2*PI*(c+ s*(i+j)/n))+0.5; // one oscillation (between 0 and 1) per cycle; diagonal wave
      float swingFuncE = 0.5 * sin(2*PI*(-c + s * sqrt( pow( i-(n-1)/2., 2) + pow(j-(n-1)/2., 2) ) / n)) + 0.5; // ripples

//swingFuncE =  myswing; 

      ellipse(i*d, j*d, d*swingFuncE, d*swingFuncE); // 
       
      // int loc=j*n+i;
      // if(loc==100){
//OscMessage myMessage = new OscMessage("xypoints");
  //  myMessage.add(swingFuncE*d/2); // add an int to the osc message 
   //  myMessage.add(loc);
   //  oscP5.send(myMessage, myRemoteLocation); 
   //  int temp = (int)floor(map (swingFuncA*d/2, 0, d, 0, 255));
//port.write(temp);
//port.write((int)floor(swingFuncD*d));
//println ((int)floor(swingFuncE*d));
     //  }
   }
  }
 
}




