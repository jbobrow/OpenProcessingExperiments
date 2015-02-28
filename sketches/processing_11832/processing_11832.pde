
//The Set Up - This the basic code that you will require 

/*
Using Comments 
In the example below I have written comments next to the lines of code to help explain what is happening.  
You don’t want the computer to read the comments so we use to forward slashes in front of the text 
Like this //
Or we can put blocks of text in side these /* */




// The code inside setup() runs when the program first opens 
void setup (){

  //size() set the size of the window.  In this example the window is 600 pixels by 600 pixels   
  size(600,600);

}

// The code inside draw() runs continuously.  This is for animation and interaction   
void draw (){
  /*
   this is the method for setting the background colour
   It is put in side the draw method so it can be updated continuously
   We have set the colour value to 0 which is black.  
   You could use any value from 0 to 255 i.e from black to white and all of the grey values in between 
   */

  background (0); 
  
  // drawing a rectangle in the middle of the screen 
  rect (250,250,50,50);

}

/*
 Methods are a programming concept.  
 They are a list of instructions that allow us to do things within the programming environment.  
 An example of a Method is this - rect () this is a method for drawing a rectangle.  
 They are important part of programming.  
 You can write your own methods however many are prewritten by the people who developed the 
 programming language and it is many of these that we will learn how to use first. 
*/






