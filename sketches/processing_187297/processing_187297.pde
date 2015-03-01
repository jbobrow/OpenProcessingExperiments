
/* 
   The purpose of this sketch was to develop a mechanism where colour changes incrementally with time, and each value can be fine-tuned or altered
   in order to provide greater customisation to the rhythm of the colour cycle. This is an early state, where it only cycles between black and
   white in an equal ratio, but it could be quite easily adapted to change to cycle through different colours. 
   
   The first 2 lines of the draw() are adapted from Chapter 3 of LEARNING PROCESSING by Daniel Shiffman (page 38, exercise 3-7)
*/

int i;                                      // declares int i (global scope?)
int j;                                      // declares int j
int k;                                      // declares int k
int l;                                      // declares int l

void setup() {
  size(400,400);                            // sets size of window
  background(255);                          // sets initial BG colour
  stroke(0);                                // sets initial stroke colour
  smooth();                                 // enables aliasing
  i = 0;                                    // sets i to 0
  j = 0;                                    // sets j to 0
  k = 255;                                  // sets k to 255
  l = 0;                                    // sets l to 0
}

void draw() {
  strokeWeight(abs(mouseX-pmouseX)/3);      // weight of line is a third absolute mouse velocity
  line(pmouseX,pmouseY,mouseX,mouseY);      // line is drawn from previous points to last points to create flowing line
  i++;                                      // every draw loop, i increases
  if(i>0){
    j++;                                    // if i = 1, j increases by 1 
    i = 0;                                  // i then resets to 0
  }                                         // this means that j increases every other frame
  stroke(j);                                // stroke colour is the value for j
  
  if(j>254){                                // if at any point, j reaches 255, 
    stroke(k);                              // stroke colour changes to k
    l++;                                    // and l increases
    if(l>0){                                
      k--;                                  // if l = 1, k decreases by 1
      l = 0;                                // l then resets to 0
    }                                       // this means that k decreases every other frame
  }
  if(k<1){                                  
    j = 0;                                  // if (or is that when?) k = 0, j resets to 0
    stroke(j);                              // stroke colour changes back to j
    k = 255;                                // k is returned to 255
  }
}



