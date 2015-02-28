
//defining variables
float a=5;
float b; //variable for the loop
 
//repeats only once
void setup(){
  size(300,300); //sets the screen background
  background(255); //sets the screen background colour
  smooth(); //smooth edges
}
   
//continuously repeats
void draw(){
  frameRate(7); //number of frames displayed every second
  //loop
  //starts at 1, is greater than -60 and decreases by 1
  for(b=3; b>-60; b-=3){
  rectangle(a*5+b*3);
}
     
//this is the rate in which the shape is being shrunk by
a+=5;
   
//this allows the program to make a decision to execute a statement
//if a is greater than 90, then move a back to -50
if (a>70){ //this is the test
  a=-20; //this is the statement
}
}
 
void rectangle(float a){
  //rectangles will be drawn from the centre point
  rectMode(CENTER);
  //this changes the size of the shape
  //a*5 stretches the rectangle out
  //a-8 makes the rectangle move inward
  rect(200, 100, a*5, a-8); 
  //this is the colour of the rectangles created
  fill(random(255), 130, 120);
}

                
                                                                                                                                
