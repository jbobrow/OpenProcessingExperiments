
PImage radio;
PFont font;

import ddf.minim.*;
// using minim and its AudioPlayer method


Minim minim;
AudioPlayer[] mySample = new AudioPlayer[8];
int prevState, currentState;
int diff = 500; 
int previousTime = 0;
int sample_Num = 0;
int curr_sample;
int prev_sample;
int first_sample = 0;
int last_sample;
int counter;

void setup(){
  size(600,400);
  minim = new Minim(this); // Start Sonia engine.
  // used loadstrings to list all samples in folder
 String lines[] = loadStrings("list.txt");
  println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) {
  println(lines[i]);
  }
  last_sample = lines.length;
  for(int i = first_sample; i<lines.length; i++){ 
  // for loop searches folder for file names that fit and builts list
    mySample[i] = minim.loadFile(lines[i], 2048);
  }
prevState = 0;
}

void draw(){
  
    smooth(); // CLOCK
    background(0); 
    fill(80); 
    noStroke(); 
    // Angles for sin() and cos() start at 3 o'clock; 
    // subtract HALF_PI to make them start at the top 
    ellipse(140, 230, 105, 105); 
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI; 
    float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI; 
    float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI; 
    stroke(0);
    strokeWeight(2); 
    line(140, 230, cos(s) * 40 + 140, sin(s) * 40 + 230); 
    line(140, 230, cos(m) * 35 + 140, sin(m) * 35 + 230); 
    line(140, 230, cos(h) * 25 + 140, sin(h) * 25 + 230); 
 
  strokeWeight(3); 
    stroke(255,0,0);
    dial();
 
 PImage radio = loadImage("TUNER.png");
 image(radio,0,0);
 
 PFont font;
 font = loadFont("GillSans-10.vlw");
 textFont(font);
 fill(0);
 text ("TUNING", 450, 250); 
     }     

void dial(){
  float tuner = map (mouseX, 0, 600, 240, 500);
  line(tuner, 50, tuner, 300);
  
}

void mouseMoved(){
  if ((mouseX > 0) && (mouseX < 60)){
  int sample_Num = 0;
  soundSweeper(sample_Num);
}else{
  if ((mouseX >61) && (mouseX < 120)){
    int sample_Num = 1;
  soundSweeper(sample_Num);
  }else{
  if ((mouseX > 121) && (mouseX < 180)){
    int sample_Num = 2;
  soundSweeper(sample_Num);
  }else{
  if ((mouseX > 181) && (mouseX < 240)){
    int sample_Num = 3;
  soundSweeper(sample_Num);
    }else{
  if ((mouseX > 241) && (mouseX < 300)){
    int sample_Num = 4;
  soundSweeper(sample_Num);
     }else{
  if ((mouseX > 301) && (mouseX < 360)){
    int sample_Num = 5;
  soundSweeper(sample_Num);
    }else{
  if ((mouseX > 361) && (mouseX < 420)){
    int sample_Num = 6;
  soundSweeper(sample_Num);
      }else{
  if ((mouseX > 421) && (mouseX < 500)){
    int sample_Num = 7;
  soundSweeper(sample_Num);
  }
      }
    }
  }
  }
  }
  }
  }
}


void soundSweeper(int sample_Num) {
  int currentTime = millis(); //Check the time
  currentState = sample_Num;
  if(currentTime > (previousTime + diff))
  {
    if(prevState != currentState){
      //If the current state of the mouse if different to what is previously was
      println("Change from " + prevState + " to " + currentState);
      counter++;
      mySample[currentState].play();
      println("playing currently:" + currentState);
    }else{
       mySample[prevState].pause();
       println("paused previous sample :" + prevState);
    }

      /*
       if(!mySample[currentState].isPlaying()){
         mySample[currentState].play();
       println("playing currently:" + currentState);
      }else{
       mySample[prevState].pause();
       println("paused previous sample :" + prevState);
    }
    }
    */
 
    prevState = currentState;
    previousTime = currentTime;
  }
 
}



// Safely close the sound engine upon Browser shutdown.

public void stop(){

  minim.stop();

  super.stop();

}

         



