
// loops

/*
Loops are a very common way to get the computer to do mundane tasks repeatedly.  In this example, drawing squares.   
When you run the program you will see that it draws ten squares.  
However instead of writing the rect (); code 10 times to draw 10 suares and the Fill code 10 times to create a gradient of colour we use a for loop.   
A for loop will continually run a piece of code until a condition is met.  In this case we run the rect(); method 10 times. 
In practice this looks like this:- 

for (the condition i.e checking to see if a variable has exceeded a certain value) {
The code you want to execute i.e drawing rectangles
}

*/


int Xpos; // this is setting up a variable for the x position of the rectangles 
int Ypos; // this is setting up a variable for the y position of the rectangles 
int myWidth; // this is setting up a variable for the width of the rectangles 
int myHieght; // this is setting up a variable for the height of the rectangles 

void setup() {
  size(610,610);

}
void draw() {
  background(255);

  myWidth = 50;

  myHieght = myWidth;


  Xpos = 10;
  Ypos = 10;
  
  // the for loop is drwaing 10 squares
  // the loop works like this.  We create a variable called i.  We then check to see if the value of i = 10
  // if it doesn't we then run through and execute the code.  However every time we run the loop we are adding 1 to i
  // this is written as i++ so eventually you will get to 100 and the loop will stop and you will have executed the code 100 times

  for(int i = 1; i<=10; i++){
 // they are being filled with the value of i multiplied by 2
    fill(i*20,i*20,180);
// the rectangle whose variables are updated every time the loop runs which in this example is 100 times
    rect(Xpos,Ypos,myWidth,myHieght);
 // this is updating the Xpos variable
    Xpos = Xpos+myWidth+10;


  }
}

//Have a go at drawing 10 rectangles that run horizontally down the screen.  Then have a go at drawing 10 rectangles that are running diagonally 








