
//int counter;
 


//  counter++;
//  noStroke();
//  fill(random(255),100,255,50);
//   
//  if(mousePressed == true) { //add some interaction
//    ellipse(mouseX, mouseY, 20, 20);
//  }
//  else {
//    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
//  }


//Variables Focus
// String & CHanging NUmbers Easily

//Flot
//Float can hold a number with ecimal points

//INT
// INT or "integer" ( i = ? )

//Boolean
//Very specific type of variable that holds "true" or "false"
//It can be used to test things

// Global Variable and Local Variable
//For loops are local (within the bracket)

//To make a Global variable you decare it outsie he "draw"
//The "negaive space" or outside the main function

//float x;
//float y;
//float w;
//float h;
// *Above Four Are The LONG Method*
// *Lower Is The SIMPLE Method*
//float x,y,w,h;

float x,y,w,h;

void setup() {
                 
  size(800, 800);
  
  x= width/2;
  y= height/2;
  w=100;
  h=100;
}

void draw() { 

  background(112);
  rectMode(CENTER);
//rectangle starts from the center
  stroke(255);
  noFill();
    rect(x,y,w,h);
// "w" on random x, y (x should be smller than y)
// w=random(50,100);
h+=5;
//"h" inceases by 5 picels
if (h> height/2)
// if the "h" is lower than h/2
{
  h=600;
//extent of growth in pixels for "h"
//since it is growing from the cneter, it will stop IF "H" is greater thanh/2 or reapeat if t is still less than h/2
}
  
}

//new one
void mouseReleased(){

  w+=10;
  //everytime you click the mouse, "w" increases by 10 pixels
//  h+=5;
  //everytime you click the mouse, "h" increases by 5 pixels
//w-=100;
  //everytime you click the mouse, "w" decreases by 100 pixels
h-=100;
  //everytime you click the mouse, "h" decreases by 100 pixels


}

