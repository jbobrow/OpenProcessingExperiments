
/*
The basis of this code is primarily built from 
the Brownian Motion sketch on the prosseing.org webstie, more specifically:
http://processing.org/learning/topics/brownian.html
It also utilizes the brilliant OpenKinect library, AveragePointTracking pde, and the KinectTracker class,
Included credits with AveragePointTracking.pde:
// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan
// http://www.shiffman.net
// https://github.com/shiffman/libfreenect/tree/master/wrappers/java/processing
Finally, this sketch also uses the Minim library and a sketch that is a spectrum analyzer
I used both for calibration purposes and purposes used in this sketch, a sketch from Anthony Mattox the code is found here:
http://archive.anthonymattox.com/2007-2011-blog/index.html?p=393.html
if you know who created  the Brownian Motion sketch, please tell me.
I'm Iltimas Doha.
*/


//import krister.Ess.*;

//import org.openkinect.processing.*;


//FFT myfft;
//AudioInput myinput;

int bufferSize=512;
int num = 1000;
int range = 6;
int freq=212;
int mult=-8;
int counter;
int page;
float[] ax = new float[num];
float[] ay = new float[num]; 


void setup() 
{
  size(640, 480);  //NEEDS TO BE THIS SIZE FOR KINECT, ALTHOUGH I COULD MAP IT NOW THAT I THINK ABOUT IT WRITING THIS COMMENT NOW
  for (int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
  frameRate(60);
  noCursor();
  noFill();
  //noStroke();
  //AUDIO
  /*Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();
  myfft.damp(.3);
  myfft.equalizer(true);
  myfft.limits(.005, .05); */
  //KINECT

}

void mouseReleased() {
page=0;
counter=0;
}

void keyPressed() {

}

void draw() 
{

  background(0);
  //INTRO QUOTE FROM DOCTOR WHO...DONT JUDGE ME...
  if (page==0) {

    text("People assume that time is a strict", 200+random(0,3), 50);
    if(counter>100){
    text(" progression of cause to effect,", 200+random(0,3), 150);
    }
        if(counter>300){
    text(" but *actually* from a non-linear, non-subjective viewpoint", 200+random(0,3), 250);
        }
        if(counter>500){
    text(" it's more like a big ball of wibbly wobbly... time-y wimey... stuff.", 200+random(0,3), 350);
        }   
    counter++; //BUM WAY OF DISPLAYING FOR 10 SECONDS
    if (counter==800) {
      page++;  //PROGRESS TO ACTUAL PROGRAM AFTER 10 SECONDS
    }
  
  }
  //INTRO QUOTE FROM DOCTOR WHO...DONT JUDGE ME...
  
//ACTUAL INTERACTIVE ART PROGRAM
  if (page==1) {

    PVector v2  = new PVector(mouseX,mouseY);
    //float amp=myfft.spectrum[freq]*mult;
    // I ACTUALLY DONT REMEMBER WHAT I WAS DOING HERE
    //line( ax[num-1],0, ax[num-1],ay[num-1]-10);
    //line( ax[num-1],ay[num-1]+10, ax[num-1],height);
    //line(0,ay[num-1],ax[num-1]-10,ay[num-1]);
    //line(ax[num-1]+10,ay[num-1],width,ay[num-1]);
    // I ACTUALLY DONT REMEMBER WHAT I WAS DOING HERE
    
    // Shift all elements 1 place to the left
    for (int i = 1; i < num; i++) {
      ax[i-1] = ax[i];
      ay[i-1] = ay[i];
    }

    // Put a new value at the end of the array
    ax[num-1] +=noise(20)*10*random(-range, range); // BROWNIAN MOTION SCALED DOWN IN A PERLIAN FASHION
    ay[num-1] +=noise(20)*10*random(-range, range); // BROWNIAN MOTION SCALED DOWN IN A PERLIAN FASHION

    // Constrain all points to the screen
    ax[num-1] = constrain(ax[num-1], 5, width-5);   //POINTS ARE CONSTARINED WITH 5-PIXEL BLEED  
    ay[num-1] = constrain(ay[num-1], 5, height-5);  //IN ORDER TO KEEP CIRCLES WITHIN THE SCREEN 

    // Draw a line connecting the points
    for (int i=1; i<num; i++) {    
      float val = float(i)/num * 204.0 + 51;
      line(ax[i-1] , ay[i-1], ax[i], ay[i]);
            
      // GEEZ, I WAS DOING SOMETHING HERE...RIGHT?
      // stroke(val);
      // GEEZ, I WAS DOING SOMETHING HERE...RIGHT?
      
      ellipse(ax[i], ay[i], 10, 10); //DRAWS CICLES WHERE THE VERTICIES ARE, AS WELL AS SLIGHTLY MOVE/VIBRATE CIRCLE BASD OF NOISE OF THE ROOM
      
      //CIRCLE DETECTION
      //IF THE RECTANGLE IS ON TOP OF A POINT IT MOVES IT AWAY
      if (ax[i-1]>v2.x && ax[i-1]< v2.x+50 && ay[i-1]>v2.y && ay[i-1]< v2.y+50) {
        if (ax[i-1]<v2.x+25 && ax[i]<v2.x+25) {
          ax[i-1]-=5;
          ax[i]-=5;
        }
        if (ax[i-1]>v2.x+25 && ax[i]>v2.x+25) {
          ax[i-1]+=5;
          ax[i]+=5;
        }  
        if (ax[i-1]<v2.x+25 && ax[i]>v2.x+25) {
          ax[i-1]+=5;
          ax[i]+=5;
        } 

        if (ay[i-1]<v2.y+25 && ay[i]<v2.y+25) {
          ay[i-1]-=5;
          ay[i]-=5;
        }
        if (ay[i-1]>v2.y+25 && ay[i]>v2.y+25) {
          ay[i-1]+=5;
          ay[i]+=5;
        }  
        if (ay[i-1]<v2.y+25 && ax[i]>v2.y+25) {
          ay[i-1]+=5;
          ay[i]+=5;
        }
      }
      //fill(  ax[i]*255/width,150.0,   ay[i]*255/height,128);
      stroke(  ax[i]*255/width, 150.0, ay[i]*255/height); // MAKES STROKE OF LINE AND RECTANGE AND CIRCLES BASED OF THE LOCATION
      rect(v2.x, v2.y, 50, 50);                           // RECTANGLE/CURSOR FOR USER DETERMINED BY AVG POINT OF KINECT
    }
  }
}



/*void stop() {
  super.stop();
}

public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput); //MINIM REQUIRED SYNTAX
}*/
