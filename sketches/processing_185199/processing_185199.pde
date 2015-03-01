
//week 1 - assignment 
//All code by James Lamb 


//-Variable Declaration-

//Used to iterate number of rect's already made
int y = 0;

//Used to reduce the number of squares based on degen
int z = 0;

//Used to effect the general "loss" over time
int degen = 0;


//-Setup Function-
//Executed Once
void setup (){
  size (400,400);
  frameRate(1.5);
}

//-Draw Function-
//Executed every frame
void draw (){
  
  //End Screen
  if (degen == 110){
    background(0);
    fill(250);
    textSize(26);
    text("Goodbye Dave.",100,200);
  }
  
  //Noraml Frame
  else{
  
  //Creates a random background
  background(int (random (0,150)));
  
  //Creates the rectangles
  while (y < 100){
    fill(int (random (100,255)),0,0,int (random (0,255)));
    rect(int (random (0,400)),int (random (0,400)),30,30);
    //advances the rectangle counter by one
    y += 1;
    //reduces the amound of squares by z (only when the image degenerates)
    if (degen > 60){
      y = y + z;
     }
      
    // Blends the Image
    blend(0,0,400,400,0,0,400,400,LIGHTEST);
  }
  
  //Creates a black and white filter randomly (Gets more polar over time)
  if (random(0,100) < degen){
    filter(POSTERIZE, 3);
    filter(THRESHOLD);
  }
  
  //Writes the Font
  //Creates the values used to determine text output
  int t = 6;
  //this adjusts the rate for the adittion of more outputs
  if (degen > 40){
    t = 9;
  }  
  float textF = int(random(0,t));
  
  //Following are the various text outputs
  if (textF == 1){
    fill(0);
    textSize(26);
    text("Dave. Stop." , int (random(0,300)), int (random(0,374)));
  } else if (textF == 2){
    fill(0);
    textSize(26);
    text("Dave." , int (random(0,350)), int (random(0,374)));
  } else if (textF == 3){
      if (degen > 50){
     fill(0);
    textSize(26);
    text("I can feel it." , int (random(0,270)), int (random(0,374)));
      }
  }else if (textF == 4){
      if (degen > 50){
     fill(0);
    textSize(26);
    text("My mind is going." , int (random(0,260)), int (random(0,374)));
      }
  }else if (textF >= 8){
      if (degen > 60){
     fill(0);
    textSize(26);
    text("I'm afraid." , int (random(0,300)), int (random(0,374)));
      }
  }
  
  //Resets the y value for the next frame
  y = 0;
  //advances z for the next frame
  if (degen > 60){
    z += 1;
  }
  //Count the frame number by 1
  degen = degen +1;
  
 //Notes : HARD_LIGHT  LIGHTEST are other considerations for the blend function
 
  }
}
