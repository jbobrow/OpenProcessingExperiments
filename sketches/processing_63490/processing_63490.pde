
//import libraries - sketch -->import
import ddf.minim.*;

//call class from library - volume
Minim tick;
AudioInput in;

//call class from library - volume
Minim minim;
AudioSample player_1, player_2,player_3; 

//image variable
PImage bg;
//sound variable for volume
float volume;
//sound variable ticking
int seconds,minutes,hours; 
int lastSecond, lastMinute, lastHour; 

//set window, bg &anti-alias
void setup(){
size(400,400);
background(0);
smooth();
//set bg image
bg=loadImage("bg.jpg");
//volume variable value
volume=0;

//from sound library - setup
minim = new Minim(this);
//debug - check sound board
minim.debugOn();
  
//call sound input
in = minim.getLineIn(Minim.MONO,2);


tick = new Minim(this);
 // load a file, give the AudioPlayer buffers that are 2048 samples long
 player_1 = tick.loadSample("seconds.aif", 512);
 player_2 = tick.loadSample("minutes.aif",512);
 player_3 = tick.loadSample("hours.aif");
 
seconds = 0; 
minutes = 0;
hours = 0;

}

//set drawing
void draw(){
//set volume
volume = in.left.get(0)*200;  
 
seconds= second();
minutes=minute();
hours=hour();
 
//frameRate(15);
background(0);
//image settings
imageMode(CENTER);
//tint(230,30,100,200);
image(bg,width/2,height/2,width,height);
//color mode & text load and set
 colorMode(RGB,255,255,255); 

//limit set 
int w=width/2;
int a=height/2;
int m2;
//clock & position & size variables
int s = second();  // Values from 0 - 59
int m = minute();  // Values from 0 - 59
int h = hour();    // Values from 0 - 11
float mil = millis();// Values from 0 - 999
int w2=width;
int alt=3;
float Scale=200;


//clock variables map
  s=(int) map (s, 0,60, 0, 360);
  m=(int) map (m, 0,60, 0, 360);
  h=(int) map (h, 0,12, 0, 360);
  //mil=(int) map (mil, 0,100, 0, Scale);
 
//////////////////
///////CLOCK//////
//////////////////
  noStroke();
  
  //hours' ellipse  track & seconds limit
  strokeWeight(1.5); 
  noFill();
  stroke(255);
  //minutes' track
  ellipse(w,a,width/1.75,width/1.75);
  //hours' track
  ellipse(w,a,width/3,width/3);
  //seconds' track
  ellipse (w,a,width/1.15+volume+5,width/1.15+volume);
  //center sun - sound reactive
  noStroke();
  fill(255,126,10,200);
  ellipse (w,a,45+volume,45+volume);
  
  
  
  //SECONDS (grows with seconds)
  fill(200,0,mil,180); 
  //ellipse(w,a, mil, mil); 
 
  
  //MINUTES
  //traslation for time's rotation
   translate (width/2, height/2);
     
   //stroke size & color
   strokeWeight(2);
   colorMode(HSB,360,100,100);
   
  //color map to minutes 
   int mC = (int) map (m,0,Scale,0,360);
   fill(mC,88,99);

   
   //convert angle in degrees to radians
   float angleMinutes = radians(m);
   //rotation around center of window
   pushMatrix();
    rotate(angleMinutes);
    ellipse(0,-width/3.5,35,35);
   popMatrix();  
   
 //sound trigger - MINUTES
 //lastMinute + 1 = minutes ATM
 if (lastMinute+1 == minutes){
    player_2.trigger();   
 }
 
 //last minue = minutes ATM
 lastMinute = minutes; 
      
   //HOURS//
   
   //convert angle in degrees to radians
      float angleHours = radians(h);
     //rotation around center of window
     pushMatrix();
        rotate(angleHours);
        strokeWeight(12);
        //color map to hours
        int hC = (int) map (h,0,Scale,0,360);
        fill(hC-100,30,99);
        ellipse (0,-width/6,45,45);
    popMatrix();
  
      //sound trigger - HOURS
 //lastHour + 1 = hours ATM
 if (lastHour+1 == hours){
    player_3.trigger();   
 }
 
 //last minue = minutes ATM
 lastHour = hours;   
  
  
////////SECONDS//////////     
   
   //convert angle in degrees to radians
      float angleSeconds = radians(s);
     //rotation around center of window
     pushMatrix();
        rotate(angleSeconds);
        strokeWeight(12);
        //color map to hours
        int sC = (int) map (s,0,Scale,0,360);
        fill(sC-200,70,100);
        ellipse (0,-width/2.3-volume,20,20);
    popMatrix();  
        
 //sound trigger - SECONDS
 //lastSecond + 1 = seconds ATM
 if (lastSecond+1 == seconds){
    player_1.trigger();   
 }
 
 //last seconds = seconds ATM
 lastSecond = seconds;  
   
}

//always close the minim audio
void stop(){
  player_1.close();
  in.close();
  minim.stop();
  super.stop();
}



