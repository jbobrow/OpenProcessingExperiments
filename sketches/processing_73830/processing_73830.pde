
// A simple fuse -- example code by Golan. 

int clickTime; // The time, in millis, at which the user clicked.
boolean bClicked; // Whether or not the mouse has been clicked.
int fuseWidth = 200; // The width of our progress bar
int fuseLeft  = 100; // The left edge of our progress bar
int fuseDuration = 5000; // The duration of our fuse
int fireworkDuration = 1000; // The duration of the special firework event
int totalDuration = fuseDuration + fireworkDuration; // A convenience, for brevity

void setup() {
  size (400, 200);
  bClicked = false;
}

//-----------------------------
void draw(){
  
  // always draw the background rectangle 
  background (160); 
  fill (0); 
  stroke (0);
  rect (100,90, fuseWidth,20); 
  
  if (bClicked){
    // if the mouse was clicked, 
    // reckon how much time has elapsed since the click.
    int elapsed = millis() - clickTime;
    
    if (elapsed < fuseDuration){
      // if it has been less than 5 seconds, draw a progress bar. 
      float pw = map(elapsed, 0,fuseDuration, 0,fuseWidth);
      fill(255); 
      rect(fuseLeft,90, pw,20);  
      
    } else if (elapsed < totalDuration){
      
      // fade out the progress bar during the firework period.
      float fuseGray = map(elapsed, fuseDuration,totalDuration, 255,0);
      fill(fuseGray); 
      rect(fuseLeft,90, fuseWidth,20);
      
      float explosion01 = map(elapsed, fuseDuration,totalDuration, 0,1);
      fill (255,255,0,  (1-explosion01)*255); 
      noStroke(); 
      float radius = pow(explosion01, 2.0) * 600; 
      ellipse (fuseLeft+fuseWidth,100, radius, radius); 
      
    } else {
      // if the fireworks are finished, reset the timer. 
      bClicked = false;
    }
    
  } else {
    fill (255); 
    text ("click to begin", 15,20); 
  }
}

//---------------------------------------
void mousePressed(){
  // when the mouse is clicked, initialize the timer!
  bClicked = true;
  clickTime = millis();
}
