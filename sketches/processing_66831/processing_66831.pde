
//interactive sketch using arrays, for loops and other shit

//Create array of squares in initial gradient, allow them to move with mouse
//interaction and allow user to set color of tiles using rgb color mixer bars



int w = 50;        //column width

int [] xpos = new int [3];            //array to store x position of graph bars 
int [] graphHeight = new int [3];     //array to store height of bars
color [] c = new color [3];           //array to store bar heights (i.e. HSB values)

int [] [] tileXPositionArray = {  {250, 350, 450, 550},
                                  {250, 350, 450, 550},          //to do: set array values to initial tile positions
                                  {250, 350, 450, 550},
                                  {250, 350, 450, 550}  };

int [] [] tileYPositionArray = {  {50, 50, 50, 50},
                                  {150, 150, 150, 150},
                                  {250, 250, 250, 250},
                                  {350, 350, 350, 350}  };

color [] [] tileColorArray = {  {255, 255, 255, 255},
                                {255, 255, 255, 255},
                                {255, 255, 255, 255},
                                {255, 255, 255, 255}  };
//Issue: even though colorMode is set to HSB several times, initialization of array always yields RGB values


//_________________________________________Setup____________________________________________


void setup() {
  frameRate(200);
  background(0);
  size(600,400);
  noStroke();
  smooth();
  fill(255);
//  rect(245, 45, 310, 310);   //white region to create border of large square fill area
  colorMode(HSB, height);
  
// set colors for graph chart (c[0] color is made independently)
  c[1] = color(0,0,height/2);   //color of saturation bar
  c[2] = color(0,0,height);   //color of brightness bar
 
// set initial heights of color bars
  graphHeight[0] = 0;
  graphHeight[1] = height;
  graphHeight[2] = height;

  
  
}




//_________________________________________Draw Loop____________________________________________


void draw() {

//Attempt to fill color array at sketch start to compensate for RGB/HSB issue   
//  if (millis() < 5000) {
//    for(int i = 0; i < 4; i++) {
//      for(int j = 0; j < 4; j++) {
//        color [i] [j] tileColorArray = {  {color(0, height, height), color(100, height, height), color(100, height, height), color(100, height, height)},
//                                        {color(100, height, height), color(150, 150, 150), color(100, height, height), color(100, height, height)},
//                                        {color(100, height, height), color(100, height, height), color(100, height, height), color(100, height, height)},
//                                        {color(100, height, height), color(100, height, height), color(100, height, height), color(100, height, height)}  };
//      }
//    }
//  }
  
//Refresh screen area every draw loop for animated saturation and brightness bars
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(75, 200, w*3, height); 
  
  
//Draw white border around current color window
  fill(0, 0, height);
  rectMode(CENTER);
  rect(175, 200, 35, 35);  
  
//Make colors for Hue bar
    for(int y = 0; y <= height ; y++) {  
      for(int x = 0; x < w; x++) {
        stroke(y, height, height);
        point(x, y);
      }
    }

//Check for mouse inputs in selected regions and store height values in array
  lookForMouse();

//Animate saturation and brightness bars to move
  for(int x = 1; x < 3; x++) {
    xpos[x] = x*w;
    stroke(0, 0, 0);
    fill(c[x]);
    rectMode(CORNER);
    rect(xpos[x], height - graphHeight[x], w, height + graphHeight[x]);
  }
  
//Draw small rectangle to tell user where Hue value is set  
  stroke(0);
  strokeWeight(2);
  fill(0, 0, height, 0);
  rectMode(CENTER);
  rect(25, height - graphHeight[0], 50, 10);
  
//Draw a small rectangle of color to let user know current color selected
  fill(height - graphHeight[0], graphHeight[1], graphHeight[2]); 
  rect(175, 200, 30, 30);
  
//Look for keyboard input to execute behavior (clear screen, etc.)
  keyBoardInput();
  
  
//Draw all tiles using position array and fill with colors from color array
  for(int tileHoriz = 0; tileHoriz < 4; tileHoriz++) {
    for(int tileVert = 0; tileVert <4; tileVert++) {
      //noStroke();
      colorMode(HSB, height);

      stroke(0, 0, height);
      strokeWeight(1);

      fill(tileColorArray[tileHoriz] [tileVert]);
      rectMode(CENTER);
      rect(tileXPositionArray[tileHoriz] [tileVert], tileYPositionArray[tileHoriz] [tileVert], height/4, height/4);
    }
  }





}


//_________________________________________Purgatory____________________________________________

/*
//Use values from HSB bar inputs to fill region
    fill(height - graphHeight[0], graphHeight[1], graphHeight[2]);
    rectMode(CENTER);
    rect(400, 200, 300, 300);

        color [i] [j] tileColorArray = {  {color(0, height, height), color(100, height, height), color(100, height, height), color(100, height, height)},
                                        {color(100, height, height), color(150, 150, 150), color(100, height, height), color(100, height, height)},
                                        {color(100, height, height), color(100, height, height), color(100, height, height), color(100, height, height)},
                                        {color(100, height, height), color(100, height, height), color(100, height, height), color(100, height, height)}  };

*/


//_________________________________________Functions____________________________________________


void keyBoardInput() {
 if(keyPressed == true){
    if(key == ' ') {
      for(int cols = 0; cols < 4 ; cols++) {  
        for(int rows = 0; rows < 4; rows++) {
          tileColorArray [cols] [rows] = 255;
        }
      }
    }
  }
}

//function to look for mouse inputs within HSB bars
void lookForMouse(){
   if(mousePressed) {
     for(int i = 0; i < 3; i++) {
       if(mouseX > i*w && mouseX < (i+1)*w) {
         graphHeight[i] = height - mouseY;
       }
     }
     for(int i = 0; i < 4; i++) {
       if(mouseX > 200 + (height/4)*i && mouseX < 200 + (height/4)*(i+1)) {
         for(int j = 0; j < 4; j++) {
           if(mouseY > (height/4)*j && mouseY < (height/4)*(j+1)) {
             tileColorArray [j] [i] = color(height - graphHeight[0], graphHeight[1], graphHeight[2]);
           }
         }
       }
     }
   }
}
   















