
/*
 Judy Jheung 
 September, 2012
 This is a conceptual time clock that runs on a 60 second cycle loop. Each second is indicated by turning squares, 
 one at a time at a 45% angle. This specific design suggests the fleeting and unattainable nature of time.  
 When mouse roll over on the top right hand corner, users can see a digital clock running in real-time. */

int beginning; //declare a global variable "begining" that represents the beginning of a sequence.
boolean reset=false; //declare a boolean conditaional expression with a value of false

Square [] squares; //Initialize Square array 
void setup () {  //set up
 size (640, 400); //Sketch frame size
  beginning = second();  //beginning the loop cycle in second
  squares = new Square [60]; //call the constructor, reference and declare a new square
 
  int currentx=0; // declare a variable named "currentx" of type int and assign it the value of 0
  for (int i=0; i <60; i++) //Use for loop starting 0, add one each time to the varialbe i while i is less than 60 
  { 
    squares [i]=new Square ();//update and reference the new Class object and assign value i in the array
    squares [i].y =height/2;// call the object, squares and position them at half of the y axis 
    squares [i].rotation =0; //call the object, squares and update the coordinate system of rotations as value 0  
    squares [i].visible =true; //if the squares are visible, the boolean expression is true 
    squares [i].x=currentx; //call the object, squares and update current position
    currentx=currentx+10;// The squares are 10 pixels apart
  }
}
void resetSquares() { //reset squares sequence
  for (int i =0; i < 60; i++) //Use for loop to reset the same repitition
  { 
    squares[i].rotation = 0; //call the object, squares and update the rotation sequence
  }
} 
void draw () { //initiate action
  if (beginning == second() && reset == false) //when second is equal beginning and when reset is equal false
  {
    resetSquares(); 
    reset = true; //Reset the object squares loop
  }
  if (second() == beginning + 1) //When second is equal to beginning plus one 
  {
    reset = false; //then reset is false
  }
  int s=second ();  //initialize the value of second to s
  squares[s].rotation+=1; // Assign value 1 to object squares and rotation system with the value of s array
  background (#960707); //background color red

  for (int i=0; i< 60; i++) //declare 0 to interger i, i is smaller than 60 and 1 is added to each variable i 
  {
    fill (i); // fill color using i which is 0 
    squares [i].drawSquare (); //Update Class object function with i value in the array
  }
}
void  mouseMoved() //mouse rolls over
{
  String time = hour() + ":" + minute() + ":" + second() ;//setting the text of time clock
  text(time, 560, 50); //location of time clock
}



