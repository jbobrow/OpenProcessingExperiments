
//Assignment using a for loop
//The if loop ensures that this program loops through 100 times.
/*Within the if loop, a for loop draws 5 sets of concentric circles.
  The starting colour, the increase of radius and the size of 
  the largest circle are randomized. */
/*I love symmetry, but I wanted the sketch to be different each
  time, so I added some random factors. I also wanted something that was
  fun to watch. This isn't that entertaining, but it's a start.*/
/*Note: This program runs for 4 seconds and then stops.*/


//Global Variables
float r;  //x starts at 0; x is the radius of the circle
float c = random(13);  //c is used for the color array; the starting color is randomly chosen
color[] palette = {#FF0011, #EE1122, #DD0033, #CC2244, #BB0055, #AA3366,
           #990077, #884488, #770099,  #6655AA, #5500BB, #4466CC, 
           #3300DD, #2277EE, #1100FF};
int count = 0; //this is used to count 100 times for the if loop


void setup(){
size(1000, 600);
background(#000000);
}

void draw(){
   
  strokeWeight(3);
  noFill();
  frameRate(25); //runs through the if loop 25 times per second
  
  if (count <100){
      float increase = random(20, 50);//randomizes how much the radius changes
      
      /*initial radius is less than 20, outer radius is between
      100 and 225, increase of radius randomized (see above)*/
      for (r = random(20); r < random(100, 225); r+= increase){
          //five sets of concentric circles are drawn 
          /*The  are changed for each circle and the size of the circle
            also changed because it is always double the x and y values.*/
          stroke(palette[int(c)]); //selects starting color in the color array
          ellipse (width/5, height/4, r*2, r*2);
          ellipse (width*4/5, height*3/4, r*2, r*2);
          ellipse (width/5, height*3/4, r*2, r*2);
          ellipse (width*4/5, height/4, r*2, r*2);
          ellipse (width/2, height/2, r*2, r*2);
      
          c ++; //goes to the next colour in the array
      
          //println(c); //to debug while testing
          //println(increase);  //to debug while testing
          //println(r);  //to debug while testing
      
              /*ensures that when the end of the colour array is reached it 
                goes back to the beginning*/
              if (c>=13){
                  c=0;  
                  } 
              } //end of for loop
      
      /*keeping track of how many times the if loop is looped
        to make it run infinitely comment this out*/        
      //count ++; 
      
          } //end of if loop
  
      } //end of draw
  
