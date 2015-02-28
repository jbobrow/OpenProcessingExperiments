
//
/*
Variables are fundamental to computer programming.  
They are use to store data which can be changed altered both as we right the program and as the program is running.  
Lets us look at an example 
*/

/*
These are what we call variable declarations.  
When declaring a variable it is important to describe what kind of data they are.
In this example we declaring whole numbers which are known as integers.
We use the would int to tell the program what Data Type we are using  
For more about Data Types see 
http://download.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html
http://en.wikipedia.org/wiki/Data_type

*/

// when writing a variable you make up the names

int Xpos; // this is setting up a variable for the x position of the rectangles 
int Ypos; // this is setting up a variable for the y position of the rectangles 
int myWidth; // this is setting up a variable for the width of the rectangles 
int myHieght; // this is setting up a variable for the hieght of the rectangles 

void setup() {
  size(600,600);

}
void draw() {
  background(255);
  // we are know giving our  myWidth varriable a value.  
  //If you change this then you will change the size of all of the squares
  myWidth = 50;
  // this is setting the value of myHieght.  We want a square so we can set it to what ever value is set for myWidth
  // so we only have to change myWidth to change the height.  Thats programming! 
  myHieght = myWidth;


  rect(10,10,myWidth,myHieght);
  rect(100,10,myWidth,myHieght);
  rect(200,10,myWidth,myHieght);
  
  // you will notice that only the size of the square changes if you  change the myWidth value
  //Try changing it to 100 for example 
  
  // lets try adding some values to our Xpos and Ypos variables
  
  Xpos = 10;
  Ypos = 100;
  
  // we will know use Xpos and Ypos as the x and y position
   rect(Xpos,Ypos,myWidth,myHieght);
  
  // we are know going to update the Xpos variable to create a x position for another rectangle
  // the origanal value is 10 to which we are going to add the width of the quare plus a gap of 10
 // in other words Xpos = Xpos+myWidth+10; would look like this Xpos = 10+50+10 
 
    Xpos = Xpos+myWidth+10;
 // xpose know equals 70 so when we draw a new rectangle its x position is 70
 
   rect(Xpos,Ypos,myWidth,myHieght);
 
 // so all we need to do know is copy and past this text to create more squares  
   Xpos = Xpos+myWidth+10;
   
   rect(Xpos,Ypos,myWidth,myHieght);
      
   Xpos = Xpos+myWidth+10;
   
   rect(Xpos,Ypos,myWidth,myHieght);
   
 // now have a go at changing the value for  myWidth to see what happens 
}


/*Note:  You will notice that we have been using the + and = symbols.
In computing they are known as Operators - Other ones include < > == etc 
get to know them as they are very important.
http://download.oracle.com/javase/tutorial/java/nutsandbolts/opsummary.html
http://download.oracle.com/javase/tutorial/java/nutsandbolts/operators.html
*/






