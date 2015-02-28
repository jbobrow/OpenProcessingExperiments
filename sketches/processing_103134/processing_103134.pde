
Maxim maxim;  //create variable for player
AudioPlayer player;
float[] spec; //will hold analysis of audio
float threshold, xpos, ypos, pspeed;
ArrayList rain = new ArrayList();
int delay;

void setup(){
  size(900, 900);
  background(0); //Set black background.
  //colorMode(HSB, 100);
  //Set threshold for creating drops
  threshold = 0.68;
  
  //Initialize maxim
  maxim = new Maxim(this); 
  
  //Load player with audiofile and set initial settings
  player = maxim.loadFile("drums.wav");  
  player.setLooping(false); //Do not loop by default
  player.setAnalysing(true); //Allow us to look at audio
  
  //Set player speed
  pspeed = 1;
  
  rain.add(new Rain());
  
  delay = 0;
}

void draw(){
  player.play(); //Start the player
  spec = player.getPowerSpectrum(); //Grab audio info
 
  fade(100); //Allow visuals to fade
  
  //Populate new raindrops
  if(spec != null){
    for(int i = 0; i < spec.length; i++){ 
      if(map(-1 * spec[i], 0, 150, 0, 1) > threshold && map(-1 * spec[i], 0, 150, 0, 1) > 0.1 && delay < 0){
        rain.add(new Rain(map(i, 0, spec.length, width/2, width), 0));
        rain.add(new Rain(map(i, 0, spec.length, width/2, 0), 0));
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
  pspeed = map(pmouseX, 0, width, 0.5, 2);
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
    //dcol = color(map(x, 0, width, 0, 255), map(x, 0, width, 0, 255), map(x, 0, width, 0, 255));
    colorMode(HSB);
    dcol = color(map(abs(width/2 - x), 0, width/2, 0, 360) , 255, 255);
   
   /*if (x < width/3){
      dcol = color(255, 0, 0);
    } else if (x >= width/3 && x <= (2* width)/3){
      dcol = color(0, 255, 100);
    } else {
      dcol = color(0, 0, 255);
    }
    */
    
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



