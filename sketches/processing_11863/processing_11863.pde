
/*
Conditional Statements 
In programming we use conditional statements to check weather a certain condition has been met.
This is similar to the for loop however we can be more specific.  
In this example we can check to see if the position of a square is outside the screen and if so do something.
In coding we do this 
if (the condition i.e is the x position of the square more than the width of the screen){
 if so then do something i.e start drawing a new row
}
 if not then do nothing
*/

int Xpos; 
int Ypos; 
int myWidth;
int myHieght; 

void setup() {
  size(610,610);

}
void draw() {
  background(255);

  myWidth = 50;

  myHieght = myWidth;


  Xpos = 10;
  Ypos = 10;

  for(int i = 1; i<=100; i++){

    fill(i*2,i*2,180);
 
    rect(Xpos,Ypos,myWidth,myHieght);

    Xpos = Xpos+myWidth+10;
 //this conditional is checking the edge of the window and moving the Ypos down the screen
    if (Xpos >= width){
     // this is updating the Ypos
      Ypos = Ypos+myHieght+10; 
  // this resets the Xpos so it can draw a new line 
      Xpos = 10;
    }
  }
}

