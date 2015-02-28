

//Name: Andrew Foresman
//Class: ITGM_315
//Date: Winter 2013
//Title: final_core-playable


//NOTES:

//My code is designed so I can procedurally generate game levels by
//adjusting a numerical value/variable to control the level of difficulty, ranging from easy to hard(tall or short obsticals with wide or narror passage ways), and the level length 
//My code first draws a game level of random obsticals consisting of boxes with various sizes spaced various distances in x from each other, and strategically placed floating candles 
//My collision detection takes into account the boxes' coordinates (corners, x and y position) and the area in between the boxes is filled in with a quad 
//the candle collision is based on a bounding box

//Collision detection is now working across the level
//Collision detection for the red rectangles is detected using a bounding box
//An advanced feature I have implimented is collision detection on the slope of the edge that spans the distance between the red rectangle's corners, filling the void between them with a quad
//By finding the midpoint of the line, a collision detection threshold is placed around that area and in turn detects if the balloon's edge 'interpenetrates the floor'






import processing.opengl.*; // bring in opengl





int scrn_width = 600; //screen width
int scrn_height = 600; //screen height



//===GAME VARIABLES==========================

int startLevel = 0; //splash screen
int playLevel  = 1; //playing game 
int endLevel   = 2; //game over
int mode=0;  //set current mode to splash screen

int radius = 30; //sets the radius of the balloon

//===colors==========

int c_balloon_base; //balloon base color
int col_bal;
 

//==box variables------

int num_boxes = 50; //how many collision boxes to generate 

int box_width; 
int box_height;
int box_x;
int box_y;

//==filler box variables=====

int filler_width;
int filler_height;
int filler_pos_x;
int filler_pos_y; 

//arrays to store the box values (height,width,x position, y position)
int [] box_heights = new int [num_boxes]; 
int [] box_widths = new int [num_boxes];
int [] box_x_pos = new int [num_boxes];
int [] box_y_pos = new int [num_boxes];

//--------------------------------------------

//arrays to store the boxe's upper corner coordinates 

int [] box_corner_odd_x = new int [num_boxes]; //holds the upper left corner x coordinate of the boxes 
int [] box_corner_odd_y = new int [num_boxes]; //holds the upper left corner Y coordinate of the boxes 

int [] box_corner_even_x = new int [num_boxes]; //holds the upper right corner x coordinate of the boxes 
int [] box_corner_even_y = new int [num_boxes]; //holds the upper right corner y coordinate of the boxes 

int [] slope_y_array = new int [num_boxes - 1]; //stores the calculated Y slope value
int [] slope_x_array = new int [num_boxes - 1]; //stores the calculated X slope value

int [] slope_pos_neg = new int [num_boxes -1]; //stores if the filler has a positive or negative slope 0 for negative, 1 for positive 

int [] distance_array = new int [num_boxes -1];//stores the distance between box corners 

int [] line_point_mid_x = new int [num_boxes -1]; //stores the X mid point coordinate based on slope between box corners
int [] line_point_mid_y = new int [num_boxes -1]; //stores the Y mid point coordinate based on slope between box corners

int [] line_point_1_x = new int [num_boxes -1]; //stores the first X mid-mid point coordinate based on slope between box corners and previously calculated midpoint 
int [] line_point_1_y = new int [num_boxes -1]; //stores the first Y mid-mid point coordinate based on slope between box corners and previously calculated midpoint 

int [] line_point_3_x = new int [num_boxes -1]; //stores the second X mid-mid point coordinate based on slope between box corners and previously calculated midpoint 
int [] line_point_3_y = new int [num_boxes -1]; //stores the second Y mid-mid point coordinate based on slope between box corners and previously calculated midpoint 




//--------------------------------------------------




int directionX = 1; //sets the initial direction to positive X screen left to right
int directionY = 1; //sets the initial Y direction to 0 no movement 


//===vars for the speed boost=======================
boolean boost;
float last; //last recorded time in milliseconds
float elapsed; //time in between the current and last recorded time based on the trigger/boost_time
float boost_time = 300; //the duration for how long the speed boost is to last in milliseconds



float playerX=50, playerY=250; //the initial position of the balloon 

float speed = 2; //the initial speed of the balloon 

float gravity = 1; //sets the value of gravity that affects the balloons constant rate of falling when not pressing UP

//var to hold balloon collision points

int balloon_collision_point_1_x; 
int balloon_collision_point_1_y;

int balloon_collision_point_2_x; 
int balloon_collision_point_2_y;

int balloon_collision_point_3_x; 
int balloon_collision_point_3_y;

int balloon_collision_point_4_x; 
int balloon_collision_point_4_y;

int balloon_collision_point_5_x; 
int balloon_collision_point_5_y;

int balloon_collision_point_6_x; 
int balloon_collision_point_6_y;

int balloon_collision_point_7_x; 
int balloon_collision_point_7_y;


//arrays to hold the candle flame coordinates 

int [] candle_flame_cord_x = new int [num_boxes-1]; //holds the x coordinate for the randomly positioned candle flames
int [] candle_flame_cord_y = new int [num_boxes-1]; //holds the x coordinate for the randomly positioned candle flames





// camera parameters for orthographic viewing
float camera_left   = -300;
float camera_right  =  300;
float camera_bottom =  -300;   // note flipping signs on bottom and top flips the world
float camera_top    = 300;   // so everything else thinks in terms of y-axis pointing up
                               // --as long as the ortho() call is set up right

float camera_x = 300;          // now introduce camera "center", and
float camera_y = 300;          // change L,R,B,T to offsets from the center





// -------------------------------------------------------------



void setup()
{
  size(600, 600, OPENGL); //sets the screen resolution 
  smooth(); //turns on AA



  
  
  
  

  

}





void draw()

{
  
    if ( mode == playLevel ) {
    drawGame();
  } else if ( mode == startLevel ) {
    drawStart();
  } else if ( mode == endLevel ) {
    drawStart();
  }

} 


//===START OF THE SPLASH SCREEN======

void drawStart() {
  
  background( 128 );
  
  fill( 255, 0, 22);  
  
  textAlign( CENTER );
  
  fill( 255,255,255 );
  
  textSize(24);
  
  text( "Helium Gauntlet", width/2, height/2-50 );
  
  text( "core-playable", width/2, height/2 );
  
  fill( 0,0,0 );
  
  text( "use UP/DOWN arrows", width/2, height/2+45 );
  text( "click to begin level", width/2, height/2+75 );

  
  if ( mousePressed ) {
    
    mode = playLevel;
    
    
    
    //===START CALC BOX=============================================

    for(int i=0; i<num_boxes; i++){ //loops through for however many boxes are specified to be created
    //println(i);
    box_height = int(random(50,300)); //random height for the current box
    box_width = int(random(20,70)); //random width for the current box
    box_x = ((i*200) + int(random(10,90))); //calculates the X position for the current box
    box_y = ((scrn_height - (box_height))); //calculates the Y position for the current box
    
    //adds the calculated above values of the current box to the respective arrays
    box_heights[i] = box_height; 
    box_widths[i] = box_width;
    box_x_pos[i] = box_x+100;
    box_y_pos[i] = box_y;
    
    
    //captures the the top corner coordinates and puts into arrays 
    box_corner_odd_x[i] = (box_x_pos[i] - (box_width / 2));
    box_corner_odd_y[i] = box_heights[i];
    
    box_corner_even_x[i] = (box_x_pos[i] + (box_width / 2));
    box_corner_even_y[i] = box_heights[i];
    
    
    
    
    
    
    //println();
    //println();
    //println("box height, index#: " + i + "   Value: " + box_heights[i]);
    //println("box width, index#: " + i + "   Value: " + box_widths[i]);
    //println("box X pos, index#: " + i + "   Value: " + box_x_pos[i]);
    //println("box y pos, index#: " + i + "   Value: " + box_y_pos[i]);
        
        }       
    }

    //===END CALC BOX===================================================

}

//===END OF SPLASH SCREEN====================================








//---START KEY PRESSED------------------------------------------------- 
void keyPressed(){
  
  if (key == CODED) //checks to see if the key is coded first (up,down) arrows and CONTROL
  {

    if (keyCode == UP) //if the up arrow key is pressed..
    {

      directionY=-1; //changes the Y direction to negative 1 if it is not already, making the character move towards the top of the screen

    }
    
    else if (keyCode == DOWN) //if the down arrow is pressed..
    {

      directionY=1; //changes the Y direction to positive 1 if it is not already, making the character move towards the bottom of the screen 

    }
    
    else if (keyCode == CONTROL){ //if the CONTROL key is pressed we need to activate the temporary boost in speed

      c_balloon_base = 211 ; //balloon base color if the boost is active

      //println("boost activated");
       
      
     }
      
   }

} 


// ---END KEY PRESSED -----------------------------------------------



//===START KEY RELEASED=============================================

void keyReleased(){ 
  
  if (key == CODED){ //checks to see if the key is coded first (up) arrow(s)
    
    if (keyCode == UP){ //if the up arrow is released..
      
      directionY = 1; //when released gravity takes over and the balloon starts to drop
      
    }
    
    if (keyCode == CONTROL){
      
      //c_balloon_base = 100; //balloon base color
      //println("boost de-activated");
    }  
    
    }
}


//===END KEY RELEASED===================================





//===STARTS THE GAME=============================================>>>


void drawGame(){//starts drawing the game
  
//===PARAMETERS==================================

  camera_x = playerX; //sets the camera X position to the current balloon X position
  
  ortho(  camera_x+camera_left,    camera_x+camera_right, 
         -camera_y+camera_bottom, -camera_y+camera_top,    10, -10 );
         
  resetMatrix();
  
  background(128);
  
  ellipseMode(RADIUS);
  
//------------------------------------------------





    
//===START DRAW BOX ===============================


    
   for(int k=0; k<num_boxes; k++){ //loops through for however many boxes are specified to be created

     fill(255,0,0);//box fill color 
   
     rect(box_x_pos[k], box_y_pos[k], box_widths[k], box_heights[k]); //draws the current box based on calculated values from calcBox
    
   }

//===END DRAW BOX===================================


//===START DRAW BOX FILLER==============================

    for(int k=0; k<num_boxes-1; k++){ //loops through for however many boxes are specified to be created

       fill(2,255,18);//box fill color 
   
       int quad_c_1_x = box_x_pos[k] + box_widths[k];
       int quad_c_1_y = box_y_pos[k];
       int quad_c_2_x = box_x_pos[k+1];
       int quad_c_2_y = box_y_pos[k+1];
       int quad_c_3_x = box_x_pos[k+1];
       int quad_c_3_y = scrn_height;
       int quad_c_4_x = box_x_pos[k] + box_widths[k];
       int quad_c_4_y = scrn_height;
   
       quad(     quad_c_1_x, quad_c_1_y, quad_c_2_x, quad_c_2_y, quad_c_3_x, quad_c_3_y, quad_c_4_x, quad_c_4_y      ); //draws the current box based on calculated values from calcBox
    
     }  

//===END DRAW BOX FILLER===================================




  






//===START SCORE DISPLAY===============================


  
   int time_sec = round(millis()/1000); //converts milliseconds to seconds by rounding
   int score_slow = time_sec*10; //converts the time in seconds to the score
   
   int time_tenth_sec = round(millis()/100); //converts millis to 10th of a second 
   int score_fast = score_slow + time_tenth_sec;//displays the score with the 10th of a second counter
   
   fill(0);
   textSize(24); //size for score text
   text(score_fast,camera_x-250,580); //displays the score onscreen





//===END SCORE DISPLAY===================================





  
//===START MOVE PLAYER====================================


  


  
   // if ((playerX>width-radius) || (playerX<radius)) //checks to see if balloon is not going off frame in X based on its radius 
  //{    
    //directionX=-directionX; //inverts the X direction value 
    
  //}

  if ((playerY>height-radius)) //checks to see if balloon is not going off frame in Y screen-bottom based on its radius 
  {    
    playerY = scrn_height - radius; //if the balloon touches the bottom of the screen it remains along the bottom in Y unless directed otherwise
    
    if (directionX == 1) { //if the balloon in touching screen-bottom and moving in positive in X, slow its speed down
      
        playerX=playerX-1; //moves the balloon in positive X slower than normal speed
        
   }
   
   else if(directionX == -1){ //if the balloon in touching screen-bottom and moving in negative in X, slow its speed down
  
             playerX=playerX+1; //moves the balloon in negative X slower than normal speed 

   }

  }  
  
  if ((playerY<radius)) //if the balloon touches the top of the screen based on its radius..
  {
        directionY=-directionY; //inverts the Y direction value if the balloon reaches the top of the screen
        
        playerX=playerX+speed*directionX; //moves the balloon in X
        playerY=playerY+gravity*directionY; //moves the balloon in Y


  }  
  
  else { //normal balloon motion if not touching any sides etc.
 
  
  
      playerX=playerX+speed*directionX; //moves the balloon in X
      playerY=playerY+gravity*directionY; //moves the balloon in Y
      
  }


//===END MOVE PLAYER=======================================


//===START BALLOON COLLISION CALC POINTS==========================

  balloon_collision_point_1_x = round(radius*2 + (playerX + (radius * cos(0))));  
  balloon_collision_point_1_y = round(radius*2 + (playerY + (radius * cos(0))));  
  
  balloon_collision_point_2_x = round(radius/2 + (playerX + (radius * cos(-30))));  
  balloon_collision_point_2_y = round(radius/2 + (playerY + (radius * cos(-30))));  
  
  balloon_collision_point_3_x = round(radius/2 + (playerX + (radius * cos(-60))));  
  balloon_collision_point_3_y = round(radius/2 + (playerY + (radius * cos(-60)))); 
  
  balloon_collision_point_4_x = round(radius/2 + (playerX + (radius * cos(-90))));  
  balloon_collision_point_4_y = round(radius/2 + (playerY+55 + (radius * cos(-90)))); 
  
  balloon_collision_point_5_x = round(radius/2 + (playerX + (radius * cos(-120))));  
  balloon_collision_point_5_y = round(radius/2 + (playerY + (radius * cos(-120))));
 
  balloon_collision_point_6_x = round(radius/2 + (playerX + (radius * cos(-150))));  
  balloon_collision_point_6_y = round(radius/2 + (playerY + (radius * cos(-150))));  
  
  balloon_collision_point_7_x = round(radius/2 + (playerX + (radius * cos(-180))));  
  balloon_collision_point_7_y = round(radius/2 + (playerY + (radius * cos(-180)))); 
  
  //println("playerX = " + playerX);
  //println("playerY = " + playerY);
  //println("balloon_coll_point_1_X = " + balloon_collision_point_1_x);
  //println("balloon_coll_point_1_Y = " + balloon_collision_point_1_y);





//===END BALLOON COLLISION CALC POINTS==========================






//===START COLLISION CHECK===============================

  
  for (int g=0; g<num_boxes-1; g++){ //loops for cycling through the arrays the boxes values are stored in
  

  
      //start the slope collision calculations and check=======================================
      
      //slope between boxes
      
      slope_y_array[g] = box_corner_even_y[g] - box_corner_odd_y[g+1];//slope Y value
      slope_x_array[g] = box_corner_even_x[g] - box_corner_odd_x[g+1];//slope X value 
      
      if(slope_y_array[g] > 0){ //if the change in y is positive
        
        slope_pos_neg[g] = 23; //set the slope value to 23 'negative'
        
      }
      
      else{
        
        slope_pos_neg[g] = 22; //set the slop vlaue to 1 'positive'
        
      }
      
      
      //distance between corners 
      
      distance_array[g]= (  round(sqrt((      (box_corner_odd_x[g+1] - box_corner_even_x[g]) * (box_corner_odd_x[g+1] - box_corner_even_x[g])        ) + (      (box_corner_odd_y[g+1] - box_corner_even_y[g]) * (box_corner_odd_y[g+1] - box_corner_even_y[g]))       ))  );
      
      //println(slope_x
      //println("Distance index # " + g + ":    " + distance_array[g]);
      
      //calculate mid point

      line_point_mid_x[g] = (  ((box_corner_even_x[g] + box_corner_odd_x[g+1]) / 2));
      line_point_mid_y[g] = (  ((box_corner_even_y[g] + box_corner_odd_y[g+1]) / 2)); 
   
     
      
      //calculate the 1st mid-mid point
      
      line_point_1_x[g] = (  ((box_corner_even_x[g] + line_point_mid_x[g]) / 2)); //calculates the x value for the first mid-mid point of the current line based on the start coodinate(current even box vertex) and the previously calculated mid-point
      line_point_1_y[g] = (  ((box_corner_even_y[g] + line_point_mid_y[g]) / 2)); //calculates the y value for the first mid-mid point of the current line based on the start coodinate(current even box vertex) and the previously calculated mid-point
   
      //calculate the 2nd mid-mid point
      
      line_point_3_x[g] = (  ((line_point_mid_x[g] + box_corner_odd_x[g+1]) / 2)); //calculates the x value for the second mid-mid point of the current line based on the previously calculated mid-point and the line end-point
      line_point_3_y[g] = (  ((line_point_mid_y[g] + box_corner_odd_y[g+1]) / 2)); //calculates the x value for the second mid-mid point of the current line based on the previously calculated mid-point and the line end-point

      //println("1st mid-mid point for line " + g + ": (" + line_point_1_x[g] + "," + line_point_1_y[g] + ")");  
      //println("mid-point for line " + g + ": (" + line_point_mid_x[g] + "," + line_point_mid_y[g] + ")");   
      //println("2nd mid-mid point for line " + g + ": (" + line_point_3_x[g] + "," + line_point_3_y[g] + ")");   
      //println();



      
      
      

      
      
      
      
      //end slope collision calculations and check============================================
  
  
  
  
  }
  
  
  //===START DRAW OBSTACLES==========================================================
  
  //draw flickering flames and candle sticks 
  
  for (int r=0; r<num_boxes-1; r++){ 

    pushMatrix();
    
    ellipseMode(CENTER);
   
    fill(211,211,4);
    
    float random_flame_y = random(10,15);
    float random_flame_x = random(5,14);
   
    candle_flame_cord_x[r] = line_point_mid_x[r];
    candle_flame_cord_y[r] = line_point_mid_y[r];
   
    ellipse( candle_flame_cord_x[r]+random_flame_x , candle_flame_cord_y[r]-random_flame_y, 10, random_flame_y); //USES THE 
   
    fill(230);
    
    rect(line_point_mid_x[r]+3, line_point_mid_y[r]-2, 10, 43);
    
    //start draw midpoints on quad upper edge
    
    fill(0,3,200);
    
    ellipseMode(CENTER);
    
    ellipse( line_point_mid_x[r], 600 - line_point_mid_y[r], 10, 10); //positions and draws the blue midpoint circles
   
    popMatrix(); 
 
  
  }
  
  //------------------------------------------
  

  
  
  


 
 
 //checking for collisions
  
   
  for (int h=0; h<num_boxes-1; h++){ //loops for cycling through the arrays the boxes values are stored in
  
 // println(candle_flame_cord_x[h]);
    
      if (   ((playerX + 20) >= (line_point_mid_x[h])) && ((playerX - 30) <= (line_point_mid_x[h] + 10)) &&  ((playerY + 45) >= (line_point_mid_y[h])) && ((playerY - 20) <= (line_point_mid_y[h])) || ((playerX + 15 >= ((box_x_pos[h]) + (box_widths[h]*2)))) && ((playerX - 15 <= ((box_x_pos[h+1]) - (box_widths[h+1])))) && ((playerY+20) >= (600 - line_point_mid_y[h]) )   ||   (((playerX + (15)) >= ((box_x_pos[h]) - (box_widths[h]/2))) && ((playerX - (45)) <= ((box_x_pos[h]) + (box_widths[h] / 2))) && ((playerY + 30  >= box_y_pos[h]))) ){ 
    //if (  ((playerX + 15 >= ((box_x_pos[h]) + (box_widths[h]*2)))) && ((playerX - 15 <= ((box_x_pos[h+1]) - (box_widths[h+1])))) && ((playerY+20) >= (600 - line_point_mid_y[h]) )   ||   (((playerX + (15)) >= ((box_x_pos[h]) - (box_widths[h]/2))) && ((playerX - (45)) <= ((box_x_pos[h]) + (box_widths[h] / 2))) && ((playerY + 30  >= box_y_pos[h])))  ){
    //if (  (((playerX + (15)) >= ((box_x_pos[h]) - (box_widths[h]/2))) && ((playerX - (45)) <= ((box_x_pos[h]) + (box_widths[h] / 2))) && ((playerY + 30  >= box_y_pos[h])))){ //conditional to check if the balloon is colliding in X with the boxes
      
      c_balloon_base = 255;
        
      break;
        
      }
      
      else{
        
        c_balloon_base = 50;
        
              }
 
                
    }
    

   
    
  
    
//===END COLLISION CHECK --------------------------------------------    



//===START DRAW PLAYER===================================


  
  noStroke();
  
  ellipseMode(RADIUS);
    
  fill (c_balloon_base); //balloon base color
  
  if(c_balloon_base == 255){
    
    println();
    println("COLLISION DETECTED");
    println();
    
  }
  

  else{
    
    println();
    print("NO COLLISION DETECTED");
    println();
  }
    
//===START DRAW PLAYER====================================
    
  ellipse (playerX, playerY, radius, radius);// balloon body shape
  
  fill (color(209,241,225)); //balloon specular color 
  ellipse (playerX-4, playerY-4, 2, 2);  //balloon specular shape
  

//===END DRAW PLAYER============================================

    }


//end draw game--------------

//===ENDS THE GAME========================================================>>>


