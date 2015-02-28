
// Nathen McVittie
// Creative Computing
// 03/04/13

int timeElapsed;

int i = 0;

int fps = 30;  // frames per second

//Hour
int millisHour = millis()/3600000;
//Minute
int millisMin = millis()/36000;
//Second
int millisSec = millis()/1000;


int hours = 0;
int mins = 0;
int secs = 0;

int small_bulb_width = 25;
int small_bulb_height = 25;


//Hour light position variables
// there should be 60 lots of coordinates for each second
int[][] secs_co = {  {785, 572},  // first second
                     {760, 576},  // second second
                     {733, 579},  // third second
                     {706, 583},  // etc..
                     {681, 586},
                     {654, 588},
                     {626, 591},
                     {600, 592},
                     {574, 594},
                     {550, 596},
                     {525, 598},
                     {500, 600},
                     {475, 602},
                     {448, 604},
                     {422, 606},
                     {396, 608},
                     {375, 740},
                     {350, 735},
                     {325, 730},
                     {300, 725},
                     {275, 720},
                     {250, 715}      
                   };

// there should be 60 lots of coordinates for each minute
int[][] mins_co = {  {70, 70},  // first minute
                     {100, 100},  // second minute
                     {130, 130},  // etc..
                     {160, 160},
                     {190, 190},
                     {220, 220}  
                   };

// there should be 12 lots of coordinates for each hour!
int[][] hours_co = { {100, 100},  // first hour
                     {120, 120},  // second hour
                     {140, 140},  // etc...
                     {160, 160},
                     {180, 180},
                     {200, 200}  
                   };
                   
//Declare image variable
PImage bg;

void setup() {
  //Set up the canvas
  size(800, 800);
  smooth();
  
  //Load BG image
  bg = loadImage("LightBG.png");

}

void draw() {
  //Print Time elapsed in seconds  
  secs++;
  
   if((secs % fps) == 1){ // 1 second
     image(bg, 0, 0);
     println(i);
     
     fill(255, 255, 0);     
     
     // every 60 seconds, light up the next minute bulb
     if(i==60){
       i=0; // reset seconds to zero after 60 seconds
       mins++;  // increment minutes
     }
     ellipse(secs_co[i][0], secs_co[i][1], small_bulb_width, small_bulb_height);
     
     // every 60 minutes, light up the next hour bulb
     if(mins==60){
       mins=0; // reset minutes to zero
       hours++; 
     }
     
     fill(195, 100, 74);    // minute bulbs are red
       
     // turn on next minute bulb
     ellipse(mins_co[mins][0], mins_co[mins][1], small_bulb_width, small_bulb_height);
     
     
     // every 12 hours, start again
     if(hours == 12){
       hours = 0;  // reset hours to zero
     }
     
     
     fill(135, 162, 210);  // hour blubs are blue 
           
     // turn on next hour bulb
     ellipse(hours_co[hours][0], hours_co[hours][1], small_bulb_width, small_bulb_height);
       
       
     i++;
   }
}


