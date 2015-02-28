
//Project 1
//Title: Passing time and moods
//created by dan hawkins, sept 25th 2012
//drhawkin@sfu.ca

/* The following is a mood map diary of one day. In the frame, one cell/block is 
added every minute, with a particular color corresponding to mood, until the frame is
filled up with 1440 cells/blocks (1440 minutes - the number of minutes in a day. 
The user can control the color of the cells by entering 1, 2, 3 or 4 on the keyboard, at any
time throughout the day. Each color correspondes to a particular mood you are feeling.
The point of this program is to record your each day (and mood) in a diary like calendar.
Enjoy!
*/



          /* 
          color based on the rainbow
          1 = blue = sad
          2 = green = kind of sad
          3 = yellow = kind of happy
          4 = red  = very happy
          */

//Miles - please adjust the frameRate for viewing and marking purposes (for instance frameRate = 200)


// BEGING PROGRAM! 


// 2D Array of objects
Cell[][] grid; // declare an initialize a 2D array

// Number of columns and rows in the grid
int cols = 40;
int rows = 36;
//int currentMinute = 0; //variables not used at the moment -- talk with Miles
//int m = minute(); //variables not used at the moment -- talk with Miles

color[] Bpalette = new color[7]; // color array for Bpalette (blue)
 
color[] Gpalette=new color[7]; // color array for Gpalette (green)

color[] Ypalette=new color[7]; // color array for Ypalette (yellow)

color[] Rpalette=new color[7]; // color array for Rpalette (red)

color c; // intitalizing c (color)

int currentPalette = '1'; //setting the initial (and current) palette to 1 (blue palette)


void setup() {
  background(255); // white background
  size(400,360); // set size so a 10by10 cell can fit 1440 times-- 36x40 (the number of minutes in 24 hours)
  frameRate(600); // set frame rate at 100 frame per second. 
                  // Normally, my clock should have a frame rate of 1, so that 
                  // in each hour the canvass will be filled by 1440 cells
                  // but bc this is a long process, i have speed up the framerate for 
                  // visual processes
  
      //array for Bpallete (blue) to call when key 1 is pressed
      Bpalette[0]=color(0,127,255);
      Bpalette[1]=color(3,180,200);
      Bpalette[2]=color(99,184,255);
      Bpalette[3]=color(30,144,255);
      Bpalette[4]=color(24,116,205);
      Bpalette[5]=color(0,191,255);
      Bpalette[6]=color(0,191,255);
      
     //array for Gpallete (green) to call when key 2 is pressed
    Gpalette[0]=color( 2,157,116);
    Gpalette[1]=color(0,255,127);
    Gpalette[2]=color(0,205,102);
    Gpalette[3]=color(144,238,144);
    Gpalette[4]=color(0,238,118);
    Gpalette[5]=color(154,255,154);
    Gpalette[6]=color(0,205,0);
    
    //array for Ypallete (yellow) to call when key 3 is pressed
    Ypalette[0]=color(238,238,0);
    Ypalette[1]=color(238,201,0);
    Ypalette[2]=color(255,215,0);
    Ypalette[3]=color(219,219,112);
    Ypalette[4]=color(255,255,51);
    Ypalette[5]=color(255,255,204);
    Ypalette[6]=color(255,255,153);
    
    //array for Rpallete (red) to call when key 4 is pressed
    
    Rpalette[0]=color(238,92,66);
    Rpalette[1]=color(238,92,66);
    Rpalette[2]=color(255,99,71);
    Rpalette[3]=color(255,69,0);
    Rpalette[4]=color(238,59,59);
    Rpalette[5]=color(166,42,42);
    Rpalette[6]=color(139,35,35);
      
 
  
  grid = new Cell[cols][rows]; // create an object called Cell that is a grid array (2D array) 
  // i and j variables are assigned to [cols] [rows] respectively
  for (int i = 0; i < cols; i++) {// loop for i, going horizontal across, x,
    for (int j = 0; j < rows; j++) {// nested loop, going vertically down, y,
      // Initialize each object
       grid[i][j] = new Cell(i*10,j*10,10,10,c);
      } //end first loop
    }//end first loop
  }//end setup

void draw() { // function draw
  
    //if (m==currentMinute) // minute operation not working - I wanted to talk to Miles about this
   if (frameCount  % 60 ==0 ) { // if the frameCount( which is equal to the framerate (second)) is divisble by 60
                             // then draw the following -- ie every 60 seconds, execute the draw function 
       
       
       
       int randomValue = int(random(7));
     
      if (keyPressed) //NOTE: You may have to hold DOWN key to get a response, bc of framerate
    
      {
    
        currentPalette = key; // palette will be assigned to key number
        
          /* 
          color based on the rainbow
          1 = blue = saddest
          2 = green = kind of sad
          3 = yellow = kind of happy
          4 = red  = happiest
          */

        
        
     } 
       
   if (frameCount == 360*60) {
      saveFrame("6hr.png");
    }
  
    if (frameCount == 720*60) {
      saveFrame("12hr.png");
    }
    
    if (frameCount == 1080*60) {
      saveFrame("18hr.png");
    }
    
     
    if (frameCount == 1440*60) {
      saveFrame("24hr.png");
    }
    
  
     if (currentPalette == '1') // when 1 is pressed, use Blue palette
     {
        color randomColor = Bpalette[ randomValue ];
        
        c = randomColor;
      
      }
      if (currentPalette == '2')  // when 2 is pressed, use Green palette
      {
        
        color randomColor = Gpalette [randomValue];
         c = randomColor;
      }
      if (currentPalette == '3') // when 3 is pressed, use Yellow palette
      {
       
       color randomColor = Ypalette [randomValue];
       c = randomColor;
      }
       if (currentPalette == '4')// when 4 is pressed, use Red palette
       {
         color randomColor = Rpalette [randomValue];
         c = randomColor;
       }
       
       /// check if block is alive (alive, meaning does not exist)
        int randomX = int(random(40));
        int randomY = int(random(36));
        
        while(grid[randomX][randomY].alive == true) // if blow does not exist, then:
        {
          randomX = int(random(40)); //find new Xposition and
          randomY = int(random(36)); // find new Yposition
        }
        
        
        //reference .turnOn, and execute instruction
       grid[randomX][randomY].turnOn();  // execute function
       grid[randomX][randomY].c = c; //color will stay static, not change each time
        
   
  for (int i = 0; i < cols; i++) { // loop for i, going horizontal across, x, 
    for (int j = 0; j < rows; j++) { // nested loop, going vertically down, y,
     //display object
     
      grid[i][j].display(); // display 2D array grid -- reference .display and execute instruction
      }
      }
    }
    
   
    
    
  }//end draw



  // Cell object
  class Cell {
    // each cell object is given a location in the grid, and a size and color with the variables x,y,w,h.
    float x,y;   // x,y location
    float w,h;   // width and height
    int c; // color of cell
    boolean alive; // should one of the cells turn "On", yes (alive) or no (not alive)
  
  //Constructor, with each property assigned
  Cell(int xpos, int ypos, int xlength, int ylength, int col) {
      x = xpos;
      y = ypos;
      w = xlength;
      h = ylength;
      c = col;
      alive = false;
    } // end constructor
  


  void display() { // Method (function) that orders display: 
  
      if (alive == true) { // if alive, then do the following: 
      
      
      
      noStroke(); // no stroke
       
       
       fill(c); //fill with color c, current palette
       
      rect(x,y,w,h); // parameters of the cell
        }// end if statement
    
    }// end display method
  
  // Method (function), if the cell is "alive", value is "true", and turnOn function is given
  void turnOn() {
    alive = true;
  }//end method
}


//note: there are still additions I want to make to this project in the future


