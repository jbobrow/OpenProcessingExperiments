
//Global Variables
float r;  //r starts at 0; r is the radius of the circle
float c = random(13);  //c is used for the color array; the starting color is randomly chosen
color[] palette = {#FF0011, #EE1122, #DD0033, #CC2244, #BB0055, #AA3366,
           #990077, #884488, #770099,  #6655AA, #5500BB, #4466CC,
           #3300DD, #2277EE, #1100FF};

void setup(){
    size(1000, 600);
    background(#000000);
  }

void draw(){
  noFill();
  if (mousePressed == true) {
    
      float increase = random(20, 50);//randomizes how much the radius changes
      strokeWeight(5);
      for (r = random(20); r < random(100, 225); r+= increase){
          stroke(palette[int(c)]); //selects starting color in the color array
          ellipse (mouseX, mouseY, r*2, r*2);
          c ++; //goes to the next colour in the array
              if (c>=13){
                  c=0;  
                  }
              } //end of for loop
          } //end of if loop
  }

