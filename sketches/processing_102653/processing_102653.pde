
/*

Author: Matt Niehoff
Summer 2013

Designed as part of Coursera Course: Creative Programming for Digital Media & Mobile Apps

Rain code inspired by Anastasis Chasandras
http://www.openprocessing.org/sketch/9299
*/


Maxim maxim;  //create variable for player
AudioPlayer player;
float[] spec; //will hold analysis of audio
float threshold, pspeed;
ArrayList rain = new ArrayList();
int delay;
boolean playing;

void setup(){
  //Set screen size and background color. 
  size(950, 1050);
  background(0);
  
  //Set threshold for creating drops
  threshold = 0.24;
  
  //Initialize maxim
  maxim = new Maxim(this); 
  
  //Load player with audiofile and set initial settings
  player = maxim.loadFile("drums.wav");  
  player.setLooping(false); //Do not loop by default
  player.setAnalysing(true); //Allow us to look at audio
  
  //Set player speed
  pspeed = 1;
  
  //Initialize delay at 0
  delay = 0;
}

void draw(){
  player.play(); //Start the player
  spec = player.getPowerSpectrum(); //Grab audio info
  
  fade(100); //Allow visuals to fade, lower to see a trail on the raindrops

  
  //Populate new raindrops
  if(spec != null){
    for(int i = 0; i < spec.length; i++){
      if((spec[i] > threshold) && (spec[i] > 0.1) && (delay < 0)){
        //If over threshold, create a drop 
        rain.add(new Rain(map(i, 0, spec.length, width/2, width), 0));
        rain.add(new Rain(map(i, 0, spec.length, width/2, 0), 0));
        
        //By creating a delay, it prevents overload and creates "population nodes" spaced across the screen
        //Increase delay to reduce total drops and increase distance between "nodes"
        delay = 150;
      }
      delay--;
    }
  
  //Update current raindrops
    for (int i = 0; i < rain.size(); i++){
      Rain drop = (Rain) rain.get(i); //Grab the ith raindrop and cast is as a Rain object
      drop.move(); //Update location of drop
      drop.draw(); //Re-draw
      
      //Check if it has hit the ground and remove it
      if(drop.pos.y > height){
        rain.remove(i); 
      }    
    }
  }
}

//When the mouse is pressed, restart from the beginning and change speed randomly.
void mousePressed(){
  //player.cue(0); //set to beginning of audio on mousePress
  player.play();
  pspeed = map(pmouseX, 0, width, 0.1, 2);
  player.speed(pspeed);
}


class Rain{
  PVector pos, speed;
  color dcol;
  
  //Constructor(s)
  Rain(){
    
    /* Use variables to track position and speed.
      Set initial position at top of the screen at a random x location.
      Set initial speed to zero
    */
    
    pos = new PVector(random(0, width), 0); 
    speed = new PVector(0, 0);
    
    //Color of the drop
    dcol = color(random(0, 255), random(0, 255), random(0, 255));
        
  }
  
  Rain(float x, float y){ 
    pos = new PVector(x, y);
    speed = new PVector(0, 0);
    colorMode(HSB);
    
    //Map the color of the drop to its distance from the center
    dcol = color(map(abs(width/2 - x), 0, width/2, 0, 360) , 255, 255);
  
    
  };
  
  //Method for displaying drops
  void draw(){
    stroke(dcol); //Creates a drop of random color
    strokeWeight(5); //Sets size of the drops
    point(pos.x, pos.y);
  }
  
  //Update the location of drops
  void move(){
    //Update the location, adding to speed simulates gravity.
    speed.y += 0.1 * pspeed;
    speed.x += random(-0.5, 0.5);
    //speed.y = pspeed * 10;
    pos.add(speed);
  }
  
}


//Method that allows quick changing of amount of fade towards top of the code.
void fade(float fade){
  noStroke();
  fill(0, fade);
  rect(0, 0, width, height);
}
