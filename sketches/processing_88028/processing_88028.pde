
//Name: Andrew Foresman
//Class: ITGM_315
//Date: Winter 2013
//Title: Assignment 2




beaver chip;

float tail_rot=0;
float arm_rot=0;
  


void setup(){
 
  size(800,800); 

  chip = new beaver("chip", tail_rot);  
  
}

void draw(){
  
  background(255);
  smooth();
  
  //calculates the angle of rotation to be used on the tail based on mouseX
  float screen_percentx = (mouseX/80);
  tail_rot = (((screen_percentx*.1)-.5)*-1);
  //println(tail_rot);


  //calculates the angle of rotation for the arms based on mouseY
  float screen_percenty = (mouseY/80);
  arm_rot = (((screen_percenty*.1)-.5));
  println(arm_rot);




  chip.display();

}


  



