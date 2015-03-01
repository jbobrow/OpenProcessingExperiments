
//week 1 - assignment 
//Code by James Lamb, Su Hyun Nam

//-Variable Declaration-
//Used to reduce the number of squares based on degen
int z = 0;
//Used to effect the general "loss" over time
int degen = 0;
//determines if it is a filtered frame for use in stroke 
int s = 0;
//-Setup Function-
//Executed Once
void setup (){
  size (400,400);
  frameRate(1);}
//-Draw Function-
//Executed every frame
void draw (){
  //End Screen
  if (degen == 110){
    background(0);
    fill(250);
    textSize(26);
    text("Goodbye Dave.",100,200);}
  //Noraml Frame
  else{
  //Creates a random background
  background(int (random (0,150)));
  s = 0;
  noStroke();
  //determines if it is a filtered frame
  if (random(0,100) < degen){
    s = 1;
  }
    
//Creates the rectangles
//**********************************************************
  //creates a stroke if it is a filtered frame
  for (int i = 0; i < 60; i++){
    if (s == 1){
      stroke(0);
    }
    int x = int (random ( 0,400));
    int y = int (random (0,400));
    //var to maintain color through blur
    int red = int (random (100,255));
    //var for transparency to effect the distance of blur
    int t = int (random (0,255));
    //draws the primary square
    fill(red,0,0,t);
    //stroke(0);
    
    rect(x,y,30,30);
    
    //new blur effect
    int bX = int(random (0,2));
    int bY = int(random (0,2));
    
    
    

    for (int j =0; j<42; j++){
      //check to understand transp val?
      
     fill (red,0,0,(t/4)-j);
      //This removes the lines from the blurred squares
      noStroke();
      //Creates the different directions
      if (bX ==0){
        if (bY == 0){rect(x-j*2, y-j*2,30,30);
        }
        if (bY > 0){rect(x-j*2, y+j*2,30,30);
        }
      }
      if (bX > 0){
        if (bY == 0){rect(x+j*2, y-j*2,30,30);
        }
        if (bY > 0){rect(x+j*2, y+j*2,30,30);
        }
      }
      
    }
    //advances the rectangle counter by one
    y += 1;
    //reduces the amound of squares by z (only when the image degenerates)
    if (degen > 60){
      i = i + z;
     }
  
  }

//***********************************************************
  //Creates a black and white filter randomly (Gets more polar over time)
  if (s == 1 ){
    filter(POSTERIZE, 3);
    filter(THRESHOLD);}
  //Writes the Font
  //Creates the values used to determine text output
  int t = 6;
  //this adjusts the rate for the adittion of more outputs
  if (degen > 40){t = 9;}  
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
  
//***************************************************
  
  //advances z for the next frame
  if (degen > 60){
    z += 1;
  }

//****************************************************
  //Count the frame number by 1
  degen = degen +1;
  }
}
