
void setup() {
  size(800,600);    //size
  smooth();         //improve image quality of resized images
  frameRate(20);    //attempt to refresh 20 times a second
  smallfont = loadFont("Jokerman-Regular-48.vlw");      //type of font
  img = loadImage("picture.jpg");    //load picture for background
//sound
  minim = new Minim(this);
  groove = minim.loadFile("The_Pink_Panther.mp3");    //song
  groove.loop();      //repeat
}    //end setup

////////////////////////////////////////////////////////////////////////////
//sound
import ddf.minim.*;
Minim minim;
AudioPlayer groove;
////////////////////////////////////////////////////////////////////////////
PImage img;         //picture
PFont smallfont;    //font 
////////////////////////////////////////////////////////////////////////////
int totalTimes;    //total time accumulated in previous intervals
int startTimes;    //time when this interval started
int displayTimes;   //value to calculate on StopWatch

//set value
int temp=0;
boolean start = false;
boolean stop = false;
boolean reset = false;

//value to the StopWatch
int miliseconds;
int seconds;
int minutes;
int hours;

////////////////////////////////////////////////////////////////////////////

void draw() {
  imageMode(CENTER);  //set image to center
  image(img,400,300);  //print picture
  noStroke();
/////////////////////////////////////  
//show position of mouse
  println("mouseX = "+mouseX);    
  println("mouseY = "+mouseY);
/////////////////////////////////////  
  textSize(40);        //size of text (button)
  fill(90,84,78,200);  //color of text (button start and stop)>>shadow  
  text("Start",183,212);
  text("Stop",185,275);
  
  fill(252,245,237,200);    //color of text (button start and stop)  
  text("Start",180,212);
  text("Stop",182,275);
  
  fill(240,232,225,200);    //color of text (button reset)>>shadow
  text("Reset",177,337);
  fill(7,7,7,200);    //color of text (button reset)
  text("Reset",174,337);
  
  textSize(80);        //size of text (:)
  fill(255);    //color of text (:)
//////////////////////////////////////////////////////////////////////////    
//  int thisTime = millis();    //times in milliseconds     //////////////  
//////////////////////////////////////////////////////////////////////////    
    if(start) {    //if start
      //println ("Times at " + thisTime );         //show the times in milliseconds
      displayTimes =  millis() - startTimes;       //find times
      displayTimes+=temp;      //update times
    }

/////////////////////////////////////////////
////Times////
    miliseconds = ((displayTimes % 1000)/100);
    seconds = displayTimes / 1000;  
    minutes = seconds / 60;  
    hours = minutes/60;  
    minutes = minutes %60;
    seconds = seconds % 60;
/////////////////////////////////////////////
////draw 7-segment////
  
    //hours
      seven_segment(50,406,hours/10);      //first order
      seven_segment(95,406,hours%10);      //second order
  
  text(":",130,458);
    //minutes
      seven_segment(155,406,minutes/10);
      seven_segment(200,406,minutes%10);

  text(":",235,458);
    //seconds
      seven_segment(260,406,seconds/10);
      seven_segment(305,406,seconds%10);

  text(":",338,458);
    //miliseconds
      seven_segment(360,406,miliseconds%10);  //second order
}    //end draw

void mouseClicked() {      //check position of mouse to click
  if(mouseX >=39 && mouseX <=407 && mouseY >=170 && mouseY <=220) {      //start zone
    println("Start!!!");
    startTimes = millis();    //times
     start = true;
     stop = false;
     reset = false;
    temp=displayTimes;
  }    //end if start zone

  if(mouseX>39 && mouseX<=407 && mouseY >=223 && mouseY <=295) {      //stop zone
    println("Stop!!!");
    totalTimes = totalTimes + millis() - startTimes;    //total
     stop = true;
     start = false;
     reset = false;
  }    //end if stop zone

  if(mouseX>39 && mouseX<=407 && mouseY >=298 && mouseY <=348) {      //reset zone
    println("Reset!!!");
     reset = true;
    if(stop) {      //stop?
      // clear the time
        println("Clear to 0");
        totalTimes = 0;
        displayTimes = 0;
    }
    stop = false;
  }  //end if reset zone
}    //end mouseClicked

void seven_segment(int x,int y,int num) {      //draw 7-segment
  stroke(255,221,46);      //color of 7-segment

  if(num!=1 && num!=2 && num!=3 && num!=7) {    //draw if num equal 4,5,6,8,9,0
    strokeWeight(11);
    line(x,y,x,y+30);
  }

  if(num!=1 && num!=4) {    //draw if num equal 2,3,5,6,7,8,9,0
    strokeWeight(11);
    line(x,y,x+30,y);
  }

  if(num!=5 && num!=6) {    //draw if num equal 1,2,3,4,7,8,9,0
    strokeWeight(11);
    line(x+30,y,x+30,y+30);
  }

  if(num!=2) {    //draw if num equal 1,3,4,5,6,7,8,9,0
    strokeWeight(11);
    line(x+30,y+30,x+30,y+30+30);
  }

  if(num!=1 && num!=4 && num!=7) {    //draw if num equal 2,3,5,6,8,9,0
    strokeWeight(11);
    line(x,y+30+30,x+30,y+30+30);
  }

  if(num!=1 && num!=3 && num!=4 && num!=5 && num!=7 && num!=9) {    //draw if num equal 2,6,8,0
    strokeWeight(11);
    line(x,y+30,x,y+30+30);
  }

  if(num!=1 && num!=7 && num!=0) {    //draw if num equal 2,3,4,5,6,8,9
    strokeWeight(11);
    line(x,y+30,x+30,y+30);
  }
}    //end seven_segment

void stop()     //sound
{
  // always close Minim audio classes when you are done with them
  groove.close();
  // always stop Minim before exiting.
  minim.stop();
  super.stop();
}    //end stop

