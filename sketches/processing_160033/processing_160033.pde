
//Global Variables
int x;  //x starts at 0
int y;  //y starts at 0
int c;  //c is used for the color array; the starting color is randomly chosen
color[] palette = {#FF0011, #EE1122, #DD0033, #CC2244, #BB0055, #AA3366,
           #990077, #884488, #770099,  #6655AA, #5500BB, #4466CC, 
           #3300DD, #2277EE, #1100FF};

void setup(){
size(600, 600);
background(#000000);
frameRate(2); //this makes the draw run twice per second so the sketch draws more slowly


}

void draw(){
  
  stroke(palette[int(c)]); //selects first color in the color array
  noFill();
  
  //four circles are drawn for each cycle through the if loop
  /*The x and y values are changed for each circle and the size of the circle
  also changed because it is always double the x and y values.*/
  ellipse (x, y, x*2, y*2);
  ellipse (width-x, height-y, x*2, y*2);
  ellipse (x, height-y, x*2, y*2);
  ellipse (width-x, y, x*2, y*2);
    if (x < width){
      x += random(40, 60);
      y += random(20, 70);
      c ++;
      if (c==14){
        c=0;  // to go back to the beginning of the array
      }
      strokeWeight(x/50); //the strokeWeight gets thicker with each circle
      //print (x);  //this just helps me to see how many times the if loop runs
    }
  
  

  }
  
  
 





