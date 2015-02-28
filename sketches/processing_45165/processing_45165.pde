
/*
Laurel Deel
Prison Clock
November 2011

The running prisoner represents the seconds. At the 
*/

PImage backG;
PImage backG_alert;
PImage backG_guard;
PImage frontGate;
PImage BANG;
//PImage prisonerPic;
float prisoner_x;
float prisoner_y;

PFont font;

         int dead_numFrames = 12 ;  // The number of frames in the animation
          int dead_frame = 0;
          PImage[] bodies = new PImage[dead_numFrames];


         int numFrames = 6;  // The number of frames in the animation
          int frame = 0;
          PImage[] images = new PImage[numFrames];

void setup(){
         size(794,502);
         smooth(); 
         noStroke();
         backG = loadImage("background.png");
         backG_guard = loadImage("background_guard.png");
         backG_alert = loadImage("background_alert.png");
         BANG = loadImage("BANG.png");
         frontGate = loadImage("front_gate.png");
         //prisonerPic = loadImage ("running_prisoner.gif"); 
         frameRate(4);
         font = loadFont("CompleteinHim-32.vlw");
         textFont(font, 32);
         

          
          images[0]  = loadImage("prisoner_1.png");
          images[1]  = loadImage("prisoner_2.png"); 
          images[2]  = loadImage("prisoner_3.png");
          images[3]  = loadImage("prisoner_4.png"); 
          images[4]  = loadImage("prisoner_3.png");
          images[5]  = loadImage("prisoner_2.png");
          
          /////////////////////////////////////////
         
          bodies[0]  = loadImage("bodies_1.png");
          bodies[1]  = loadImage("bodies_2.png"); 
          bodies[2]  = loadImage("bodies_3.png");
          bodies[3]  = loadImage("bodies_4.png"); 
          bodies[4]  = loadImage("bodies_5.png");
          bodies[5]  = loadImage("bodies_6.png");
          bodies[6]  = loadImage("bodies_7.png");
          bodies[7]  = loadImage("bodies_8.png");
          bodies[8]  = loadImage("bodies_9.png");
          bodies[9]  = loadImage("bodies_10.png");
          bodies[10]  = loadImage("bodies_11.png");
          bodies[11]  = loadImage("bodies_12.png");
          
  float s = second();   //Values from 0 - 59
  float m = minute();  // Values from 0 - 59
  float h = hour();    // Values from 0 - 23

}

void draw(){

  float sx = second();  // Values from 0 - 59
  float sy = second();  // Values from 0 - 59
  float s = second();   //Values from 0 - 59
  float m = minute();  // Values from 0 - 59
  float h = hour();    // Values from 0 - 23
  sx = map(sx,0,59,40,533); //prisoner's x position
  sy = map(sy,0,59,355,426);//prisoner's y position
  
  image(backG,0,0);              //background
  if(s>=54){
    image(backG_guard,0,0);      //bg with guard
  }
  if(s>=56){
    image(backG_alert,0,0);      //bg with alert!!!
  }
  if(s>=58){
    image(backG_guard,0,0);      //bg with guard (after alert)
  }
  
  
  fill(0);
  text(minute(),682,210);        //escapes stopped sign
  
  

  
  if(s>=56){
    sx=506;
    sy=423;}                     //at aprox. 50 seconds he stops because he is caught!
    
    if(s>=58){                   //For the first 58 minutes in the hour
      sx=900;
      sy=900;}


 frame = (frame+1) % numFrames;  //running prisoner 
  image(images[frame], sx, sy);


  bodies(1,1);                   //these are the HOURS. It's the pile of bodies.
  bodies(2,3);                   //the function for this is at the bottom.
  bodies(3,3); 
  bodies(4,4);
  bodies(5,5); 
  bodies(6,6);
  bodies(7,7); 
  bodies(8,8);
  bodies(9,9); 
  bodies(10,10);
  bodies(11,11); 
  bodies(12,12);
  bodies(1,13); 
  bodies(2,14);
  bodies(3,15); 
  bodies(4,16);
  bodies(5,17); 
  bodies(6,18);
  bodies(7,19); 
  bodies(8,20);
  bodies(9,21); 
  bodies(10,22);
  bodies(11,23); 
  bodies(12,24);
  
    if(m>=59 && s>=57){
      fill(255);                 //in the last 3 seconds of every hour, a prisoner
      rect(495,405,154,113);     //gets shot. This is the BANG!
      image(BANG,506,413);}
  
  image(frontGate,0,0);          //transparant front gate
}



void bodies(int hr, int athr){   //function for determining how many bodies for the hour
  float h = hour();
  
  if(h==athr){
  image(bodies[hr-1],522,400);
  }
}

