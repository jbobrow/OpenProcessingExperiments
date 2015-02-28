
//first define the variables 
float a=1;
float b; //the variable for the loop
 
//repeats this loop once
void setup(){
  size(400,220); // screen background color 
  background(872,237,872); //sets the screen background colour
  smooth(); //smooth edges or Anti-aliasing 
}
   
//continuously repeats
void draw(){
  frameRate(30); //# of frames displayed every second
  //the loop to create shapes
  //starts at 1, is greater than -80 and decreases by 1
  for(b=1; b>-80; b-=1){
  rectangle(a*1+b*1);
}
     
//the rate in which the shape is being shrunk by
a+=1;
   
//this allows the program to make a decision to execute a statement
//if a is greater than 80, then move a back to -30
if (a>80){ //the test of the motion loop  
  a=-30; //the statement of the motion loop
}
}
 
void rectangle(float b){
  //rectangles will be drawn from the centre point of the screen 
  rectMode(CENTER);
  //this changes the size of the shape and its positioning 
  //a*5 stretches the rectangle 
  //a+8 makes the rectangle move outward
  rect(200, 110, a*5, a+80); 
  // colour of the rectangles created, (the fill and random color_ 
  fill(random(255), 300, 89);
}
                
