
/* Janeen Cohen
   writing code from scratch,
   investigating HSB color. */
   
   
// Initial Hue Saturation Brightness - - - -    
int hueFactor = 255;
int satFactor = 255;
int brightFactor = 255;

// Setup - - - - - - - - - - - - - - - - - -
void setup() {
  size(500, 500);
  background(0);
  noFill();
  colorMode(HSB);
  rectMode(CENTER);
}

// Draw function - - - - - - - - - - - -  -

void draw() {
  for(int i=1; i <6; i++){
    stroke(random(hueFactor), satFactor, brightFactor); // HSB Hue Saturation Brightness
     for (int j =1; j <6; j++){
         int tx = 550-(100 * i);
         int ty = (100 * j)-50;
         cluster (tx, ty);
         }
     }
  }

// end Draw- - - - - - - - - - - - - - - -  


// Function to draw cluster of squares - - -
void cluster(int tx, int ty){
  

  float rainbow_size = random(20, 100);
  strokeWeight(random(2,3));  
  rotate(.2);  
  rect(tx, ty, rainbow_size*.4, rainbow_size*.6,10);
  rotate(.2);
  rect(tx, ty+25, rainbow_size*.7, rainbow_size*.8,10);
  rotate(.2);
  rect(tx, ty+ 40, rainbow_size*.4, rainbow_size*.6,10);
}

// mouse clicked function - - - - - - 
void mouseClicked(){
    hueFactor = random(10)*22+50;
    }

// keyReleased function - - - - - - - - - 

void keyReleased() {
  if(keyCode == RIGHT){
    satFactor = random(10)*22+50;
    }
  if(keyCode == LEFT){
    brightFactor = random(10)*22+50;
    }
  if(keyCode == UP){
    hueFactor = 255;
    satFactor = 255;
    brightFactor = 255;
    }
}    
