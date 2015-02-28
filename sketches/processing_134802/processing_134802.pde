
float direction = 1;   //declares float //
PVector speed = new PVector(0,1);  //gives acceleration to the stroke inbetween points
float pointX;          //declares float
float pointY;          //decalres float
float change;          //declares float
void setup(){
  size(800,800);       //size of sketch
   pointX = width/2;   //declares x point to start in center
   pointY = height/2;  //declares y point to start in center
  background(0,0,0);  //color of background
}
 
void draw(){
  stroke(0,0,255);       //color of line drawn
  strokeWeight(2);       //thickness of line drawn
  change = round(random(1,10));  //rounds to closest integer 1-10
  if(change ==10){     //pick a random integer 1-10
  direction = round(random(0,8)); //rounds to closest integer 0-8
  point(pointX,pointY);           //places points when new direction is selected 
  point(pointX+1,pointY+1);
  point(pointX-1,pointY-1);
  point(pointX-1,pointY+1);
  point(pointX+1,pointY-1);
  stroke(0,0,255);                //color of points
  point(pointX+1,pointY);
  point(pointX-1,pointY);
  point(pointX,pointY+1);
  point(pointX,pointY-1);
  stroke(0,0,0);                  //color of points  
  }
   if(direction == 1){           //direction #1 is UP
   speed.set(0,-1,0);            //set allows image to directly display to the screen
   }
   if(direction == 2){           //direction #2 is RIGHT
   speed.set(1,0,0);
   }
   if(direction == 3){           //direction #3 is DOWN
  speed.set(0,1,0);
   }
   if(direction == 4){           //direction #4 is LEFT
  speed.set(-1,0,0);
   }
   if(direction == 5){           //direction #5 is BOTTOM LEFT CORNER
   speed.set(-1,-1,0);
   }
   if(direction == 6){           //direction #6 is TOP RIGHT CORNER
   speed.set(1,1,0);
   }
   if(direction == 7){           //direction #7 is TOP LEFT CORNER
  speed.set(-1,1,0);
   }
   if(direction == 8){           //direction #8 is BOTTOM RIGHT CORNER
  speed.set(1,-1,0);
   }
   if(pointX == width){          //if x point goes past right side of screen
  pointX = 1;
   }
   if(pointX == 0){              //if x point goes past LEFT side of screen
  pointX = width-1;
   }
   if(pointY == height){         //if y point goes ABOVE the screen
  pointY = 1;
   }
   if(pointY == 0){              //if y point goes BELOW the screen
  pointY = height-1;
   }
   pointX = pointX+speed.x;      //gives movement to x points
   pointY = pointY+speed.y;      //gives movement to y points
   point(pointX, pointY);        //places initial point and allows functions to work
}

void keyPressed() {              //allows image to be saved as a tiff file
  saveFrame("Picture#5.tif");
}

